const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const multer = require("multer")
const {decodeToken} = require("../middleware/index")

const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, 'images/especeAnimaux')
    },
    filename: function(req, file, cb){
        cb(null, file.originalname)
    }
})

const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png'){
        cb(null, true)
    }
    else {
        cb(null, false)
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 5
    },
    fileFilter: fileFilter
})

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllEspeceAnimals)
app.get("/:id", controller.getEspeceAnimalId)
app.post("/", decodeToken, upload.single('imageEspece') ,controller.insertEspeceAnimal)
app.put("/:id", decodeToken, upload.single('imageEspece'), controller.updateEspeceAnimal)
app.delete("/:id", decodeToken, controller.deleteEspeceAnimal)

module.exports = app
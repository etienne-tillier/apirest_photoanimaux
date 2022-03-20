const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const multer = require("multer")

const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, 'images/photos')
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



app.get("/", controller.getAllPhotos)
app.get("/:id", controller.getPhotoId)
app.post("/",upload.single("imagePhoto"), controller.insertPhoto)
app.put("/:id", controller.updatePhoto)
app.delete("/:id", controller.deletePhoto)

module.exports = app
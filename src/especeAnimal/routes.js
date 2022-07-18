const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const multer = require("multer")
const {decodeToken} = require("../middleware/index")
const {cloudinary} = require("../config/cloudinary")

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


const newUploadEspece = async (req, res) => {
    let secureUrl
    if (req.file) {
        try {
        const fileStr = req.file.path
        const uploadedResponse = await cloudinary.v2.uploader.upload(fileStr, {
            upload_preset: 'addEspece',
            use_filename: true,
        })
        console.log(uploadedResponse)
        secureUrl = uploadedResponse.secure_url
        }   catch (error){
            console.log(error)
         }
    } 
    else {
        secureUrl = req.body.imageEspece
    }
    if (req.route.stack[0].method == "post"){
        controller.insertEspeceAnimal(req,res,secureUrl)
    }
    else {
        controller.updateEspeceAnimal(req,res,secureUrl)
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
app.post("/", decodeToken, upload.single('imageEspece'), newUploadEspece)
app.put("/:id", decodeToken, upload.single('imageEspece'), newUploadEspece)
app.delete("/:id", decodeToken, controller.deleteEspeceAnimal)

module.exports = app
const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const multer = require("multer")
const fs = require("fs")
const { cloudinary } = require("../config/cloudinary")


const storage = multer.diskStorage({
    destination: function(req, file, cb){
        console.log(req.body)
        var dir = 'images/photos'
        if (!fs.existsSync(dir)){
            fs.mkdirSync(dir);
        }
        cb(null, 'images/photos')
    },
    filename: function(req, file, cb){
        cb(null, req.body.uid + "-" + req.body.idsortie + "-" + file.originalname)
    }
})

const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png' || file.mimetype === 'image/jpg'){
        cb(null, true)
    }
    else {
        cb(null, false)
    }
}

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 15
    },
    fileFilter: fileFilter
})

const newUploadImage = async (req, res) => {
    try {
        const fileStr = req.file.path
        console.log("body")
        console.log(req.body)
        console.log("filepath")
        console.log(req.file)
        const uploadedResponse = await cloudinary.v2.uploader.upload(fileStr, {
            upload_preset: 'addSortieImage',
            use_filename: true,
        })
         // req.file.destination + "/" + req.body.idsortie + "-" + req.file.originalname,
        console.log(uploadedResponse)
        if (req.route.stack[0].method == "post"){
            controller.insertPhoto(req,res,uploadedResponse.secure_url)
        }
        else {
            controller.updatePhoto(req,res,uploadedResponse.secure_url)
        }
    }   catch (error){
            console.log(error)
    }
}

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllPhotos)
app.get("/:id", controller.getPhotoId)
app.post("/", upload.single("imagePhoto"), newUploadImage)
app.put("/:id", controller.updatePhoto)
app.delete("/:id", controller.deletePhoto)

module.exports = app
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
        var dir = 'images/photos/' + req.body.uid;
        if (!fs.existsSync(dir)){
            fs.mkdirSync(dir);
        }
        cb(null, 'images/photos/'+ req.body.uid)
    },
    filename: function(req, file, cb){
        cb(null, req.body.idsortie + "-" + file.originalname)
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

const newUploadEspece = async (req,res) => {
    try {
        const fileStr = req.body.data
        const uploadedResponse = await cloudinary.uploader.upload(fileStr, {
            upload_preset: 'addEspece'
        })
        console.log(uploadedResponse)
        res.json({ msg : "worked"})
    }   catch (error){
            console.log(error)
            res.status(500).json( {msg : "Something went wrong" })
    }
}

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllPhotos)
app.get("/:id", controller.getPhotoId)
app.post("/", upload.single("imagePhoto"), controller.insertPhoto)
app.put("/:id", controller.updatePhoto)
app.delete("/:id", controller.deletePhoto)

module.exports = app
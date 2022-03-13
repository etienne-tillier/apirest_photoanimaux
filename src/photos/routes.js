const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllPhotos)
app.get("/:id", controller.getPhotoId)
app.post("/", controller.insertPhoto)
app.put("/:id", controller.updatePhoto)
app.delete("/:id", controller.deletePhoto)

module.exports = app
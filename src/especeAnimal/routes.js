const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllEspeceAnimals)
app.get("/:id", controller.getEspeceAnimalId)
app.post("/", controller.insertEspeceAnimal)
app.put("/:id", controller.updateEspeceAnimal)
app.delete("/:id", controller.deleteEspeceAnimal)

module.exports = app
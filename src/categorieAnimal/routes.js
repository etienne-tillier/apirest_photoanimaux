const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllCategoriesAnimal)
app.get("/:id", controller.getCategorieAnimalId)
app.post("/", controller.insertCategorieAnimal)
app.put("/:id", controller.updateCategorieAnimal)
app.delete("/:id", controller.deleteCategorieAnimal)

module.exports = app
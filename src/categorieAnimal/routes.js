const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const {decodeToken} = require("../middleware/index")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllCategoriesAnimal)
app.get("/:id", controller.getCategorieAnimalId)
app.post("/", decodeToken, controller.insertCategorieAnimal)
app.put("/:id", decodeToken, controller.updateCategorieAnimal)
app.delete("/:id", decodeToken, controller.deleteCategorieAnimal)

module.exports = app
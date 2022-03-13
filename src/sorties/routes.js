const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllSorties)
app.get("/:id", controller.getSortieId)
app.post("/", controller.insertSortie)
app.put("/:id", controller.updateSortie)
app.delete("/:id", controller.deleteSortie)

module.exports = app
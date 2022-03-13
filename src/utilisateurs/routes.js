const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", controller.getAllUtilisateurs)
app.get("/:id", controller.getUtilisateurId)
app.post("/", controller.insertUtilisateur)
app.put("/:id", controller.updateUtilisateur)
app.delete("/:id", controller.deleteUtilisateur)

module.exports = app
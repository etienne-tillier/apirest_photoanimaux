const controller = require("./controller")
const express = require("express")
const app = express()
const cors = require("cors")
const {decodeToken} = require("../middleware/index")

//middleware
app.use(cors())
app.use(express.json()) //req.body



app.get("/", decodeToken, controller.getAllUtilisateurs)
app.get("/:id", decodeToken, controller.getUtilisateurId)
app.post("/", controller.insertUtilisateur)
//app.put("/:id", decodeToken, controller.updateUtilisateur)
//app.delete("/:id", decodeToken, controller.deleteUtilisateur)

module.exports = app
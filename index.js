const express = require("express")
const app = express()
const cors = require("cors")
const userRoutes = require("./src/utilisateurs/routes")
const especeAnimalRoutes = require("./src/especeAnimal/routes")
const photoRoutes = require("./src/photos/routes")
const sortieRoutes = require("./src/sorties/routes")
const categorieAnimalRoutes = require("./src/categorieAnimal/routes")


//middleware
app.use(cors())
app.use(express.json()) //req.body
//ROUTES//

app.use("/images/especeAnimaux",express.static("images/especeAnimaux"))

app.use("/utilisateurs", userRoutes)
app.use("/especeAnimal", especeAnimalRoutes)
app.use("/photos", photoRoutes)
app.use("/sorties", sortieRoutes)
app.use("/categorieAnimal", categorieAnimalRoutes)


app.listen(5000, () => {
    console.log("server has started on port 5000 ! ")
})
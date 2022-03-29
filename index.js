const {decodeToken} = require("./src/middleware/index")
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


app.use("/images/especeAnimaux",express.static("images/especeAnimaux"))
app.use("/images/photos",express.static("images/photos"))

app.use("/utilisateurs", userRoutes)
app.use("/especeAnimal", especeAnimalRoutes)
app.use("/photos", decodeToken, photoRoutes)
app.use("/sorties", decodeToken ,sortieRoutes)
app.use("/categorieAnimal", categorieAnimalRoutes)




// app.listen(5000, () => {
//         console.log("server has started on port 5000 ! ")
//     })

app.listen(process.env.PORT || 5000, () => {
    console.log("server has started on port 5000 ! ")
})
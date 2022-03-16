const queries = require("./queries");
const pool = require("../../db");


//get all categorieAnimal
const getAllCategoriesAnimal = async (req,res) => {
    try {
        const allCategoriesAnimal = await pool.query(queries.getCategorieAnimal)
        res.status(200).json(allCategoriesAnimal.rows)
    } catch (err) {
        console.error(err.message)
    }
}


//get a categorieAnimal by id
const getCategorieAnimalId = async (req,res) => {
    try {
        const categorieAnimal = await pool.query(queries.getCategorieAnimalId, [
            req.params.id
        ])
        res.status(200).json(categorieAnimal.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


// update a categorieAnimal by id
const updateCategorieAnimal = async (req,res) => {
    try {
        const {nomcategorie} = req.body
        const categorieAnimalUpdated = await pool.query(queries.updateCategorieAnimal , [
            nomcategorie,
            req.params.id
        ])
        res.status(200).send("categorieAnimal updated ! ")
    } catch (err) {
        console.error(err.message)
    }
}


// insert a new categorieAnimal
const insertCategorieAnimal = async (req,res) => {
    try {
        const { nomcategorie } = req.body
        //suffit pour l'ajout sur la bd
        const newUser = await pool.query(queries.insertCategorieAnimal, [
            nomcategorie
        ])
        //envoi sur l'api
        res.status(200).json(newUser.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


//delete a categorieAnimal by id
const deleteCategorieAnimal = async (req,res) => {
    try {
        const categorieAnimalDeleted = await pool.query(queries.deleteCategorieAnimal, [
            req.params.id
        ])
        res.status(200).send("categorieAnimal deleted")
    } catch (err) {
        console.error(err.message)
    }
}





module.exports = {
    getAllCategoriesAnimal,
    getCategorieAnimalId,
    insertCategorieAnimal,
    deleteCategorieAnimal,
    updateCategorieAnimal
}
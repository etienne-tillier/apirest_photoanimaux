const queries = require("./queries");
const pool = require("../../db");


//get all animals
const getAllEspeceAnimals = async (req,res) => {
    try {
        const allEspeceAnimals = await pool.query(queries.getEspeceAnimal)
        //get all categories for each animal
        for (let i = 0; i < allEspeceAnimals.rows.length; i++){
            let categories = await pool.query(queries.getAllCategoriesForAnAnimal, [
                allEspeceAnimals.rows[i].id
            ])
            allEspeceAnimals.rows[i].categories = categories.rows
        }
        res.status(200).json(allEspeceAnimals.rows)
    } catch (err) {
        console.error(err.message)
    }
}


//get an animal by id
const getEspeceAnimalId = async (req,res) => {
    try {
        const especeAnimal = await pool.query(queries.getEspeceAnimalId, [
            req.params.id
        ])
        //get all categories for this animal
        const categories = await pool.query(queries.getAllCategoriesForAnAnimal, [
            req.params.id
        ])
        especeAnimal.rows[0].categories = categories.rows
        res.status(200).json(especeAnimal.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


// update an animal by id
const updateEspeceAnimal = async (req,res) => {
    try {
        const {nomespece, poidsmoyen, couleur, imageEspece, taille, categories} = req.body
        let lienImage = ""
        if (req.file) {
            lienImage = req.file.destination + "/" + req.file.originalname
        }
        else {
            lienImage = imageEspece
        }
        const especeAnimalUpdated = await pool.query(queries.updateEspeceAnimal , [
            nomespece,
            poidsmoyen,
            couleur,
            lienImage,
            taille,
            req.params.id
        ])
        await pool.query(queries.deleteAllCategoeriesForAnAnimal, [
            req.params.id
        ])
        let categoriesParsed = JSON.parse(categories);
        for (let idCategorie of JSON.parse(categories)){
            await pool.query(queries.insertEspeceAnimalCategorieAnimal, [
                idCategorie,
                req.params.id
            ])
        }
        res.status(200).send("especeAnimal updated ! ")
    } catch (err) {
        console.error(err.message)
    }
}


// insert a new animal
const insertEspeceAnimal = async (req,res) => {
    try {
        console.log(req.file)
        const { nomespece, poidsmoyen, couleur, taille, categories } = req.body
        //suffit pour l'ajout sur la bd
        const newEspeceAnimal = await pool.query(queries.insertEspeceAnimal, [
            nomespece,
            poidsmoyen,
            couleur,
            req.file.destination + "/" + req.file.originalname,
            taille
        ])
        let categoriesParsed = JSON.parse(categories);
        //ajoute les catégories dans la table associative
        for (let idCategorie of categoriesParsed){
            await pool.query(queries.insertEspeceAnimalCategorieAnimal, [
                idCategorie,
                newEspeceAnimal.rows[0].id
            ])
        }
        //prend les noms des catégories pour les afficher
        const categoriesName = await pool.query(queries.getAllCategoriesForAnAnimal, [
            newEspeceAnimal.rows[0].id 
        ])
        newEspeceAnimal.rows[0].categories = categoriesName.rows
        res.status(201).json(newEspeceAnimal.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


//delete an animal by id
const deleteEspeceAnimal = async (req,res) => {
    try {
        const espaceAnimalDeleted = await pool.query(queries.deleteEspeceAnimal, [
            req.params.id
        ])
        res.status(200).send("especeAnimal deleted")
    } catch (err) {
        console.error(err.message)
    }
}





module.exports = {
    getAllEspeceAnimals,
    getEspeceAnimalId,
    updateEspeceAnimal,
    deleteEspeceAnimal,
    insertEspeceAnimal
}
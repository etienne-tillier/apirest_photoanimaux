const queries = require("./queries");
const pool = require("../../db");


//get all utilisateurs
const getAllUtilisateurs = async (req,res) => {
    try {
        const allUtilisateurs = await pool.query(queries.getUtilisateurs)
        res.status(200).json(allUtilisateurs.rows)
    } catch (err) {
        console.error(err.message)
    }
}


//get an utilisateur by id
const getUtilisateurId = async (req,res) => {
    try {
        const utilsateur = await pool.query(queries.getUtilisateurId, [
            req.params.id
        ])
        res.status(200).json(utilsateur.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


// update an utilisateur by id
const updateUtilisateur = async (req,res) => {
    try {
        const {email, pseudo, isAdmin} = req.body
        const utilisateurUpdated = await pool.query(queries.updateUtilisateur , [
            email,
            pseudo,
            isAdmin,
            req.params.id
        ])
        res.status(200).send("utilisateur updated ! ")
    } catch (err) {
        console.error(err.message)
    }
}


// insert a new utilisateur
const insertUtilisateur = async (req,res) => {
    try {
        const { email, pseudo } = req.body
        //suffit pour l'ajout sur la bd
        const newUtilisateur = await pool.query(queries.insertUtilisateur, [
            email,
            pseudo,
            false
        ])
        //envoi sur l'api
        res.status(201).json(newUtilisateur.rows[0])
    } catch (err) {
        console.error(err.message)
    }
}


//delete an utilisateur by id
const deleteUtilisateur = async (req,res) => {
    try {
        const utilisateurDeleted = await pool.query(queries.deleteUtilisateur, [
            req.params.id
        ])
        res.status(200).send("utilisateur deleted")
    } catch (err) {
        console.error(err.message)
    }
}





module.exports = {
    getAllUtilisateurs,
    getUtilisateurId,
    insertUtilisateur,
    deleteUtilisateur,
    updateUtilisateur
}
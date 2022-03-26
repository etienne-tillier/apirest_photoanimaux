const queries = require("./queries");
const pool = require("../../db");


//get all photos
const getAllPhotos = async (req,res) => {
    try {
        const allPhotos = await pool.query(queries.getPhotos)
        for (let i = 0; i < allPhotos.rows.length; i++){
            let sortie = await pool.query(queries.getSortieId, [
                allPhotos.rows[i].idsortie
            ])
            allPhotos.rows[i].sortie = sortie.rows[0]
        }
        res.status(200).json(allPhotos.rows)
    } catch (err) {
        console.error(err.message)
        res.status(404).send({message: err.message})
    }
}


//get a photo by id
const getPhotoId = async (req,res) => {
    try {
        const photo = await pool.query(queries.getPhotoId, [
            req.params.id
        ])
        let sortie = await pool.query(queries.getSortieId, [
            photo.rows[0].idsortie
        ])
        photo.rows[0].sortie = sortie.rows[0]
        res.status(200).json(photo.rows[0])
    } catch (err) {
        console.error(err.message)
        res.status(404).send({message: err.message})
    }
}


// update a photo by id
const updatePhoto = async (req,res) => {
    try {
        const {iso, latitude, longitude, lienFichier, description, camera, objectif, ouverture, vitesse} = req.body
        const photoUpdated = await pool.query(queries.updatePhoto , [
            iso,
            latitude,
            longitude,
            lienFichier,
            description,
            camera,
            objectif,
            ouverture,
            vitesse,
            req.params.id
        ])
        res.status(200).send("photo updated ! ")
    } catch (err) {
        console.error(err.message)
        res.status(404).send({message: err.message})
    }
}


// insert a new photo
const insertPhoto = async (req,res) => {
    try {
        console.log(req.body)

        const {idespeceanimal, idsortie, iso, latitude, longitude, lienfichier, description, camera, objectif, ouverture, vitesse} = req.body
        //suffit pour l'ajout sur la bd
        const newPhoto = await pool.query(queries.insertPhoto, [
            idespeceanimal,
            idsortie,
            iso,
            latitude,
            longitude,
            req.file.destination + "/" + req.body.idsortie + "-" + req.file.originalname,
            description,
            camera,
            objectif,
            ouverture,
            vitesse
        ])
        let sortie = await pool.query(queries.getSortieId, [
            newPhoto.rows[0].idsortie
        ])
        newPhoto.rows[0].sortie = sortie.rows[0]
        //envoi sur l'api
        res.status(201).json(newPhoto.rows[0])
    } catch (err) {
        console.error(err.message)
        res.status(404).send({message: err.message})
    }
}


//delete a photo by id
const deletePhoto = async (req,res) => {
    try {
        const photoDeleted = await pool.query(queries.deletePhoto, [
            req.params.id
        ])
        res.status(200).send("photo deleted")
    } catch (err) {
        console.error(err.message)
        res.status(404).send({message: err.message})
    }
}





module.exports = {
    getAllPhotos,
    getPhotoId,
    updatePhoto,
    deletePhoto,
    insertPhoto
}
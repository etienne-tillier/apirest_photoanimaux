const getPhotos = "SELECT * FROM photos";
const getPhotoId = "SELECT * FROM photos WHERE id = $1";
const insertPhoto = "INSERT INTO photos (idespeceanimal, idsortie, iso, latitude, longitude, lienfichier, description, camera, objectif, ouverture, vitesse) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11) RETURNING *";
const updatePhoto = "UPDATE photos SET iso = $1, latitude = $2, longitude = $3, lienfichier = $4, description = $5, camera = $6, objectif = $7, ouverture = $8, vitesse = $9 WHERE id = $10";
const deletePhoto = "DELETE FROM photos WHERE id = $1 RETURNING *";
const getSortieId = "SELECT * FROM sorties WHERE id = $1";


module.exports = {
    getPhotos,
    getPhotoId,
    insertPhoto,
    updatePhoto,
    deletePhoto,
    getSortieId
}
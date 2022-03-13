const getEspeceAnimal = "SELECT * FROM especeanimal";
const getEspeceAnimalId = "SELECT * FROM especeanimal WHERE id = $1";
const insertEspeceAnimal = "INSERT INTO especeanimal (nomEspece, poidsMoyen, couleur, image, taille) VALUES($1,$2,$3,$4,$5) RETURNING *";
const updateEspeceAnimal = "UPDATE especeanimal SET nomEspece = $1, poidsMoyen = $2, couleur = $3, image = $4, taille = $5 WHERE id = $6";
const deleteEspeceAnimal = "DELETE FROM especeanimal WHERE id = $1 RETURNING *";
const insertEspeceAnimalCategorieAnimal = "INSERT INTO associationcategorieespece (idcategorie, idespece) VALUES($1,$2) RETURNING *";
const getAllCategoriesForAnAnimal = "SELECT nomcategorie FROM categoriesAnimal C JOIN associationcategorieespece A ON C.id = A.idcategorie WHERE A.idespece = $1";
const deleteAllCategoeriesForAnAnimal =  "DELETE FROM associationcategorieespece WHERE idespece = $1"

module.exports = {
    getEspeceAnimal,
    getEspeceAnimalId,
    deleteEspeceAnimal,
    insertEspeceAnimal,
    updateEspeceAnimal,
    insertEspeceAnimalCategorieAnimal,
    getAllCategoriesForAnAnimal,
    deleteAllCategoeriesForAnAnimal
}
const getCategorieAnimal = "SELECT * FROM categoriesanimal";
const getCategorieAnimalId = "SELECT * FROM categoriesanimal WHERE id = $1";
const insertCategorieAnimal = "INSERT INTO categoriesanimal (nomcategorie) VALUES($1) RETURNING *";
const updateCategorieAnimal = "UPDATE categoriesanimal SET nomcategorie = $1 WHERE id = $2";
const deleteCategorieAnimal = "DELETE FROM categoriesanimal WHERE id = $1 RETURNING *";


module.exports = {
    getCategorieAnimal,
    getCategorieAnimalId,
    insertCategorieAnimal,
    deleteCategorieAnimal,
    updateCategorieAnimal
}
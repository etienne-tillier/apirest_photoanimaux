const getSorties = "SELECT * FROM sorties";
const getSortieId = "SELECT * FROM sorties WHERE id = $1";
const insertSortie =
  "INSERT INTO sorties (idutilisateur, date, description, latitude, longitude, prive) VALUES($1,$2,$3,$4,$5,$6) RETURNING *";
const updateSortie =
  "UPDATE sorties SET idutilisateur = $1, date = $2, description = $3, latitude = $4, longitude = $5, prive = $6 WHERE id = $7";
const deleteSortie = "DELETE FROM sorties WHERE id = $1 RETURNING *";
const insertEspeceSortie =
  "INSERT INTO associationespecesortie (idsortie, idespece) VALUES($1,$2)";
const getAllEspeceForASortie =
  "SELECT * FROM especeanimal E JOIN associationespecesortie A ON E.id = A.idespece WHERE A.idsortie = $1";
const deleteAllEspeceForSortie =
  "DELETE FROM associationespecesortie WHERE idsortie = $1";

module.exports = {
  getSorties,
  getSortieId,
  insertSortie,
  deleteSortie,
  updateSortie,
  insertEspeceSortie,
  getAllEspeceForASortie,
  deleteAllEspeceForSortie,
};

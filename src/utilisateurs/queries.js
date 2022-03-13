const getUtilisateurs = "SELECT * FROM utilisateurs";
const getUtilisateurId = "SELECT * FROM utilisateurs WHERE id = $1";
const insertUtilisateur = "INSERT INTO utilisateurs (email, pseudo, isAdmin) VALUES($1,$2,$3) RETURNING *";
const updateUtilisateur = "UPDATE utilisateurs SET email = $1, pseudo = $2, isAdmin = $3 WHERE id = $4";
const deleteUtilisateur = "DELETE FROM utilisateurs WHERE id = $1 RETURNING *";


module.exports = {
    getUtilisateurId,
    getUtilisateurs,
    insertUtilisateur,
    updateUtilisateur,
    deleteUtilisateur
}
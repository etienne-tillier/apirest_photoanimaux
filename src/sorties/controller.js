const queries = require("./queries");
const pool = require("../../db");
const { query } = require("express");

//get all sorties
const getAllSorties = async (req, res) => {
  try {
    const allSorties = await pool.query(queries.getSorties);
    for (let i = 0; i < allSorties.rows.length; i++) {
      let especesForSortie = await pool.query(queries.getAllEspeceForASortie, [
        allSorties.rows[i].id,
      ]);
      allSorties.rows[i].especes = especesForSortie.rows;
    }
    res.status(200).json(allSorties.rows);
  } catch (err) {
    console.error(err.message);
  }
};

//get a sortie by id
const getSortieId = async (req, res) => {
  try {
    const sortie = await pool.query(queries.getSortieId, [req.params.id]);
    let especesForSortie = await pool.query(queries.getAllEspeceForASortie, [
      req.params.id,
    ]);
    sortie.rows[0].especes = especesForSortie.rows;
    res.status(200).json(sortie.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
};

// update a sortie by id
const updateSortie = async (req, res) => {
  try {
    const {
      idutilisateur,
      date,
      description,
      latitude,
      longitude,
      prive,
      especes,
    } = req.body;
    const sortieUpdated = await pool.query(queries.updateSortie, [
      idutilisateur,
      date,
      description,
      latitude,
      longitude,
      prive,
      req.params.id,
    ]);
    await pool.query(queries.deleteAllEspeceForSortie, [req.params.id]);
    for (let idEspece of especes) {
      await pool.query(queries.insertEspeceSortie, [req.params.id, idEspece]);
    }
    res.status(200).send("sortie updated ! ");
  } catch (err) {
    console.error(err.message);
  }
};

// insert a new sortie
const insertSortie = async (req, res) => {
  try {
    const {
      idutilisateur,
      date,
      description,
      latitude,
      longitude,
      prive,
      especes,
    } = req.body;
    //suffit pour l'ajout sur la bd
    const newSortie = await pool.query(queries.insertSortie, [
      idutilisateur,
      date,
      description,
      latitude,
      longitude,
      prive,
    ]);

    for (let i = 0; i < especes.length; i++) {
      await pool.query(queries.insertEspeceSortie, [
        newSortie.rows[0].id,
        especes[i],
      ]);
    }
    let especesForSortie = await pool.query(queries.getAllEspeceForASortie, [
      newSortie.rows[0].id,
    ]);
    newSortie.rows[0].especes = especesForSortie.rows;
    //envoi sur l'api
    res.status(201).json(newSortie.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
};

//delete a sortie by id
const deleteSortie = async (req, res) => {
  try {
    const sortieDeleted = await pool.query(queries.deleteSortie, [
      req.params.id,
    ]);
    res.status(200).send("sortie deleted");
  } catch (err) {
    console.error(err.message);
  }
};

module.exports = {
  getAllSorties,
  getSortieId,
  insertSortie,
  deleteSortie,
  updateSortie,
};

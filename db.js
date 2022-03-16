const Pool = require("pg").Pool;
require("dotenv").config();

const pool = new Pool({
  user: "postgres",
  password: process.env.PASSWORD,
  host: "localhost",
  port: process.env.PORT,
  database: "photos_animaux",
});

module.exports = pool;

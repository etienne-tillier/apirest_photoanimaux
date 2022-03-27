const Pool = require("pg").Pool;
require("dotenv").config();

const pool = new Pool({
  user: process.env.DATABASE_USER,
  password: process.env.PASSWORD,
  host: process.env.DATABASE_HOST,
  port: process.env.PORT,
  database: process.env.DATABASE_NAME,
});

module.exports = pool;

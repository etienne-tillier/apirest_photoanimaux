const Pool = require("pg").Pool;
require("dotenv").config();

// const pool = new Pool({
//   user: process.env.DATABASE_USER,
//   password: process.env.PASSWORD,
//   host: process.env.DATABASE_HOST,
//   port: 5432,
//   database: process.env.DATABASE_NAME,
// });

const herokuPool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
})


// module.exports = pool


module.exports = (process.env.PORT ? herokuPool : pool);

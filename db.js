const Pool = require("pg").Pool

const pool = new Pool({
    user: "postgres",
    password: "2110om01",
    host: "localhost",
    port: 5432,
    database: "photos_animaux"
})


module.exports = pool
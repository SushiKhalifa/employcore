const { Pool } = require("pg");

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
});

module.exports = pool;

//db.js:This file is responsible for creating and exporting the database connection pool.
//It does not contain test code because its purpose is to share the pool across the backend.
const { Pool } = require("pg");
require("dotenv").config();

// Create a connection pool to the PostgreSQL database
const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

module.exports = pool;
//db.js:This file is responsible for creating and exporting the database connection pool.
//It does not contain test code because its purpose is to share the pool across the backend.
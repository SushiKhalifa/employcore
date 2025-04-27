const { Pool } = require('pg');

// Replace with your PostgreSQL connection details
const pool = new Pool({
    user: 'postgres',         // PostgreSQL username
    host: 'localhost',             // Hostname (use 'localhost' for local setup)
    database: 'employcore',     // Name of your database
    password: 'Winning_17',     // PostgreSQL password
    port: 5432,                    // Default PostgreSQL port
});

const testConnection = async () => {
    try {
        const res = await pool.query('SELECT NOW()'); // Simple query to get the current timestamp
        console.log('Database Connected Successfully:', res.rows[0]);
    } catch (err) {
        console.error('Database Connection Failed:', err.message);
    } finally {
        pool.end(); // Close the connection pool
    }
};

testConnection();
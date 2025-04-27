require('dotenv').config(); // Load environment variables

const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

// Debugging: Log the DATABASE_URL to verify it's loaded
console.log('Database URL:', process.env.DATABASE_URL);

// PostgreSQL connection pool
const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
});

// Read the seed SQL file
const seedFile = path.join(__dirname, '../../database/seed.sql');
const seedQuery = fs.readFileSync(seedFile, 'utf-8');

// Execute the seed script
const seedDatabase = async () => {
    try {
        console.log('Running seed script...');
        await pool.query(seedQuery);
        console.log('Seed data inserted successfully!');
    } catch (error) {
        console.error('Error inserting seed data:', error.message);
    } finally {
        pool.end();
    }
};

seedDatabase();
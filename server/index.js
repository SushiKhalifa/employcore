const express = require("express");
const dotenv = require("dotenv");
const path = require("path");

// Load environment variables
dotenv.config({ path: path.join(__dirname, ".env") });

const app = express();

// Middleware
app.use(express.json());

// API Routes
app.use("/api/auth", require("./routes/authRoutes"));

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
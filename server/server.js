const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const authRoutes = require("./routes/authRoutes");
const roleRoutes = require("./routes/roleRoutes");
require("dotenv").config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(bodyParser.json()); // Parses incoming JSON
app.use(cors()); // Enables cross-origin requests

// Routes
app.use("/api/auth", authRoutes); // Authentication routes
app.use("/api/role", roleRoutes); // Role-based data routes

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
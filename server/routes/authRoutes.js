//const express = require("express");
//const pool = require("../config/db"); // Database connection pool
//const authController = require("../controllers/authController"); // Import the controller

//const router = express.Router();

// Test Route
//router.get("/test", async (req, res) => {
//    res.send("Auth route is working!");
//});

// Login Route
//router.post("/login", authController.login);

// New: TOTP Setup Route
//router.post("/setup-totp", authController.setupTotp);

// New: TOTP Verification Route
//router.post("/verify-totp", authController.verifyTotp);

//module.exports = router;

const express = require("express");
const authController = require("../controllers/authController");

const router = express.Router();

// Login Route
router.post("/login", authController.login);

module.exports = router;
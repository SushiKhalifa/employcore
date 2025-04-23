const express = require("express");
const pool = require("../config/db");

const router = express.Router();

// Test Route
router.get("/test", async (req, res) => {
    res.send("Auth route is working!");
});

module.exports = router;
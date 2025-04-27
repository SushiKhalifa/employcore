const express = require("express");
const roleController = require("../controllers/roleController");
const { verifyToken, restrictTo } = require("../middlewares/authMiddleware");

const router = express.Router();

// Employee Dashboard
router.get("/employee", verifyToken, restrictTo(["employee"]), roleController.getEmployeeData);

// Manager Dashboard
router.get("/manager", verifyToken, restrictTo(["manager"]), roleController.getManagerData);

// Admin Dashboard
router.get("/admin", verifyToken, restrictTo(["admin"]), roleController.getAdminData);

module.exports = router;
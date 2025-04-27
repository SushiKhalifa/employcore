const pool = require("../config/db");

// Fetch Employee Data
exports.getEmployeeData = async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM users WHERE id = $1", [req.user.id]);
        res.json(result.rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server error" });
    }
};

// Fetch Manager's Data and Employees
exports.getManagerData = async (req, res) => {
    try {
        const managerResult = await pool.query("SELECT * FROM users WHERE id = $1", [req.user.id]);
        const employeesResult = await pool.query("SELECT * FROM users WHERE department_id = $1 AND role = 'employee'", [
            managerResult.rows[0].department_id,
        ]);

        res.json({
            manager: managerResult.rows[0],
            employees: employeesResult.rows,
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server error" });
    }
};

// Fetch Admin Data
exports.getAdminData = async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM users WHERE role = 'employee'");
        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server error" });
    }
};
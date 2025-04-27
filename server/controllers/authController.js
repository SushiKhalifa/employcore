const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const pool = require("../config/db");

// Login Function
exports.login = async (req, res) => {
    const { email, password } = req.body;

    try {
        // Find the user by email
        const result = await pool.query("SELECT * FROM users WHERE email = $1 AND is_active = TRUE", [email]);
        if (result.rows.length === 0) return res.status(401).json({ message: "Invalid email or password" });

        const user = result.rows[0];

        // Compare passwords
        const isPasswordValid = bcrypt.compareSync(password, user.password_hash);
        if (!isPasswordValid) return res.status(401).json({ message: "Invalid email or password" });

        // Generate a JWT containing the user's ID and role
        const token = jwt.sign({ id: user.id, role: user.role, full_name: user.full_name }, process.env.JWT_SECRET, {
            expiresIn: "1h",
        });

        res.json({ token, role: user.role });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Server error" });
    }
};
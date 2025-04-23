CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    postcode TEXT,
    department_id INT,
    payroll_id TEXT UNIQUE,
    role TEXT CHECK (role IN ('employee', 'manager', 'admin')) NOT NULL,
    date_joined DATE NOT NULL,
    national_insurance_number TEXT,
    profile_image_url TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    manager_id INT REFERENCES users(id)
);


CREATE TABLE mfa_secrets (
    user_id INT PRIMARY KEY REFERENCES users(id),
    secret TEXT NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE
);


CREATE TABLE holiday_balances (
    id SERIAL PRIMARY KEY,
    employee_id INT UNIQUE REFERENCES users(id),
    total_allocated INT DEFAULT 28,
    total_used INT DEFAULT 0
);

CREATE TABLE leave_requests (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES users(id),
    manager_id INT REFERENCES users(id),
    leave_type TEXT CHECK (leave_type IN ('holiday', 'sick', 'bereavement', 'maternity', 'paternity')),
    reason TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_days INT NOT NULL,
    status TEXT CHECK (status IN ('pending', 'approved', 'rejected')) DEFAULT 'pending',
    response_message TEXT,
    requested_at TIMESTAMP DEFAULT NOW(),
    approved_at TIMESTAMP,
    rejected_at TIMESTAMP
);

CREATE TABLE payslips (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES users(id),
    admin_id INT REFERENCES users(id),
    period_start DATE,
    period_end DATE,
    pay_type TEXT CHECK (pay_type IN ('salary', 'hourly')),
    hours_worked INT,
    base_pay NUMERIC(10, 2),
    holiday_days INT DEFAULT 0,
    holiday_pay NUMERIC(10, 2),
    gross_pay NUMERIC(10, 2),
    tax_deduction NUMERIC(10, 2),
    net_pay NUMERIC(10, 2),
    national_insurance_number TEXT,
    file_url TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payslip_components (
    id SERIAL PRIMARY KEY,
    payslip_id INT REFERENCES payslips(id),
    label TEXT,
    amount NUMERIC(10, 2),
    type TEXT CHECK (type IN ('earning', 'deduction'))
);


CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE p60_p45 (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES users(id),
    doc_type TEXT CHECK (doc_type IN ('p60', 'p45')),
    file_url TEXT,
    uploaded_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE payroll_logs (
    id SERIAL PRIMARY KEY,
    admin_id INT REFERENCES users(id),
    run_date TIMESTAMP DEFAULT NOW(),
    notes TEXT
);

CREATE TABLE settings (
    user_id INT PRIMARY KEY REFERENCES users(id),
    theme TEXT CHECK (theme IN ('light', 'dark')) DEFAULT 'light',
    notifications_enabled BOOLEAN DEFAULT TRUE
);

CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    actor_id INT REFERENCES users(id),
    action TEXT,
    target_table TEXT,
    target_id INT,
    timestamp TIMESTAMP DEFAULT NOW(),
    details JSONB
);




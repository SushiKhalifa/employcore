-- Seed data for users table
INSERT INTO users (id, full_name, email, password_hash, phone, address, postcode, department_id, payroll_id, role, date_joined, national_insurance_number, profile_image_url, is_active)
VALUES
(1, 'John Doe', 'john.doe@mail.com', '<hashed_password>', '07123456789', '123 High Street', 'SW1A 1AA', 1, 'PAY12345', 'employee', '2023-01-15', 'QQ123456C', NULL, TRUE),
(2, 'Jane Smith', 'jane.smith@mail.com', '<hashed_password>', '07198765432', '456 Elm Street', 'NW1 5LR', 1, 'PAY67890', 'manager', '2021-06-12', 'QQ654321C', NULL, TRUE),
(3, 'Admin User', 'admin@mail.com', '<hashed_password>', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-03-10', NULL, NULL, TRUE);

-- Seed data for departments table
INSERT INTO departments (id, name, manager_id)
VALUES
(1, 'Development', 2);

-- Seed data for mfa_secrets table
INSERT INTO mfa_secrets (user_id, secret, is_verified)
VALUES
(1, 'MFA_SECRET_1', TRUE),
(2, 'MFA_SECRET_2', TRUE),
(3, 'MFA_SECRET_3', TRUE);

-- Seed data for holiday_balances table
INSERT INTO holiday_balances (id, employee_id, total_allocated, total_used)
VALUES
(1, 1, 28, 5);

-- Seed data for leave_requests table
INSERT INTO leave_requests (id, employee_id, manager_id, leave_type, reason, start_date, end_date, total_days, status, response_message, requested_at, approved_at, rejected_at)
VALUES
(1, 1, 2, 'holiday', 'Family vacation', '2025-06-01', '2025-06-10', 10, 'approved', 'Enjoy your vacation!', '2025-04-01 10:00:00', '2025-04-02 12:00:00', NULL),
(2, 1, 2, 'sick', 'Medical reasons', '2025-04-20', '2025-04-22', 3, 'pending', NULL, '2025-04-18 09:00:00', NULL, NULL);

-- Seed data for payslips table
INSERT INTO payslips (id, employee_id, admin_id, period_start, period_end, pay_type, hours_worked, base_pay, holiday_days, holiday_pay, gross_pay, tax_deduction, net_pay, national_insurance_number, file_url, created_at)
VALUES
(1, 1, 3, '2025-03-01', '2025-03-31', 'salary', NULL, 2500.00, 2, 25.00, 2525.00, 505.00, 2020.00, 'QQ123456C', 'https://example.com/payslip_march.pdf', '2025-04-01 10:00:00');

-- Seed data for payslip_components table
INSERT INTO payslip_components (id, payslip_id, label, amount, type)
VALUES
(1, 1, 'Base Pay', 2500.00, 'earning'),
(2, 1, 'Holiday Pay', 25.00, 'earning'),
(3, 1, 'Tax Deduction', 505.00, 'deduction');

-- Seed data for notifications table
INSERT INTO notifications (id, user_id, message, is_read, created_at)
VALUES
(1, 1, 'Your leave request has been approved.', FALSE, '2025-04-02 12:30:00'),
(2, 1, 'Your payslip for March 2025 is available for download.', FALSE, '2025-04-01 15:00:00');

-- Seed data for p60_p45 table
INSERT INTO p60_p45 (id, employee_id, doc_type, file_url, uploaded_at)
VALUES
(1, 1, 'p60', 'https://example.com/p60_2024.pdf', '2025-04-01 14:00:00');

-- Seed data for payroll_logs table
INSERT INTO payroll_logs (id, admin_id, run_date, notes)
VALUES
(1, 3, '2025-04-01 14:00:00', 'Generated payroll for March 2025');

-- Seed data for settings table
INSERT INTO settings (user_id, theme, notifications_enabled)
VALUES
(1, 'dark', TRUE),
(2, 'light', TRUE),
(3, 'light', FALSE);

-- Seed data for audit_logs table
INSERT INTO audit_logs (id, actor_id, action, target_table, target_id, timestamp, details)
VALUES
(1, 3, 'INSERT', 'payslips', 1, '2025-04-01 10:00:00', '{"pay_period": "March 2025", "gross_pay": 2525.00}');

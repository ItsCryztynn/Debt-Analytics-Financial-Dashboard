-- 1. Setup the Database
CREATE DATABASE IF NOT EXISTS friah_financials;
USE friah_financials;

-- 2. Clean Slate (Ensures no old data interferes)
DROP VIEW IF EXISTS v_unpaid_tracker;
DROP TABLE IF EXISTS debt_progress;
DROP TABLE IF EXISTS summary_of_payments;
DROP TABLE IF EXISTS tracker;

-- 3. Create the Main Tracker Table
CREATE TABLE tracker (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    period      DATE           NOT NULL,
    item        VARCHAR(100)   NOT NULL,
    amount      DECIMAL(10,2)  NOT NULL,
    paid        VARCHAR(3)     NOT NULL CHECK (paid IN ('YES','NO'))
);

-- 4. Insert Full Tracker Data
INSERT INTO tracker (period, item, amount, paid) VALUES
    ('2026-02-15', 'Laptop', 1875, 'YES'),
    ('2026-02-28', 'Laptop', 1875, 'YES'),
    ('2026-03-15', 'Laptop', 1875, 'YES'),
    ('2026-03-30', 'Laptop', 1875, 'YES'),
    ('2026-04-15', 'Laptop', 1875, 'YES'),
    ('2026-04-30', 'Laptop', 1875, 'YES'),
    ('2026-02-15', 'iPhone 17', 2416, 'YES'),
    ('2026-02-28', 'iPhone 17', 2416, 'YES'),
    ('2026-03-15', 'iPhone 17', 2416, 'YES'),
    ('2026-03-30', 'iPhone 17', 2416, 'YES'),
    ('2026-04-15', 'iPhone 17', 2416, 'YES'),
    ('2026-04-30', 'iPhone 17', 2416, 'YES'),
    ('2026-02-15', 'Xiaomi 15t', 1208, 'YES'),
    ('2026-05-30', 'Laptop', 1875, 'NO'),
    ('2026-06-15', 'Laptop', 1875, 'NO'),
    ('2026-06-30', 'Laptop', 1875, 'NO'),
    ('2026-11-30', 'Maribank', 1129, 'NO');

-- 5. Create Summary Table
CREATE TABLE summary_of_payments (
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    month_date          DATE           NOT NULL,
    total_monthly_debt  DECIMAL(10,2)  NOT NULL,
    monthly_income      DECIMAL(10,2)  NOT NULL,
    dti_ratio           DECIMAL(6,4)   NOT NULL,
    goal_dti            DECIMAL(4,2)   NOT NULL
);

-- 6. Insert Summary Data
INSERT INTO summary_of_payments (month_date, total_monthly_debt, monthly_income, dti_ratio, goal_dti) VALUES
    ('2026-02-15', 14636, 12000, 1.2197, 0.36),
    ('2026-03-15', 15147, 12000, 1.2623, 0.36),
    ('2026-12-15', 4110, 12000, 0.3425, 0.36);

-- 7. Create Progress Table
CREATE TABLE debt_progress (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    date            DATE           NOT NULL,
    remaining_debt  DECIMAL(10,2)  NOT NULL,
    month           DATE           NOT NULL,
    paid            DECIMAL(10,2)  NOT NULL
);

-- 8. Create the Reports (Views)
CREATE VIEW v_unpaid_tracker AS
SELECT * FROM tracker
WHERE paid = 'NO'
ORDER BY item, period;

CREATE VIEW v_debt_priority AS
SELECT 
    item, 
    COUNT(*) AS installments_left, 
    SUM(amount) AS total_unpaid_balance
FROM tracker
WHERE paid = 'NO'
GROUP BY item
ORDER BY total_unpaid_balance DESC;

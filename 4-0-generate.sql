DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db; -- my_dbが存在しなければ作成
USE my_db;

CREATE TABLE IF NOT EXISTS employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),          -- 文字列関数の操作対象
    last_name VARCHAR(50),          -- 文字列関数の操作対象
    birth_date DATE,           -- 日付関数の操作対象
    salary DECIMAL(10,2),      -- 算術演算や数学関数の対象
    bonus_rate FLOAT           -- 算術演算や数学関数の対象
);

-- employeeテーブルが空の場合のみ実行
INSERT INTO employee (first_name, last_name, birth_date, salary, bonus_rate)
SELECT * FROM (
    SELECT 'Alice', 'Smith', '1990-05-15', 50000.00, 0.05 UNION ALL
    SELECT 'Bob', 'Johnson', '1985-10-23', 60000.00, 0.07 UNION ALL
    SELECT 'Charlie', 'Brown', '2000-01-10', 45000.00, 0.03 UNION ALL
    SELECT 'Dave', 'Wilson', NULL, 70000.00, 0.1 UNION ALL
    SELECT 'Eve', 'Taylor', '1995-07-19', 55000.00, 0.06 UNION ALL
    SELECT 'Frank', 'Anderson', '1982-12-03', 62000.00, 0.08 UNION ALL
    SELECT 'Grace', 'Thomas', '1998-08-25', 48000.00, 0.04 UNION ALL
    SELECT 'Hank', 'Moore', '1993-06-14', NULL, 0.09 UNION ALL
    SELECT 'Ivy', 'White', '1987-04-30', 57000.00, NULL UNION ALL
    SELECT 'Jack', 'Harris', '2001-09-21', 43000.00, 0.02 UNION ALL
    SELECT 'Kelly', 'Martin', '1992-02-11', 51000.00, 0.05 UNION ALL
    SELECT 'Leo', 'Thompson', '1980-07-07', 73000.00, 0.12 UNION ALL
    SELECT 'Mia', 'Garcia', '1996-11-17', 49000.00, 0.05 UNION ALL
    SELECT 'Nick', 'Martinez', '1979-03-22', 81000.00, 0.15 UNION ALL
    SELECT 'Olivia', 'Robinson', NULL, 54000.00, 0.06 UNION ALL
    SELECT 'Paul', 'Clark', '1984-05-09', 62000.00, 0.08 UNION ALL
    SELECT 'Quinn', 'Rodriguez', '1997-10-05', 46000.00, 0.03 UNION ALL
    SELECT 'Ryan', 'Lewis', '1990-01-28', NULL, 0.07 UNION ALL
    SELECT 'Sophia', 'Lee', '1994-06-23', 58000.00, 0.06 UNION ALL
    SELECT 'Tom', 'Walker', '1983-09-19', 75000.00, NULL UNION ALL
    SELECT 'Uma', 'Hall', '2002-12-12', 42000.00, 0.02 UNION ALL
    SELECT 'Victor', 'Allen', '1991-08-02', 53000.00, 0.05 UNION ALL
    SELECT 'Wendy', 'Young', NULL, 56000.00, 0.07 UNION ALL
    SELECT 'Xavier', 'King', '1978-07-29', 89000.00, 0.18 UNION ALL
    SELECT 'Yara', 'Scott', '2003-11-04', 41000.00, 0.02 UNION ALL
    SELECT 'Zack', 'Green', '1999-01-31', 47000.00, 0.04 UNION ALL
    SELECT 'Anna', 'Baker', '1986-04-08', 61000.00, 0.08 UNION ALL
    SELECT 'Brian', 'Gonzalez', '1993-12-15', 59000.00, NULL UNION ALL
    SELECT 'Catherine', 'Nelson', '1981-06-20', 77000.00, 0.12
) AS temp
WHERE NOT EXISTS (SELECT 1 FROM employee);
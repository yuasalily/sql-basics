DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db; -- my_dbが存在しなければ作成
USE my_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department_id INT,
    salary DECIMAL(10,2)
);

CREATE TABLE applicants (
    applicant_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    applied_department_id INT,
    desired_salary DECIMAL(10,2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO employees (employee_id, name, age, department_id, salary) VALUES
(1, 'Alice', 30, 1, 5000.00),
(2, 'Bob', 28, 2, 4500.00),
(3, 'Charlie', 35, 1, 6000.00),
(4, 'David', 40, 3, 7000.00),
(5, 'Eve', 29, 2, 4800.00),
(6, 'Frank', 33, 3, 7500.00),
(7, 'Grace', 26, 4, 4000.00),
(8, 'Hank', 38, 1, 6500.00);

INSERT INTO applicants (applicant_id, name, age, applied_department_id, desired_salary) VALUES
(101, 'Alice', 30, 1, 5200.00),   -- Alice は従業員としても存在
(102, 'Bob', 28, 2, 4600.00),     -- Bob も従業員と重複
(103, 'Ivy', 27, 3, 4800.00),     -- Ivy は新規
(104, 'Jack', 35, 1, 6200.00),    -- Jack は新規
(105, 'Eve', 29, 2, 4900.00),     -- Eve も従業員と重複
(106, 'Kevin', 32, 3, 7100.00);   -- Kevin は新規

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Marketing');

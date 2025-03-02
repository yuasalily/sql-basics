DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db; -- my_dbが存在しなければ作成
USE my_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

INSERT INTO orders (customer_id, amount, order_date) VALUES
(1, 100.50, '2024-02-01'),
(2, 200.75, '2024-02-02'),
(1, 50.25, '2024-02-03'),
(3, 300.00, '2024-02-04');

INSERT INTO employees (name, manager_id) VALUES
('CEO', NULL),
('Manager A', 1),
('Manager B', 1),
('Employee 1', 2),
('Employee 2', 2),
('Employee 3', 3),
('Employee 4', 3);

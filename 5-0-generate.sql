DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db; -- my_dbが存在しなければ作成
USE my_db;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_status ENUM('pending', 'shipped', 'delivered', 'cancelled'),
    amount DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (customer_name, order_status, amount) VALUES
('Alice', 'pending', 100.00),
('Bob', 'shipped', 200.00),
('Charlie', 'delivered', 300.00),
('Dave', 'cancelled', 150.00),
('Eve', 'pending', NULL),
('Frank', 'shipped', 250.00);
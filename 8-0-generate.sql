CREATE DATABASE IF NOT EXISTS my_db; -- my_dbが存在しなければ作成
USE my_db;

DROP TABLE IF EXISTS sales; -- テーブルが既に存在していたらレコード初期化のため削除

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL
);

INSERT INTO sales (store_name, category, product_name, quantity, price, sale_date) VALUES
('Tokyo Store', 'Electronics', 'Laptop', 5, 120000.00, '2024-02-01'),
('Tokyo Store', 'Electronics', 'Phone', 10, 80000.00, '2024-02-02'),
('Osaka Store', 'Electronics', 'Laptop', 2, 115000.00, '2024-02-01'),
('Osaka Store', 'Electronics', 'Tablet', 8, 50000.00, '2024-02-03'),
('Fukuoka Store', 'Groceries', 'Apple', 50, 150.00, '2024-02-01'),
('Fukuoka Store', 'Groceries', 'Banana', 40, 100.00, '2024-02-02'),
('Tokyo Store', 'Groceries', 'Orange', 60, 120.00, '2024-02-03'),
('Osaka Store', 'Groceries', 'Milk', 30, 200.00, '2024-02-01');

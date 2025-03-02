DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;
USE my_db;


-- usersテーブルを作成
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ordersテーブルを作成（NULLを含む）
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_name VARCHAR(100),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- usersテーブルにデータを挿入
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', NULL),  -- メールアドレスがNULL
('Eve', 'eve@example.com'),
('Frank', NULL),  -- メールアドレスがNULL
('Grace', 'grace@example.com');

-- ordersテーブルにデータを挿入（NULLを含む）
INSERT INTO orders (user_id, product_name, order_date) VALUES
(1, 'Laptop', '2024-01-01 10:00:00'),
(1, 'Mouse', '2024-01-02 12:30:00'),
(2, 'Keyboard', '2024-02-01 14:00:00'),
(3, 'Monitor', '2024-03-15 16:45:00'),
(4, NULL, '2024-04-20 18:00:00'),  -- product_nameがNULL
(NULL, 'Tablet', '2024-05-05 20:15:00'),  -- user_idがNULL
(6, 'Smartphone', '2024-06-10 22:00:00');

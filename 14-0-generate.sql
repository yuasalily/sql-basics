DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;
USE my_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inactive_users (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);


-- ユーザー情報の挿入
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com');

-- 商品情報の挿入
INSERT INTO products (name, price) VALUES
('Laptop', 1500.00),
('Smartphone', 800.00),
('Tablet', 600.00);

-- 注文情報の挿入
INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2024-03-01 10:00:00'),  -- AliceがLaptopを1台購入
(1, 2, 2, '2024-03-02 15:30:00'),  -- AliceがSmartphoneを2台購入
(2, 3, 1, '2024-03-03 12:00:00'),  -- BobがTabletを1台購入
(3, 1, 1, '2024-03-04 09:45:00'),  -- CharlieがLaptopを1台購入
(3, 2, 1, '2024-03-05 14:20:00');  -- CharlieがSmartphoneを1台購入

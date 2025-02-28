CREATE DATABASE IF NOT EXISTS my_db; -- my_dbが存在しなければ作成
USE my_db;

DROP TABLE IF EXISTS order_items; -- テーブルが既に存在していたらレコード初期化のため削除
DROP TABLE IF EXISTS products; -- テーブルが既に存在していたらレコード初期化のため削除
DROP TABLE IF EXISTS orders; -- テーブルが既に存在していたらレコード初期化のため削除
DROP TABLE IF EXISTS users; -- テーブルが既に存在していたらレコード初期化のため削除


-- ユーザーテーブル
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50)
);

-- 注文テーブル（ユーザーごとの注文情報）
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 商品テーブル
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

-- 注文詳細テーブル（どの注文にどの商品が含まれるか）
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ユーザーのサンプルデータ
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eve', 'eve@example.com'),
('Frank', 'frank@example.com'),
('Grace', 'grace@example.com'),
('Hank', 'hank@example.com'),
('Ivy', 'ivy@example.com'),
('Jack', 'jack@example.com');

-- 商品のサンプルデータ
INSERT INTO products (product_name, price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 500.00),
('Headphones', 150.00),
('Monitor', 300.00),
('Keyboard', 50.00),
('Mouse', 30.00),
('Webcam', 90.00),
('Speaker', 120.00),
('External SSD', 200.00);

-- 注文のサンプルデータ
INSERT INTO orders (user_id, order_date, total_price) VALUES
(1, '2024-02-01', 1500.00),
(2, '2024-02-02', 500.00),
(3, '2024-02-03', 1200.00),
(1, '2024-02-04', 800.00),
(5, '2024-02-05', 80.00),  -- Eve's order
(6, '2024-02-06', 300.00), -- Frank's order
(7, '2024-02-07', 250.00), -- Grace's order
(8, '2024-02-08', 600.00), -- Hank's order
(9, '2024-02-09', 450.00), -- Ivy's order
(10, '2024-02-10', 750.00);-- Jack's order

-- 注文ごとの商品データ
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), -- AliceがLaptopを1台購入
(1, 4, 2), -- AliceがHeadphonesを2つ購入
(2, 3, 1), -- BobがTabletを1台購入
(3, 2, 1), -- CharlieがSmartphoneを1台購入
(4, 5, 2), -- AliceがMonitorを2台購入
(5, 6, 1), -- Eve bought a Keyboard
(5, 7, 1), -- Eve bought a Mouse
(6, 8, 1), -- Frank bought a Webcam
(6, 9, 1), -- Frank bought a Speaker
(7, 10, 1),-- Grace bought an External SSD
(8, 1, 1), -- Hank bought a Laptop
(8, 5, 1), -- Hank bought a Monitor
(9, 2, 1), -- Ivy bought a Smartphone
(9, 3, 2), -- Ivy bought two Tablets
(10, 4, 1),-- Jack bought Headphones
(10, 10, 2);-- Jack bought two External SSDs

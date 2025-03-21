DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;
USE my_db;

-- users テーブル: ユーザー情報
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,  -- ハッシュ化されたパスワード
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- orders テーブル: 注文情報
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- products テーブル: 商品情報
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- payments テーブル: 支払い情報
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ダミーデータを挿入
INSERT INTO users (username, email, password_hash) VALUES
('alice', 'alice@example.com', SHA2('password123', 256)),
('bob', 'bob@example.com', SHA2('securePass456', 256)),
('charlie', 'charlie@example.com', SHA2('mySuperSecret', 256));

INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'High-performance laptop', 1200.00, 10),
('Mouse', 'Wireless mouse', 25.50, 50),
('Keyboard', 'Mechanical keyboard', 75.00, 30);

INSERT INTO orders (user_id, product_id, quantity) VALUES
(1, 1, 1), -- Alice buys 1 laptop
(2, 2, 2), -- Bob buys 2 mice
(3, 3, 1); -- Charlie buys 1 keyboard

INSERT INTO payments (order_id, amount, payment_method) VALUES
(1, 1200.00, 'credit_card'),
(2, 51.00, 'paypal'),
(3, 75.00, 'bank_transfer');

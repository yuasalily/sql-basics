CREATE DATABASE IF NOT EXISTS my_db; -- my_dbが存在しなければ作成
USE my_db;

DROP TABLE IF EXISTS bank_accounts; -- テーブルが既に存在していたらレコード初期化のため削除
CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_name VARCHAR(50) NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO bank_accounts (account_name, balance) VALUES
('Alice', 1000.00),
('Bob', 1500.00),
('Charlie', 2000.00);
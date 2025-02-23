CREATE DATABASE IF NOT EXISTS my_db; -- my_dbが存在しなければ作成
USE my_db;

DROP TABLE IF EXISTS projects; -- テーブルが既に存在していたらレコード初期化のため削除
DROP TABLE IF EXISTS employees; -- テーブルが既に存在していたらレコード初期化のため削除
DROP TABLE IF EXISTS departments; -- テーブルが既に存在していたらレコード初期化のため削除


CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    budget DECIMAL(15,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (name) VALUES ('Engineering'), ('HR'), ('Sales');

INSERT INTO employees (name, department_id, salary, hire_date) VALUES
('Alice', 1, 60000, '2020-05-10'),
('Bob', 1, 75000, '2018-03-15'),
('Charlie', 2, 50000, '2019-07-20'),
('David', 3, 55000, '2021-01-10');

INSERT INTO projects (name, budget, department_id) VALUES
('Project A', 100000, 1),
('Project B', 200000, 1),
('Project C', 150000, 2),
('Project D', 180000, 3);

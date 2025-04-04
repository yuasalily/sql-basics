DROP DATABASE IF EXISTS my_db;
CREATE DATABASE my_db;
USE my_db;

CREATE TABLE IF NOT EXISTS people (
    id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    birth_day DATE DEFAULT "1995-5-1"
);

CREATE TABLE IF NOT EXISTS student (
    id INT PRIMARY KEY,
    first_name VARCHAR(20),
    birth_day DATE DEFAULT "2000-5-1"
);

INSERT INTO people (id, first_name, last_name, birth_day) VALUES
(1, 'Alice', 'Smith', '2000-01-15'),
(2, 'Bob', 'Johnson', '1992-07-23'),
(3, 'Charlie', 'Brown', '1985-11-05'),
(4, 'Alice', 'Davis', '1999-04-30'),
(5, 'Emily', 'Miller', '1995-05-01'),
(6, 'David', 'Wilson', '1980-12-11'),
(7, NULL, 'Thomas', '1991-08-21'),
(8, 'Sarah', 'White', '1993-06-14'),
(9, 'James', 'Harris', '2002-09-09'),
(10, 'Alice', 'Smith', '2000-01-15'),
(11, NULL, 'Johnson', '1989-03-17'),
(12, 'Chris', 'Brown', '1996-07-29'),
(13, 'Bob', 'Wilson', '1994-02-03'),
(14, 'Emma', 'Davis', '2001-12-25'),
(15, 'Daniel', 'Clark', '1987-10-13'),
(16, NULL, 'Miller', '1998-05-20'),
(17, 'Sophia', 'Walker', '1997-03-11'),
(18, 'Olivia', 'Allen', '2003-08-30'),
(19, 'Ethan', 'Young', '1990-04-05'),
(20, NULL, 'Smith', '1992-07-23'),
(21, 'Michael', 'Taylor', '1988-09-17'),
(22, 'Sophia', 'Brown', '2004-05-19'),
(23, 'Jacob', 'Wilson', '1993-11-30'),
(24, 'Emma', 'Johnson', '2002-02-14'),
(25, 'Liam', 'Moore', '1997-07-06'),
(26, 'Charlotte', 'Harris', '1985-12-20'),
(27, 'Benjamin', 'Allen', '1999-10-28'),
(28, 'Lucas', 'White', '2000-06-09'),
(29, 'Mia', 'Clark', '1986-01-31'),
(30, 'Alexander', 'Walker', '1995-09-04'),
(31, 'Olivia', 'Taylor', '1992-04-22'),
(32, NULL, 'Brown', '1983-08-14'),
(33, 'Ethan', 'Miller', '1990-03-09'),
(34, 'James', 'Harris', '2002-09-09'),
(35, 'William', 'Moore', '1996-11-17');




INSERT INTO student (id, first_name, birth_day) VALUES
(1, 'Alice', '2002-03-15'),
(2, 'Bob', '1999-07-23'),
(3, 'Charlie', '2001-11-05'),
(4, 'David', '2000-06-30'),
(5, 'Emily', '2003-09-12'),
(6, 'Frank', '2000-05-01'),
(7, NULL, '2001-02-28'),
(8, 'Grace', '1998-10-14'),
(9, 'Henry', '2004-12-25'),
(10, 'Isabella', '2000-05-01');
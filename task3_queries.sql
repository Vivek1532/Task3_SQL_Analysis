-- =========================================
-- Task 3: SQL Data Analysis Project
-- Author: Vivek Kumar
-- =========================================

-- Step 1: Create Database
CREATE DATABASE task3_sql;
USE task3_sql;

-- Step 2: Create Tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name TEXT,
    region TEXT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT,
    category TEXT
);

-- Step 3: Insert Data

INSERT INTO customers VALUES
(1,'Aman','North'),
(2,'Vivek','South'),
(3,'Riya','West'),
(4,'Karan','East'),
(5,'Neha','North'),
(6,'Arjun','West'),
(7,'Pooja','South'),
(8,'Rahul','East'),
(9,'Sneha','North'),
(10,'Aditi','West');

INSERT INTO orders VALUES
(101,8,1180,'Electronics'),
(102,3,1384,'Furniture'),
(103,7,1393,'Electronics'),
(104,7,356,'Clothing'),
(105,7,1167,'Electronics'),
(106,3,336,'Electronics'),
(107,5,1545,'Furniture'),
(108,9,1628,'Electronics'),
(109,6,340,'Clothing'),
(110,8,1697,'Clothing'),
(111,1,275,'Clothing'),
(112,6,1205,'Furniture'),
(113,10,1892,'Clothing'),
(114,1,1302,'Furniture'),
(115,9,1566,'Electronics'),
(116,10,471,'Clothing'),
(117,10,1359,'Electronics'),
(118,5,330,'Electronics'),
(119,2,340,'Clothing'),
(120,2,208,'Clothing');

-- Step 4: Verify Data

SELECT * FROM customers;
SELECT * FROM orders;

-- Step 5: Aggregate Queries

SELECT SUM(amount) AS total_sales FROM orders;

SELECT AVG(amount) AS avg_order FROM orders;

SELECT MAX(amount) AS highest_order FROM orders;

-- Step 6: GROUP BY

SELECT category,
       SUM(amount) AS category_sales
FROM orders
GROUP BY category;

SELECT category,
       COUNT(*) AS total_orders
FROM orders
GROUP BY category;

-- Step 7: JOIN

SELECT c.customer_id,
       c.name,
       c.region,
       o.amount,
       o.category
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- Step 8: Subquery

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE amount > 1000
);

-- Step 9: Create View

CREATE VIEW sales_view AS
SELECT c.name,
       o.amount,
       o.category
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM sales_view;

-- Step 10: Create Index

CREATE INDEX idx_customer
ON orders(customer_id);

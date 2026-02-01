mysql> CREATE DATABASE data_digger;
Query OK, 1 row affected (0.088 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| data_digger        |
| information_schema |
| inventory_db       |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.013 sec)

mysql> use data_digger;
Database changed

mysql> CREATE TABLE customers (
    ->customerID INT PRIMARY KEY,
    ->name VARCHAR(50),
    ->email VARCHAR(50),
    ->address VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.231 sec)

mysql> show tables;
+-----------------------+
| Tables_in_data_digger |
+-----------------------+
| customers             |
+-----------------------+

mysql> INSERT INTO customers VALUES
    -> (1, 'Alice', 'alice@gmail.com', 'Delhi'),
    -> (2, 'Bob', 'bob@gmail.com', 'Mumbai'),
    -> (3, 'Charlie', 'charlie@gmail.com', 'Rajkot'),
    -> (4, 'Alice', 'alice2@gmail.com', 'Vadodra'),
    -> (5, 'David', 'david@gmail.com', 'Pune');

-- Retrieve all customer details
mysql> SELECT * FROM customers;
+------------+---------+-------------------+---------+
| customerID | name    | email             | address |
+------------+---------+-------------------+---------+
|          1 | Alice   | alice@gmail.com   | Delhi   |
|          2 | Bob     | bob@gmail.com     | Mumbai  |
|          3 | Charlie | charlie@gmail.com | Rajkot  |
|          4 | Alice   | alice2@gmail.com  | Vadodra |
|          5 | David   | david@gmail.com   | Pune    |
+------------+---------+-------------------+---------+
5 rows in set (0.005 sec)

-- Update a customer's address
mysql> UPDATE customers
    -> SET address = 'Hyderabad'
    -> WHERE customerID = 5;

-- Delete a customer using customerID
mysql> DELETE FROM customers
    -> WHERE customerID = 5;
+------------+---------+-------------------+---------+
| customerID | name    | email             | address |
+------------+---------+-------------------+---------+
|          1 | Alice   | alice@gmail.com   | Delhi   |
|          2 | Bob     | bob@gmail.com     | Mumbai  |
|          3 | Charlie | charlie@gmail.com | Rajkot  |
|          4 | Alice   | alice2@gmail.com  | Vadodra |
+------------+---------+-------------------+---------+

-- Display customers whose name is 'Alice'
mysql> SELECT * FROM customers
    -> WHERE name = 'Alice';
+------------+-------+------------------+---------+
| customerID | name  | email            | address |
+------------+-------+------------------+---------+
|          1 | Alice | alice@gmail.com  | Delhi   |
|          4 | Alice | alice2@gmail.com | Vadodra |
+------------+-------+------------------+---------+


mysql> CREATE TABLE orders (
    -> orderID INT PRIMARY KEY,
    -> customerID INT,
    -> orderDate DATE,
    -> totalAmount INT,
    -> FOREIGN KEY (customerID) REFERENCES customers(customerID)
    -> );

mysql> show tables;
+-----------------------+
| Tables_in_data_digger |
+-----------------------+
| customers             |
| orders                |
+-----------------------+

mysql> INSERT INTO orders VALUES
    -> (101, 1, '2025-01-05', 1500),
    -> (102, 2, '2025-01-10', 2500),
    -> (103, 1, '2025-01-20', 800),
    -> (104, 3, '2025-01-25', 3200),
    -> (105, 4, '2025-01-28', 1200);
Query OK, 5 rows affected (0.057 sec)
+---------+------------+------------+-------------+
| orderID | customerID | orderDate  | totalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2025-01-05 |        1500 |
|     102 |          2 | 2025-01-10 |        2500 |
|     103 |          1 | 2025-01-20 |         800 |
|     104 |          3 | 2025-01-25 |        3200 |
|     105 |          4 | 2025-01-28 |        1200 |
+---------+------------+------------+-------------+

-- Retrieve all orders made by a specific customer
mysql> SELECT * FROM orders
    -> WHERE customerID = 1;
+---------+------------+------------+-------------+
| orderID | customerID | orderDate  | totalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2025-01-05 |        1500 |
|     103 |          1 | 2025-01-20 |         800 |
+---------+------------+------------+-------------+

-- Update an order's total amount
mysql> UPDATE orders
    -> SET totalAmount = 1800
    -> WHERE orderID = 101;
+---------+------------+------------+-------------+
| orderID | customerID | orderDate  | totalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2025-01-05 |        1800 |
|     102 |          2 | 2025-01-10 |        2500 |
|     103 |          1 | 2025-01-20 |         800 |
|     104 |          3 | 2025-01-25 |        3200 |
|     105 |          4 | 2025-01-28 |        1200 |
+---------+------------+------------+-------------+

-- Delete an order using orderID
mysql> DELETE FROM orders
    -> WHERE orderID = 103;
+---------+------------+------------+-------------+
| orderID | customerID | orderDate  | totalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2025-01-05 |        1800 |
|     102 |          2 | 2025-01-10 |        2500 |
|     104 |          3 | 2025-01-25 |        3200 |
|     105 |          4 | 2025-01-28 |        1200 |
+---------+------------+------------+-------------+

-- Highest, Lowest, and Average order amount
SELECT 
    MAX(totalAmount) AS HighestOrder,
    MIN(totalAmount) AS LowestOrder,
    AVG(totalAmount) AS AverageOrder
FROM orders;
+--------------+-------------+--------------+
| HighestOrder | LowestOrder | AverageOrder |
+--------------+-------------+--------------+
|         3200 |        1200 |    2175.0000 |
+--------------+-------------+--------------+

mysql> CREATE TABLE products (
    -> productID INT PRIMARY KEY,
    -> productName VARCHAR(100),
    -> price INT,
    -> stock INT
    -> );

mysql> INSERT INTO products VALUES
    -> (1, 'Laptop', 60000, 10),
    -> (2, 'Mobile', 15000, 20),
    -> (3, 'Headphones', 1200, 0),
    -> (4, 'Keyboard', 800, 15),
    -> (5, 'Monitor', 12000, 5);

mysql> select * from products;
+-----------+-------------+-------+-------+
| productID | productName | price | stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |    10 |
|         2 | Mobile      | 15000 |    20 |
|         3 | Headphones  |  1200 |     0 |
|         4 | Keyboard    |   800 |    15 |
|         5 | Monitor     | 12000 |     5 |
+-----------+-------------+-------+-------+

-- Retrieve all products sorted by price (descending)
mysql> SELECT * FROM products
    -> ORDER BY price DESC;
+-----------+-------------+-------+-------+
| productID | productName | price | stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |    10 |
|         2 | Mobile      | 15000 |    20 |
|         5 | Monitor     | 12000 |     5 |
|         3 | Headphones  |  1200 |     0 |
|         4 | Keyboard    |   800 |    15 |
+-----------+-------------+-------+-------+

-- Update price of a specific product
mysql> UPDATE products
    -> SET price = 14000
    -> WHERE productID = 2;
+-----------+-------------+-------+-------+
| productID | productName | price | stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |    10 |
|         2 | Mobile      | 14000 |    20 |
|         3 | Headphones  |  1200 |     0 |
|         4 | Keyboard    |   800 |    15 |
|         5 | Monitor     | 12000 |     5 |
+-----------+-------------+-------+-------+

-- Delete a product if out of stock
mysql> DELETE FROM products
    -> WHERE stock = 0;
+-----------+-------------+-------+-------+
| productID | productName | price | stock |
+-----------+-------------+-------+-------+
|         1 | Laptop      | 60000 |    10 |
|         2 | Mobile      | 14000 |    20 |
|         4 | Keyboard    |   800 |    15 |
|         5 | Monitor     | 12000 |     5 |
+-----------+-------------+-------+-------+

-- Retrieve products priced between ₹500 and ₹2000
mysql> SELECT * FROM products
    -> WHERE price BETWEEN 500 AND 2000;
+-----------+-------------+-------+-------+
| productID | productName | price | stock |
+-----------+-------------+-------+-------+
|         4 | Keyboard    |   800 |    15 |
+-----------+-------------+-------+-------+

-- Most expensive and cheapest product
mysql> SELECT
    ->     MAX(price) AS MostExpensive,
    ->     MIN(price) AS Cheapest
    -> FROM products;
+---------------+----------+
| MostExpensive | Cheapest |
+---------------+----------+
|         60000 |      800 |
+---------------+----------+

mysql> CREATE TABLE orderDetails (
    -> orderDetailID INT PRIMARY KEY,
    -> orderID INT,
    -> productID INT,
    -> quantity INT,
    -> subtotal INT,
    -> FOREIGN KEY (orderID) REFERENCES orders(orderID),
    -> FOREIGN KEY (productID) REFERENCES products(productID)
    -> );

mysql> INSERT INTO orderDetails VALUES
    -> (1, 101, 1, 1, 60000),
    -> (2, 101, 4, 2, 1600),
    -> (3, 102, 2, 1, 15000),
    -> (4, 104, 5, 1, 12000),
    -> (5, 105, 1, 1, 60000);
+---------------+---------+-----------+----------+----------+
| orderDetailID | orderID | productID | quantity | subtotal |
+---------------+---------+-----------+----------+----------+
|             1 |     101 |         1 |        1 |    60000 |
|             2 |     101 |         4 |        2 |     1600 |
|             3 |     102 |         2 |        1 |    15000 |
|             4 |     104 |         5 |        1 |    12000 |
|             5 |     105 |         1 |        1 |    60000 |
+---------------+---------+-----------+----------+----------+

-- Retrieve all order details for a specific order
mysql> SELECT * FROM orderDetails
    -> WHERE orderID = 101;
+---------------+---------+-----------+----------+----------+
| orderDetailID | orderID | productID | quantity | subtotal |
+---------------+---------+-----------+----------+----------+
|             1 |     101 |         1 |        1 |    60000 |
|             2 |     101 |         4 |        2 |     1600 |
+---------------+---------+-----------+----------+----------+

-- Calculate total revenue generated
mysql> SELECT SUM(subtotal) AS TotalRevenue
    -> FROM orderDetails;
+--------------+
| TotalRevenue |
+--------------+
|       148600 |
+--------------+

-- Top 3 most ordered products
mysql> SELECT productID, SUM(quantity) AS TotalQuantity
    -> FROM orderDetails
    -> GROUP BY productID
    -> ORDER BY TotalQuantity DESC
    -> LIMIT 3;
+-----------+---------------+
| productID | TotalQuantity |
+-----------+---------------+
|         1 |             2 |
|         4 |             2 |
|         2 |             1 |
+-----------+---------------+

-- Count how many times a specific product was sold
mysql> SELECT COUNT(*) AS ProductSold
    -> FROM orderDetails
    -> WHERE productID = 1;
+-------------+
| ProductSold |
+-------------+
|           2 |
+-------------+

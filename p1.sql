mysql> CREATE DATABASE data_transformer;
Query OK, 1 row affected (0.087 sec)

-- Customers Table
mysql> CREATE TABLE Customers (
    -> CustomerID INT PRIMARY KEY,
    -> FirstName VARCHAR(50),
    -> LastName VARCHAR(50),
    -> Email VARCHAR(50),
    -> RegistrationDate DATE
    -> );

mysql> SHOW tables;
+----------------------------+
| Tables_in_data_transformer |
+----------------------------+
| customers                  |
+----------------------------+

mysql> INSERT INTO Customers VALUES
    -> (1, 'John', 'Doe', '  john.doe@email.com  ', '2022-03-15'),
    -> (2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');
mysql> select * from customers;
+------------+-----------+----------+------------------------+------------------+
| CustomerID | FirstName | LastName | Email                  | RegistrationDate |
+------------+-----------+----------+------------------------+------------------+
|          1 | John      | Doe      |   john.doe@email.com   | 2022-03-15       |
|          2 | Jane      | Smith    | jane.smith@email.com   | 2021-11-02       |
+------------+-----------+----------+------------------------+------------------+

-- Orders Table
mysql> CREATE TABLE Orders (
    -> OrderID INT PRIMARY KEY,
    -> CustomerID INT,
    -> OrderDate DATE,
    -> TotalAmount DECIMAL(10,2),
    -> FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
+----------------------------+
| Tables_in_data_transformer |
+----------------------------+
| customers                  |
| orders                     |
+----------------------------+

mysql> INSERT INTO Orders VALUES
    -> (101, 1, '2023-07-01', 150.50),
    -> (102, 2, '2023-07-03', 200.75);
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |      150.50 |
|     102 |          2 | 2023-07-03 |      200.75 |
+---------+------------+------------+-------------+

-- Employees Table
mysql> CREATE TABLE Employees (
    -> EmployeeID INT PRIMARY KEY,
    -> FirstName VARCHAR(50),
    -> LastName VARCHAR(50),
    -> Department VARCHAR(50),
    -> HireDate DATE,
    -> Salary DECIMAL(10,2)
    -> );
+----------------------------+
| Tables_in_data_transformer |
+----------------------------+
| customers                  |
| employees                  |
| orders                     |
+----------------------------+

mysql> INSERT INTO Employees VALUES
    -> (1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
    -> (2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);
+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          1 | Mark      | Johnson  | Sales      | 2020-01-15 | 50000.00 |
|          2 | Susan     | Lee      | HR         | 2021-03-20 | 55000.00 |
+------------+-----------+----------+------------+------------+----------+

--1
mysql> SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
    -> FROM Orders o
    -> INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
+---------+-----------+----------+------------+-------------+
| OrderID | FirstName | LastName | OrderDate  | TotalAmount |
+---------+-----------+----------+------------+-------------+
|     101 | John      | Doe      | 2023-07-01 |      150.50 |
|     102 | Jane      | Smith    | 2023-07-03 |      200.75 |
+---------+-----------+----------+------------+-------------+

--2
mysql> SELECT c.FirstName, c.LastName, o.OrderID, o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
+-----------+----------+---------+-------------+
| FirstName | LastName | OrderID | TotalAmount |
+-----------+----------+---------+-------------+
| John      | Doe      |     101 |      150.50 |
| Jane      | Smith    |     102 |      200.75 |
+-----------+----------+---------+-------------+

--3
mysql> SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+---------+-----------+----------+-------------+
| OrderID | FirstName | LastName | TotalAmount |
+---------+-----------+----------+-------------+
|     101 | John      | Doe      |      150.50 |
|     102 | Jane      | Smith    |      200.75 |
+---------+-----------+----------+-------------+

--4
mysql> SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
    -> UNION
    -> SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
    -> FROM Customers c
    -> RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
+------------+-----------+---------+-------------+
| CustomerID | FirstName | OrderID | TotalAmount |
+------------+-----------+---------+-------------+
|          1 | John      |     101 |      150.50 |
|          2 | Jane      |     102 |      200.75 |
+------------+-----------+---------+-------------+

--5
mysql> SELECT DISTINCT CustomerID
    -> FROM Orders
    -> WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);
+------------+
| CustomerID |
+------------+
|          2 |
+------------+

--6
mysql> SELECT *
    -> FROM Employees
    -> WHERE Salary > (SELECT AVG(Salary) FROM Employees);
+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          2 | Susan     | Lee      | HR         | 2021-03-20 | 55000.00 |
+------------+-----------+----------+------------+------------+----------+

--7
mysql> SELECT OrderID,
    -> YEAR(OrderDate) AS OrderYear,
    -> MONTH(OrderDate) AS OrderMonth
    -> FROM Orders;
+---------+-----------+------------+
| OrderID | OrderYear | OrderMonth |
+---------+-----------+------------+
|     101 |      2023 |          7 |
|     102 |      2023 |          7 |
+---------+-----------+------------+

--8
mysql> SELECT OrderID,
    -> DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
    -> FROM Orders;
+---------+----------------+
| OrderID | DaysDifference |
+---------+----------------+
|     101 |            947 |
|     102 |            945 |
+---------+----------------+

--9
mysql> SELECT OrderID,
    -> DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormatedDate
    -> FROM Orders;
+---------+---------------+
| OrderID | FormatedDate |
+---------+---------------+
|     101 | 01-07-2023    |
|     102 | 03-07-2023    |
+---------+---------------+

--10
mysql> SELECT CONCAT(FirstName, ' ', LastName) AS FullName
    -> FROM Customers;
+------------+
| FullName   |
+------------+
| John Doe   |
| Jane Smith |
+------------+

--11
mysql> SELECT REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedName
    -> FROM Customers;
+-------------+
| UpdatedName |
+-------------+
| Jonathan    |
| Jane        |
+-------------+

--12
mysql> SELECT UPPER(FirstName) AS FirstName,
    -> LOWER(LastName) AS LastName
    -> FROM Customers;
+-----------+----------+
| FirstName | LastName |
+-----------+----------+
| JOHN      | doe      |
| JANE      | smith    |
+-----------+----------+

--13
mysql> SELECT TRIM(Email) AS CleanEmail
    -> FROM Customers;
+----------------------+
| CleanEmail           |
+----------------------+
| john.doe@email.com   |
| jane.smith@email.com |
+----------------------+

--14
mysql> SELECT OrderID, OrderDate, TotalAmount,
    -> SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal
    -> FROM Orders;
+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
+---------+------------+-------------+--------------+
--15
mysql> SELECT OrderID, TotalAmount,
    -> RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
    -> FROM Orders;
+---------+-------------+-----------+
| OrderID | TotalAmount | OrderRank |
+---------+-------------+-----------+
|     102 |      200.75 |         1 |
|     101 |      150.50 |         2 |
+---------+-------------+-----------+

--16
mysql> SELECT OrderID, TotalAmount,
    ->      CASE
    ->            WHEN TotalAmount > 1000 THEN '10% Discount'
    ->            WHEN TotalAmount > 500 THEN '5% Discount'
    ->            ELSE 'No Discount'
    ->        END AS Discount
    -> FROM Orders;
+---------+-------------+-------------+
| OrderID | TotalAmount | Discount    |
+---------+-------------+-------------+
|     101 |      150.50 | No Discount |
|     102 |      200.75 | No Discount |
+---------+-------------+-------------+

--17
mysql> SELECT EmployeeID, FirstName, Salary,
    ->        CASE
    ->            WHEN Salary >= 55000 THEN 'High'
    ->            WHEN Salary >= 50000 THEN 'Medium'
    ->            ELSE 'Low'
    ->        END AS SalaryCategory
    -> FROM Employees;
+------------+-----------+----------+----------------+
| EmployeeID | FirstName | Salary   | SalaryCategory |
+------------+-----------+----------+----------------+
|          1 | Mark      | 50000.00 | Medium         |
|          2 | Susan     | 55000.00 | High           |
+------------+-----------+----------+----------------+


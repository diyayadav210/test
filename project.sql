CREATE DATABASE project;

USE project;

CREATE TABLE students (
    studentid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100),
    birthdate DATE,
    enrollmentdate DATE
);

CREATE TABLE departments (
    departmentid INT PRIMARY KEY,
    departmentname VARCHAR(100)
);

CREATE TABLE courses (
    courseid INT PRIMARY KEY,
    coursename VARCHAR(100),
    departmentid INT,
    credits INT,
    FOREIGN KEY (departmentid) REFERENCES departments(departmentid)
);

CREATE TABLE instructors (
    instructorid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100),
    departmentid INT,
    salary DECIMAL(10,2),  
    FOREIGN KEY (departmentid) REFERENCES departments(departmentid)
);

CREATE TABLE enrollments (
    enrollmentid INT PRIMARY KEY,
    studentid INT,
    courseid INT,
    enrollmentdate DATE,
    FOREIGN KEY (studentid) REFERENCES students(studentid),
    FOREIGN KEY (courseid) REFERENCES courses(courseid)
);
+-------------------+
| Tables_in_project |
+-------------------+
| courses           |
| departments       |
| enrollments       |
| instructors       |
| students          |
+-------------------+

INSERT INTO departments VALUES
(1, 'computer science'),
(2, 'mathematics');
+--------------+------------------+
| departmentid | departmentname   |
+--------------+------------------+
|            1 | computer science |
|            2 | mathematics      |
+--------------+------------------+

INSERT INTO students VALUES
(1, 'Foram', 'Joshi', 'foram.joshi@email.com', '2000-01-15', '2022-08-01'),
(2, 'Hiren', 'Varma', 'hiren.varma@email.com', '1999-05-25', '2021-08-01'),
(3, 'Jiya', 'Sharma', 'jiya.sharma@email.com', '2001-03-10', '2023-09-01'),
(4, 'Sara', 'Khan', 'sara.khan@email.com', '2000-07-12', '2020-08-01'),
(5, 'Virat', 'Oza', 'virat.oza@email.com', '1998-11-30', '2019-08-01');
+-----------+-----------+----------+-----------------------+------------+----------------+
| studentid | firstname | lastname | email                 | birthdate  | enrollmentdate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         1 | Foram     | Joshi    | foram.joshi@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Hiren     | Varma    | hiren.varma@email.com | 1999-05-25 | 2021-08-01     |
|         3 | Jiya      | Sharma   | jiya.sharma@email.com | 2001-03-10 | 2023-09-01     |
|         4 | Sara      | Khan     | sara.khan@email.com   | 2000-07-12 | 2020-08-01     |
|         5 | Virat     | Oza      | virat.oza@email.com   | 1998-11-30 | 2019-08-01     |
+-----------+-----------+----------+-----------------------+------------+----------------+

INSERT INTO courses VALUES
(101, 'introduction to sql', 1, 3),
(102, 'data structures', 1, 4),
(103, 'linear algebra', 2, 3),
(104, 'statistics', 2, 4);
+----------+---------------------+--------------+---------+
| courseid | coursename          | departmentid | credits |
+----------+---------------------+--------------+---------+
|      101 | introduction to sql |            1 |       3 |
|      102 | data structures     |            1 |       4 |
|      103 | linear algebra      |            2 |       3 |
|      104 | statistics          |            2 |       4 |
+----------+---------------------+--------------+---------+

INSERT INTO instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 90000),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 85000);
+--------------+-----------+----------+------------------------+--------------+----------+
| instructorid | firstname | lastname | email                  | departmentid | salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 90000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 85000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+

INSERT INTO enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 101, '2023-09-01'),
(4, 3, 102, '2023-09-01'),
(5, 4, 103, '2020-08-01'),
(6, 5, 104, '2019-08-01');
+--------------+-----------+----------+----------------+
| enrollmentid | studentid | courseid | enrollmentdate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      101 | 2023-09-01     |
|            4 |         3 |      102 | 2023-09-01     |
|            5 |         4 |      103 | 2020-08-01     |
|            6 |         5 |      104 | 2019-08-01     |
+--------------+-----------+----------+----------------+

--1
INSERT INTO students VALUES (6, 'Om', 'Vala', 'omvala@email.com', '2002-02-02', '2024-08-01');

UPDATE students
SET email = 'foramm.joshi@email.com'
WHERE studentid = 1;

SELECT * FROM students;
+-----------+-----------+----------+------------------------+------------+----------------+
| studentid | firstname | lastname | email                  | birthdate  | enrollmentdate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | Foram     | Joshi    | foramm.joshi@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Hiren     | Varma    | hiren.varma@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Jiya      | Sharma   | jiya.sharma@email.com  | 2001-03-10 | 2023-09-01     |
|         4 | Sara      | Khan     | sara.khan@email.com    | 2000-07-12 | 2020-08-01     |
|         5 | Virat     | Oza      | virat.oza@email.com    | 1998-11-30 | 2019-08-01     |
|         6 | Om        | Vala     | omvala@email.com       | 2002-02-02 | 2024-08-01     |
+-----------+-----------+----------+------------------------+------------+----------------+

DELETE FROM students
WHERE studentid = 6;
+-----------+-----------+----------+------------------------+------------+----------------+
| studentid | firstname | lastname | email                  | birthdate  | enrollmentdate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | Foram     | Joshi    | foramm.joshi@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Hiren     | Varma    | hiren.varma@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Jiya      | Sharma   | jiya.sharma@email.com  | 2001-03-10 | 2023-09-01     |
|         4 | Sara      | Khan     | sara.khan@email.com    | 2000-07-12 | 2020-08-01     |
|         5 | Virat     | Oza      | virat.oza@email.com    | 1998-11-30 | 2019-08-01     |
+-----------+-----------+----------+------------------------+------------+----------------+

--2
SELECT *
FROM students
WHERE enrollmentdate > '2022-12-31';
+-----------+-----------+----------+-----------------------+------------+----------------+
| studentid | firstname | lastname | email                 | birthdate  | enrollmentdate |
+-----------+-----------+----------+-----------------------+------------+----------------+
|         3 | Jiya      | Sharma   | jiya.sharma@email.com | 2001-03-10 | 2023-09-01     |
+-----------+-----------+----------+-----------------------+------------+----------------+

--3
SELECT * FROM courses
WHERE departmentid = 2
LIMIT 5;
+----------+----------------+--------------+---------+
| courseid | coursename     | departmentid | credits |
+----------+----------------+--------------+---------+
|      103 | linear algebra |            2 |       3 |
|      104 | statistics     |            2 |       4 |
+----------+----------------+--------------+---------+

--4
SELECT courseid, COUNT(studentid) 
FROM enrollments
GROUP BY courseid
HAVING COUNT(studentid) > 1;
+----------+---------------+
| courseid | student_count |
+----------+---------------+
|      101 |             2 |
|      102 |             2 |
+----------+---------------+

--5
SELECT studentid FROM enrollments
WHERE courseid = 101 INTERSECT SELECT studentid 
FROM enrollments 
WHERE courseid = 102;
+-----------+
| studentid |
+-----------+
|         3 |
+-----------+

--6
SELECT DISTINCT s.studentid, s.firstname, s.lastname
FROM students s
JOIN enrollments e ON s.studentid = e.studentid
JOIN courses c ON e.courseid = c.courseid
WHERE c.coursename IN ('introduction to sql', 'data structures');
+-----------+-----------+----------+
| studentid | firstname | lastname |
+-----------+-----------+----------+
|         1 | Foram     | Joshi    |
|         3 | Jiya      | Sharma   |
|         2 | Hiren     | Varma    |
+-----------+-----------+----------+

--7
SELECT AVG(credits) AS avg_credits
FROM courses;
+-------------+
| avg_credits |
+-------------+
|      3.5000 |
+-------------+

--8
SELECT MAX(salary) AS max_salary
FROM instructors;
+------------+
| max_salary |
+------------+
|   90000.00 |
+------------+

--9
SELECT d.departmentname, COUNT(e.studentid) AS student_count
FROM departments d
JOIN courses c ON d.departmentid = c.departmentid
JOIN enrollments e ON c.courseid = e.courseid
GROUP BY d.departmentname;
+------------------+---------------+
| departmentname   | student_count |
+------------------+---------------+
| computer science |             4 |
| mathematics      |             2 |
+------------------+---------------+

--10
SELECT s.firstname, s.lastname, c.coursename
FROM students s
JOIN enrollments e ON s.studentid = e.studentid
JOIN courses c ON e.courseid = c.courseid;
+-----------+----------+---------------------+
| firstname | lastname | coursename          |
+-----------+----------+---------------------+
| Foram     | Joshi    | introduction to sql |
| Jiya      | Sharma   | introduction to sql |
| Hiren     | Varma    | data structures     |
| Jiya      | Sharma   | data structures     |
| Sara      | Khan     | linear algebra      |
| Virat     | Oza      | statistics          |
+-----------+----------+---------------------+

--11
SELECT s.firstname, s.lastname, c.coursename
FROM students s
LEFT JOIN enrollments e ON s.studentid = e.studentid
LEFT JOIN courses c ON e.courseid = c.courseid;
+-----------+----------+---------------------+
| firstname | lastname | coursename          |
+-----------+----------+---------------------+
| Foram     | Joshi    | introduction to sql |
| Hiren     | Varma    | data structures     |
| Jiya      | Sharma   | introduction to sql |
| Jiya      | Sharma   | data structures     |
| Sara      | Khan     | linear algebra      |
| Virat     | Oza      | statistics          |
+-----------+----------+---------------------+

--12
SELECT *
FROM students
WHERE studentid IN (
    SELECT studentid
    FROM enrollments
    WHERE courseid IN (
        SELECT courseid
        FROM enrollments
        GROUP BY courseid
        HAVING COUNT(studentid) > 1
    )
);
+-----------+-----------+----------+------------------------+------------+----------------+
| studentid | firstname | lastname | email                  | birthdate  | enrollmentdate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | Foram     | Joshi    | foramm.joshi@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Hiren     | Varma    | hiren.varma@email.com  | 1999-05-25 | 2021-08-01     |
|         3 | Jiya      | Sharma   | jiya.sharma@email.com  | 2001-03-10 | 2023-09-01     |
+-----------+-----------+----------+------------------------+------------+----------------+

--13
SELECT firstname, lastname, EXTRACT(YEAR FROM enrollmentdate) as enrollment_year 
FROM students;
+-----------+----------+-----------------+
| firstname | lastname | enrollment_year |
+-----------+----------+-----------------+
| Foram     | Joshi    |            2022 |
| Hiren     | Varma    |            2021 |
| Jiya      | Sharma   |            2023 |
| Sara      | Khan     |            2020 |
| Virat     | Oza      |            2019 |
+-----------+----------+-----------------+

--14
SELECT CONCAT(firstname, ' ', lastname) AS full_name
FROM instructors;
+---------------+
| full_name     |
+---------------+
| Alice Johnson |
| Bob Lee       |
+---------------+

--15
SELECT enrollmentid, 
COUNT(studentid) OVER (ORDER BY enrollmentid) AS running_total
FROM enrollments;
+--------------+---------------+
| enrollmentid | running_total |
+--------------+---------------+
|            1 |             1 |
|            2 |             2 |
|            3 |             3 |
|            4 |             4 |
|            5 |             5 |
|            6 |             6 |
+--------------+---------------+

--16
SELECT firstname, lastname, enrollmentdate,
    CASE 
        WHEN enrollmentdate <= '2022-02-15' THEN 'Senior'
        ELSE 'Junior'
    END AS student_status
FROM students;
+-----------+----------+----------------+----------------+
| firstname | lastname | enrollmentdate | student_status |
+-----------+----------+----------------+----------------+
| Foram     | Joshi    | 2022-08-01     | Junior         |
| Hiren     | Varma    | 2021-08-01     | Senior         |
| Jiya      | Sharma   | 2023-09-01     | Junior         |
| Sara      | Khan     | 2020-08-01     | Senior         |
| Virat     | Oza      | 2019-08-01     | Senior         |
+-----------+----------+----------------+----------------+






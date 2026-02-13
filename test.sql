CREATE DATABASE hospital_management;

USE hospital_management;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(10),
    email VARCHAR(100),
    address TEXT,
    registration_date DATE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(100),
    phone_number VARCHAR(10),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10,2)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE medical_records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    prescription TEXT,
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE billing (
    invoice_id INT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE doctor_department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
+-------------------------------+
| Tables_in_hospital_management |
+-------------------------------+
| appointments                  |
| billing                       |
| departments                   |
| doctor_department             |
| doctors                       |
| medical_records               |
| patients                      |
+-------------------------------+

INSERT INTO patients VALUES
(1, 'Rahul Sharma', '1990-05-10', 'Male', NULL, 'rahul@email.com', 'Delhi', '2025-01-10'),
(2, 'Anita Verma', '1985-08-20', 'Female', '9876543210', 'anita@email.com', 'Mumbai', '2024-03-15'),
(3, 'Karan Mehta', '2000-11-02', 'Male', '9123456780', 'karan@email.com', 'Pune', '2023-07-01');
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+
| patient_id | name         | dob        | gender | phone_number | email           | address | registration_date |
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+
|          1 | Rahul Sharma | 1990-05-10 | Male   | NULL         | rahul@email.com | Delhi   | 2025-01-10        |
|          2 | Anita Verma  | 1985-08-20 | Female | 9876543210   | anita@email.com | Mumbai  | 2024-03-15        |
|          3 | Karan Mehta  | 2000-11-02 | Male   | 9123456780   | karan@email.com | Pune    | 2023-07-01        |
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+
INSERT INTO doctors VALUES
(1, ' Dr. Singh ', 'Cardiology', '9999999999', 'singh@hospital.com', 'Mon-Fri', 1500),
(2, 'Dr. Patel', 'Neurology', NULL, 'patel@hospital.com', 'Tue-Sat', 1200),
(3, 'Dr. Roy', 'Dermatology', '8888888888', 'roy@hospital.com', 'Mon-Thu', 800);
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
| doctor_id | name        | specialization | phone_number | email              | available_days | consultation_fee |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
|         1 |  Dr. Singh  | Cardiology     | 9999999999   | singh@hospital.com | Mon-Fri        |          1500.00 |
|         2 | Dr. Patel   | Neurology      | NULL         | patel@hospital.com | Tue-Sat        |          1200.00 |
|         3 | Dr. Roy     | Dermatology    | 8888888888   | roy@hospital.com   | Mon-Thu        |           800.00 |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
INSERT INTO appointments VALUES
(1, 1, 1, '2025-02-01', 'completed'),
(2, 2, 1, '2025-02-05', 'scheduled'),
(3, 2, 2, '2024-01-10', 'cancelled'),
(4, 3, 3, '2025-02-10', 'completed');
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         1 | 2025-02-01       | completed |
|              2 |          2 |         1 | 2025-02-05       | scheduled |
|              3 |          2 |         2 | 2024-01-10       | cancelled |
|              4 |          3 |         3 | 2025-02-10       | completed |
+----------------+------------+-----------+------------------+-----------+
INSERT INTO medical_records VALUES
(1, 1, 1, 'Hypertension', 'Medication A', '2025-02-01'),
(2, 2, 1, 'Heart Issue', 'Medication B', '2025-02-05'),
(3, 2, 2, 'Migraine', 'Medication C', '2024-01-10'),
(4, 2, 2, 'Migraine Followup', 'Medication D', '2024-02-10');
+-----------+------------+-----------+-------------------+--------------+----------------+
| record_id | patient_id | doctor_id | diagnosis         | prescription | treatment_date |
+-----------+------------+-----------+-------------------+--------------+----------------+
|         1 |          1 |         1 | Hypertension      | Medication A | 2025-02-01     |
|         2 |          2 |         1 | Heart Issue       | Medication B | 2025-02-05     |
|         3 |          2 |         2 | Migraine          | Medication C | 2024-01-10     |
|         4 |          2 |         2 | Migraine Followup | Medication D | 2024-02-10     |
+-----------+------------+-----------+-------------------+--------------+----------------+
INSERT INTO billing VALUES
(1, 1, 1, 1500, 'paid', '2025-02-01'),
(2, 2, 2, 1500, 'pending', NULL),
(3, 3, 4, 800, 'paid', '2025-02-10');
+------------+------------+----------------+---------+----------------+--------------+
| invoice_id | patient_id | appointment_id | amount  | payment_status | payment_date |
+------------+------------+----------------+---------+----------------+--------------+
|          1 |          1 |              1 | 1500.00 | paid           | 2025-02-01   |
|          2 |          2 |              2 | 1500.00 | pending        | NULL         |
|          3 |          3 |              4 |  800.00 | paid           | 2025-02-10   |
+------------+------------+----------------+---------+----------------+--------------+
INSERT INTO departments VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Dermatology');
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | Cardiology      |
|             2 | Neurology       |
|             3 | Dermatology     |
+---------------+-----------------+
INSERT INTO doctor_department VALUES
(1, 1),
(2, 2),
(3, 3);
+-----------+---------------+
| doctor_id | department_id |
+-----------+---------------+
|         1 |             1 |
|         2 |             2 |
|         3 |             3 |
+-----------+---------------+
INSERT INTO patients VALUES
(4, 'Neha Kapoor', '1995-09-09', 'Female', '8956743291', 'neha@email.com', 'Jaipur', CURRENT_DATE);

UPDATE patients
SET address = 'Surat'
WHERE patient_id = 1;
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+
| patient_id | name         | dob        | gender | phone_number | email           | address | registration_date |
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+
|          1 | Rahul Sharma | 1990-05-10 | Male   | NULL         | rahul@email.com | Surat   | 2025-01-10        |
|          2 | Anita Verma  | 1985-08-20 | Female | 9876543210   | anita@email.com | Mumbai  | 2024-03-15        |
|          3 | Karan Mehta  | 2000-11-02 | Male   | 9123456780   | karan@email.com | Pune    | 2023-07-01        |
|          4 | Neha Kapoor  | 1995-09-09 | Female | 8956743291   | neha@email.com  | Jaipur  | 2026-02-13        |
+------------+--------------+------------+--------+--------------+-----------------+---------+-------------------+

DELETE FROM appointments
WHERE status = 'cancelled';
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              1 |          1 |         1 | 2025-02-01       | completed |
|              2 |          2 |         1 | 2025-02-05       | scheduled |
|              4 |          3 |         3 | 2025-02-10       | completed |
+----------------+------------+-----------+------------------+-----------+

SELECT *FROM patients
WHERE registration_date >= CURRENT_DATE - INTERVAL '1 year';

SELECT patient_id, SUM(amount) 
FROM billing 
GROUP BY patient_id 
ORDER BY SUM(amount) DESC 
LIMIT 2;
+------------+-------------+
| patient_id | total_spent |
+------------+-------------+
|          1 |     1500.00 |
|          2 |     1500.00 |
+------------+-------------+

SELECT * FROM doctors
WHERE consultation_fee > 1000;
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
| doctor_id | name        | specialization | phone_number | email              | available_days | consultation_fee |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
|         1 |  Dr. Singh  | Cardiology     | 9999999999   | singh@hospital.com | Mon-Fri        |          1500.00 |
|         2 | Dr. Patel   | Neurology      | NULL         | patel@hospital.com | Tue-Sat        |          1200.00 |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+

SELECT * FROM appointments
WHERE status = 'scheduled'
AND doctor_id = 1;
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              2 |          2 |         1 | 2025-02-05       | scheduled |
+----------------+------------+-----------+------------------+-----------+

SELECT * FROM doctors
WHERE specialization = 'Cardiology'
OR specialization = 'Neurology';
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
| doctor_id | name        | specialization | phone_number | email              | available_days | consultation_fee |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
|         1 |  Dr. Singh  | Cardiology     | 9999999999   | singh@hospital.com | Mon-Fri        |          1500.00 |
|         2 | Dr. Patel   | Neurology      | NULL         | patel@hospital.com | Tue-Sat        |          1200.00 |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+

SELECT * FROM doctors
ORDER BY specialization;
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
| doctor_id | name        | specialization | phone_number | email              | available_days | consultation_fee |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+
|         1 |  Dr. Singh  | Cardiology     | 9999999999   | singh@hospital.com | Mon-Fri        |          1500.00 |
|         3 | Dr. Roy     | Dermatology    | 8888888888   | roy@hospital.com   | Mon-Thu        |           800.00 |
|         2 | Dr. Patel   | Neurology      | NULL         | patel@hospital.com | Tue-Sat        |          1200.00 |
+-----------+-------------+----------------+--------------+--------------------+----------------+------------------+

SELECT doctor_id, COUNT(*) AS patient_count
FROM appointments
GROUP BY doctor_id;
+-----------+---------------+
| doctor_id | patient_count |
+-----------+---------------+
|         1 |             2 |
|         3 |             1 |
+-----------+---------------+

SELECT SUM(amount) AS total_revenue FROM billing;
+---------------+
| total_revenue |
+---------------+
|       3800.00 |
+---------------+

SELECT doctor_id, COUNT(*) AS visits
FROM appointments
GROUP BY doctor_id
ORDER BY visits DESC
LIMIT 1;
+-----------+--------+
| doctor_id | visits |
+-----------+--------+
|         1 |      2 |
+-----------+--------+

SELECT AVG(consultation_fee) FROM doctors;
+-----------------------+
| AVG(consultation_fee) |
+-----------------------+
|           1166.666667 |
+-----------------------+

SELECT doc.name, d.department_name
FROM doctors doc
INNER JOIN doctor_department dd ON doc.doctor_id = dd.doctor_id
INNER JOIN departments d ON dd.department_id = d.department_id;
+-------------+-----------------+
| name        | department_name |
+-------------+-----------------+
|  Dr. Singh  | Cardiology      |
| Dr. Patel   | Neurology       |
| Dr. Roy     | Dermatology     |
+-------------+-----------------+

SELECT p.name, a.status
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'completed';
+--------------+-----------+
| name         | status    |
+--------------+-----------+
| Rahul Sharma | completed |
| Karan Mehta  | completed |
+--------------+-----------+

SELECT doctor_id
FROM appointments
GROUP BY doctor_id
HAVING COUNT(DISTINCT patient_id) > 50;
Empty set (0.048 sec)

SELECT patient_id
FROM billing
GROUP BY patient_id
HAVING SUM(amount) = (
    SELECT MAX(total_spent)
    FROM (
        SELECT SUM(amount) AS total_spent
        FROM billing
        GROUP BY patient_id
    ) 
);
+------------+
| patient_id |
+------------+
|          1 |
|          2 |
+------------+

SELECT *
FROM appointments
WHERE doctor_id IN (
    SELECT doctor_id
    FROM doctors
    WHERE specialization = 'Dermatology'
);
+----------------+------------+-----------+------------------+-----------+
| appointment_id | patient_id | doctor_id | appointment_date | status    |
+----------------+------------+-----------+------------------+-----------+
|              4 |          3 |         3 | 2025-02-10       | completed |
+----------------+------------+-----------+------------------+-----------+

SELECT EXTRACT(MONTH FROM appointment_date) AS month, COUNT()
FROM appointments
GROUP BY month;
+-------+----------+
| month | COUNT(*) |
+-------+----------+
|     2 |        3 |
+-------+----------+

SELECT UPPER(name) FROM patients;
+--------------+
| UPPER(name)  |
+--------------+
| RAHUL SHARMA |
| ANITA VERMA  |
| KARAN MEHTA  |
| NEHA KAPOOR  |
+--------------+

SELECT TRIM(name) FROM doctors;
+------------+
| TRIM(name) |
+------------+
| Dr. Singh  |
| Dr. Patel  |
| Dr. Roy    |
+------------+

SELECT COALESCE(phone_number, 'Not Available') AS phone_number
FROM patients;
+---------------+
| phone_number  |
+---------------+
| Not Available |
| 9876543210    |
| 9123456780    |
| 8956743291    |
+---------------+

SELECT payment_date,
       SUM(amount) OVER (ORDER BY payment_date) AS cumulative_revenue
FROM billing;
+--------------+--------------------+
| payment_date | cumulative_revenue |
+--------------+--------------------+
| NULL         |            1500.00 |
| 2025-02-01   |            3000.00 |
| 2025-02-10   |            3800.00 |
+--------------+--------------------+

SELECT appointment_id,
       COUNT(*) OVER (ORDER BY appointment_id) AS running_total
FROM appointments;
+----------------+---------------+
| appointment_id | running_total |
+----------------+---------------+
|              1 |             1 |
|              2 |             2 |
|              4 |             3 |
+----------------+---------------+

SELECT patient_id,
       COUNT(record_id),
       CASE
           WHEN COUNT(record_id) > 4 THEN 'High'
           WHEN COUNT(record_id) BETWEEN 2 AND 3 THEN 'Medium'
           ELSE 'Low'
       END AS risk_level
FROM medical_records
GROUP BY patient_id;
+------------+------------------+------------+
| patient_id | COUNT(record_id) | risk_level |
+------------+------------------+------------+
|          1 |                1 | Low        |
|          2 |                3 | Medium     |
+------------+------------------+------------+

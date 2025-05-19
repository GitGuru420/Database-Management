-- Functions
-- 1. UPPER()
SELECT UPPER(country_name) AS country_name FROM countries;

-- 2. LOWER()
SELECT LOWER(email) AS email FROM employees;

-- 3. COUNT()
SELECT COUNT(department_id) AS total_department_id FROM job_history;

-- 4. SUM()
SELECT SUM(salary) AS total_salary FROM employees;

-- 5. AVG()
SELECT AVG(max_salary) AS maximum_average_salary FROM jobs;

-- 6. MAX()
SELECT MAX(salary) FROM employees;

-- 7. MIN()
SELECT MIN(salary) FROM employees;

-- 8. CONCAT()
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- 9. SUBSTRING()
SELECT SUBSTRING(country_name, 1, 3) FROM countries;

-- 10. ROUND()
SELECT ROUND(22.345);
SELECT ROUND(22.995);

-- 11. ABS()
SELECT ABS(-5);

-- 12. POWER()
SELECT POWER(2,3);

-- 13. SQRT()
SELECT SQRT(36);

-- 14. CEILING()
SELECT CEILING(3.4);

-- GROUP Functions
SELECT COUNT(email) FROM employees;
SELECT COUNT(*) FROM employees;

-- GROUP BY Query
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 6000;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING department_id != 30;

CREATE DATABASE functions;
USE functions;

CREATE TABLE student (
	student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100)
);

-- add new column to table
ALTER TABLE student
ADD COLUMN gender VARCHAR(10);

-- delete column to table
ALTER TABLE student
DROP COLUMN address;

-- modify column
ALTER TABLE student
MODIFY COLUMN firstName VARCHAR(40);

-- rename column
ALTER TABLE student
RENAME COLUMN first_name TO firstName;
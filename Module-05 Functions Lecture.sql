-- SELECT
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT first_name, last_name FROM employees;

-- WHERE
SELECT * FROM employees
WHERE department_id = 60;

SELECT * FROM employees
WHERE department_id = 60 AND salary > 8000;

SELECT * FROM employees
WHERE department_id = 60 OR salary > 8000;

-- ARITHMETIC Operator
SELECT first_name, salary, salary + 10000 FROM employees
WHERE department_iD = 100;

-- COMPARISON Operator
SELECT * FROM employees
WHERE salary > 6000;

SELECT * FROM employees
WHERE salary < 6000;

SELECT * FROM employees
WHERE salary = 6000;

-- Logical AND, OR Operator

-- DISTINCT
SELECT DISTINCT job_id FROM employees;

-- ORDER BY
SELECT * FROM employees
ORDER BY salary ASC;

SELECT * FROM employees
ORDER BY salary DESC;

-- LIMIT and OFFSET
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 4, 5;

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5
OFFSET 4;

-- LIKE, AS
SELECT * FROM employees
WHERE last_name LIKE 'Green%';

SELECT * FROM employees
WHERE last_name LIKE '%ee%';

SELECT first_name AS name, salary, salary + 10000 AS increased_salary
FROM employees;

-- Functions
-- UPPER
SELECT first_name, UPPER(first_name)
FROM employees;

-- COS, RADIANAS, ACOS
SELECT COS(0);
SELECT COS(RADIANS(90));
SELECT ACOS(1);

-- PI
SELECT PI();

-- ROUND
SELECT ROUND(12.567, 2);

-- RAND
SELECT RAND();

-- GROUP Functions
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT COUNT(salary) FROM employees;
SELECT COUNT(employee_id) FROM employees;
SELECT COUNT(manager_id) FROM employees;
SELECT COUNT(*) FROM employees;	-- row count

-- GROUP BY
SELECT department_id, MAX(salary) FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*) FROM employees
GROUP BY department_id;

-- HAVING : Group Function er Upore Applied Conditions
SELECT department_id, MAX(salary) FROM employees
WHERE department_id != 20
GROUP BY department_id;

SELECT department_id, MAX(salary) FROM employees
WHERE department_id != 20
GROUP BY department_id
HAVING MAX(salary) > 5000;
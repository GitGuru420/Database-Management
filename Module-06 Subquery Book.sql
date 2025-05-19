-- 1. jesob employee'r salary 15K er besi tader first_name o salary
SELECT first_name, salary
FROM employees
WHERE salary > 15000;

-- 2. jesob employee'r salary employees table er average salary theke besi tader first_name o salary
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 3. jesob employee MARKETING department e kaj kore tader average salary koto
SELECT AVG(salary) FROM employees
WHERE department_id = (SELECT department_id FROM departments
					   WHERE department_name = "Marketing");
                       
-- 4. employees table er 2nd maximum salary koto
SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- CTE (COMMON TABLE EXPRESSION)
WITH temp_table AS (
	SELECT * FROM employees
    WHERE salary > 15000
)
SELECT AVG(salary) FROM temp_table;

WITH MktMaxTbl AS (
	SELECT MAX(salary) AS MktMax
    FROM employees
	WHERE department_id = 20
	),
    ItAvgTble AS (
		SELECT AVG(salary) AS ItAvg
        FROM employees
		WHERE department_id = 60
    )
SELECT * FROM employees
WHERE salary > (SELECT ItAvg FROM ItAvgTble)
				AND
                salary < (SELECT MktMax FROM MktMaxTbl);
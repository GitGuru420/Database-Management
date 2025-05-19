USE dummydb;

-- # SUBQUERY : query er moddho abar query
-- 1. jesob employee der salary 'Den' er salary theke besi tader dekhao.
SELECT * FROM employees
WHERE salary > (
				SELECT salary FROM employees
				WHERE first_name = 'Den'
                );

-- 2. employee_id 144 er cheye kom salary kader tader dekhao.
SELECT * FROM employees
WHERE salary < (
				SELECT salary FROM employees
				WHERE employee_id = 144
                );

-- 3. highest salary jar, tare dekhao.
SELECT * FROM employees
WHERE salary = (
				SELECT MAX(salary) FROM employees
                );

-- 4. marketing department e jara jara kaj kore tader dekhao.
SELECT * FROM employees
WHERE department_id = (
						SELECT department_id FROM departments
						WHERE department_name = 'Marketing'
					   );

-- 5. marketing department e jara jara kaj kore tader average salary koto.
SELECT AVG(salary) FROM employees
WHERE department_id = (
						SELECT department_id FROM departments
						WHERE department_name = 'Marketing'
					   );

-- 6. IT department e kotojon kaj kore.
SELECT COUNT(*) AS members FROM employees
WHERE department_id = (
						SELECT department_id FROM departments
						WHERE department_name = 'IT'
					   );

-- 7. programmer der pichone monthly koto cost hoy.
SELECT SUM(salary) AS total_salary FROM employees
WHERE job_id = (
				SELECT job_id FROM jobs
                WHERE job_title = 'Programmer'
                );

-- # ADVANCED SUBQUERY
-- 1. second highest salary koto, ke pay?
-- way 1: salary desc, distinct, 2nd
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC
LIMIT 1
OFFSET 1;

-- way 2: subquery
SELECT * FROM employees
WHERE salary = (
				SELECT DISTINCT salary FROM employees 
				ORDER BY SALARY DESC
				LIMIT 1
				OFFSET 1);
                
-- efficient way
SELECT * FROM employees
WHERE salary =  (
				SELECT MAX(salary) FROM employees
				WHERE salary <  (SELECT MAX(salary) FROM employees)				
				);
-- ami efficient way te query ti bujhi ni, help

-- 2. kon kon employee tader managerer ceye besi salary pay
SELECT * FROM employees AS emp
WHERE salary > (
				SELECT salary FROM employees AS mgr
				WHERE emp.manager_id = mgr.employee_id
                );
-- help, i can not understand

-- kon kon employee tader manager er moto same job kore
SELECT * FROM employees AS emp
WHERE job_id = (
				SELECT job_id FROM employees AS mgr
				WHERE emp.manager_id = mgr.employee_id
                );

-- # Common Table Expression (With AS)
-- Syntax: WITH je_name_result_save_korte_chai AS (query)
SELECT * FROM employees
LIMIT 5;

WITH temp AS (
	SELECT * FROM employees
	LIMIT 5
)
SELECT * FROM temp;

-- 1. example of common table expression
SELECT AVG(salary) FROM employees
WHERE department_id = 60;	-- IT

SELECT MAX(salary) FROM employees
WHERE department_id = 20;	-- MARKETING

-- 2. emon employeeder name dekhao jader salary IT department er avg salary er theke besi ebong MARKETING department er max salary er theke kom.
WITH avg_it AS (
	SELECT AVG(salary) AS sal1 FROM employees
	WHERE department_id = 60
), 
max_mkt AS (
	SELECT MAX(salary) AS sal2 FROM employees
	WHERE department_id = 20
)

SELECT * FROM employees 
WHERE salary > (SELECT sal1 FROM avg_it) AND (SELECT sal2 FROM max_mkt);
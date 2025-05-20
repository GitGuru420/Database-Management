USE dummydb;

-- 1. Determine the third highest salary and which employee receives it?
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees
				WHERE salary < (SELECT MAX(salary) FROM employees
								WHERE salary < (SELECT MAX(salary) FROM employees)
                                )
				);
                
-- 2. Determine the third lowest salary and which employee receives it?
SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees
				WHERE salary > (SELECT MIN(salary) FROM employees
								WHERE salary > (SELECT MIN(salary) FROM employees)
                                )
				);

-- 3. Which employee has been hired after Steven?
SELECT * FROM employees
WHERE hire_date > (SELECT hire_date FROM employees
				   WHERE first_name = 'Steven' AND last_name = 'King');
                   
-- 4. With common table expression solve the question 1 and 2
WITH third_highest_salary AS (
	 SELECT MAX(salary) AS THS FROM employees
	 WHERE salary < (SELECT MAX(salary) FROM employees
					 WHERE salary < (SELECT MAX(salary) FROM employees))
	),
    third_lowest_salary AS (
	 SELECT MIN(salary) AS TLS FROM employees
	 WHERE salary > (SELECT MIN(salary) FROM employees
					 WHERE salary > (SELECT MIN(salary) FROM employees))
	)

SELECT * FROM employees
WHERE salary = (SELECT THS FROM third_highest_salary) OR salary = (SELECT TLS FROM third_lowest_salary);
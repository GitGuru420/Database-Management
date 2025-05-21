USE dummydb;
SELECT * FROM employees;
SELECT * FROM departments;

-- Joining Table without JOIN
SELECT employees.first_name, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

-- Joining Table with JOIN
SELECT employees.first_name, departments.department_name
FROM employees JOIN departments ON employees.department_id = departments.department_id;

-- INNER JOIN, LEFT, RIGHT, CROSS JOIN
SELECT employees.first_name, departments.department_name
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id;

SELECT employees.first_name, departments.department_name
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id;

SELECT employees.first_name, departments.department_name
FROM employees RIGHT JOIN departments ON employees.department_id = departments.department_id;

SELECT employees.first_name, departments.department_name
FROM employees CROSS JOIN departments ON employees.department_id = departments.department_id;

-- SELF JOIN
SELECT ______________
FROM employees AS e
	JOIN empoyees AS m
    ON e.empId = m.empId;

-- Employee first_name, Manager name
SELECT m.first_name, e.first_name
FROM employees AS e
	JOIN employees AS m
    ON e.employee_id = m.manager_id;
    
-- emon dept er namegulo show koro jesob dept er kono employee nai
SELECT departments.department_name
FROM departments
	LEFT JOIN employees
		ON departments.department_id = employees.department_id
WHERE employees.department_id IS NULL;

-- emp first_name, salary, dept er avg salary er cheye se koto kom pay
SELECT 
	employees.first_name, 
    employees.salary, 
    (SELECT AVG(salary) FROM employees WHERE department_id = employees.department_id) - employees.salary
FROM employees
	JOIN departments
		ON employees.department_id = departments.department_id;
        
-- sei sob dept er name show koro jader minimum salary 5000 er besi.
SELECT department_name, MIN(salary), AVG(salary)
FROM employees
	JOIN departments
		ON employees.department_id = departments.department_id
GROUP BY department_name
HAVING MIN(salary) > 5000;
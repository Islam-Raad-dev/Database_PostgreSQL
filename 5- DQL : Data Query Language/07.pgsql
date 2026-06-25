-- DQL - Data Query Language


-- Select Statement
SELECT employee_id, first_name, salary 
FROM hr.employees;


-- Select Distinct Statement
SELECT DISTINCT department_id 
FROM hr.employees;


-- Where Statement + AND, OR, NOT  
SELECT employee_id, salary, department_id 
FROM hr.employees
WHERE (department_id = 50 AND salary > 5000)
   OR NOT (department_id = 90);


-- Sorting: Order By
SELECT employee_id, salary 
FROM hr.employees
ORDER BY salary DESC NULLS LAST;
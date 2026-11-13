-- https://datalemur.com/questions/sql-well-paid-employees

SELECT e.employee_id, e.name
FROM employee e
JOIN employee m on e.manager_id = m.employee_id
WHERE e.salary > m.salary

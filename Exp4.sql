-- 1. Find all employees who locate in the location with the id 1700
SELECT e.*
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = 1700;

-- 2. Find all employees who do not locate at the location 1700
SELECT e.*
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id <> 1700;

-- 3. Finds the employees who have the highest salary
SELECT * FROM employees
WHERE salary=(SELECT MAX(salary) FROM employees);

-- 4. Finds all employees whose salaries are greater than the average salary of all employees
SELECT * FROM employees
WHERE salary>(SELECT AVG(salary) FROM employees);

-- 5. Finds all departments having at least one employee with salary greater than 10000
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 10000;

-- 6. Finds all departments that do not have any employee with salary greater than 10000
SELECT department_id,department_name
FROM departments
WHERE department_id NOT IN
(SELECT department_id FROM employees WHERE salary>10000);

-- 7. Finds all employees whose salaries are greater than the lowest salary
SELECT e.*
FROM employees e
JOIN (SELECT MIN(salary) AS min_sal FROM employees) m
ON e.salary > m.min_sal;

-- 8. Finds all employees whose salaries are greater than or equal to the highest salary
SELECT e.*
FROM employees e
JOIN (SELECT MAX(salary) AS max_sal FROM employees) m
ON e.salary >= m.max_sal;

-- 9. Calculate the average of average salary of departments
SELECT AVG(avg_sal)
FROM
(
    SELECT AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department_id
) dept_avg;

-- 10. Finds salaries of employees, average salary and difference
SELECT employee_id,salary,
(SELECT AVG(salary) FROM employees) avg_salary,
salary-(SELECT AVG(salary) FROM employees) difference
FROM employees;

-- 11. Finds employees whose salary is higher than average salary of their departments
SELECT * FROM employees e
WHERE salary>
(SELECT AVG(salary)
FROM employees
WHERE department_id=e.department_id);

-- 12. Returns all employees who have no dependents
SELECT * FROM employees
WHERE employee_id NOT IN
(SELECT employee_id FROM dependents);

-- 13. Display first name, last name, department name of employees of department 1,2,3
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (1,2,3);

-- 14. Display first name, last name, job title and department name of employees in dept 1,2,3 with salary >10000
SELECT e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (1,2,3)
AND e.salary > 10000;

-- 15. Display department name, street address, postal code, country name and region name
SELECT d.department_name, l.street_address, l.postal_code,
c.country_name, r.region_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

-- 16. Find employees who have or do not have a department
SELECT e.first_name, e.last_name,
d.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- 17. Find employees whose first name contains letter Z
SELECT e.first_name, e.last_name,
d.department_name, l.city, l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%Z%';

-- 18. Find all departments including those without employees
SELECT e.first_name, e.last_name,
d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 19. Find employees and their managers
SELECT e.first_name AS Employee,
m.first_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- 20. Find employees who work in same department as Taylor
SELECT e1.first_name, e1.last_name, e1.department_id
FROM employees e1
JOIN employees e2
ON e1.department_id = e2.department_id
WHERE e2.last_name = 'Taylor';

-- 21. Calculate difference between max salary of job and employee salary
SELECT job_title,first_name,
(max_salary-salary) difference
FROM employees e,jobs j
WHERE e.job_id=j.job_id;

-- 22. Calculate average salary and number of employees in each department
SELECT department_name,
AVG(salary),COUNT(employee_id)
FROM departments d LEFT JOIN employees e
ON d.department_id=e.department_id
GROUP BY department_name;


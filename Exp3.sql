-- 1. Add at least 10 rows into Department table
INSERT INTO Department VALUES ('D01','HR');
INSERT INTO Department VALUES ('D02','IT');
INSERT INTO Department VALUES ('D03','Finance');
INSERT INTO Department VALUES ('D04','Sales');
INSERT INTO Department VALUES ('D05','Admin');

-- Add 10 rows into Employee table
INSERT INTO Employee VALUES ('emp1','John','1995-05-10','Calicut',9876543210,'D01',25000,'Manager');
INSERT INTO Employee VALUES ('emp2','Arun','1998-07-15','Kochi',9876543211,'D02',18000,'Computer Assistant');
INSERT INTO Employee VALUES ('emp3','Ameen','1997-03-12','Kannur',9876543212,'D03',30000,'Accountant');
INSERT INTO Employee VALUES ('emp4','David','1996-01-20','Malappuram',9876543213,'D02',45000,'Manager');
INSERT INTO Employee VALUES ('emp5','Anu','1999-11-25','Thrissur',9876543214,'D04',7000,'Clerk');
INSERT INTO Employee VALUES ('emp6','Rahul','1994-09-14','Kozhikode',9876543215,'D05',22000,'Supervisor');
INSERT INTO Employee VALUES ('emp7','Ajmal','1993-06-18','Palakkad',9876543216,'D01',5000,'Peon');
INSERT INTO Employee VALUES ('emp8','Nisha','1992-12-09','Kollam',9876543217,'D03',120000,'Manager');
INSERT INTO Employee VALUES ('emp9','Akash','1991-08-30','Alappuzha',9876543218,'D02',300000,'Engineer');
INSERT INTO Employee VALUES ('emp10','Binu','1990-02-11','Kasaragod',9876543219,'D04',15000,'Computer Assistant');

-- 2. Display all records
SELECT * FROM Employee;
SELECT * FROM Department;

-- 3. emp_no and name from department D02
SELECT emp_no, emp_name
FROM Employee
WHERE dept_no='D02';

-- 4. Employee details in descending order of salary
SELECT emp_no, emp_name, Designation, dept_no, salary
FROM Employee
ORDER BY salary DESC;

-- 5. Employees whose salary between 2000 and 5000
SELECT emp_no, emp_name
FROM Employee
WHERE salary BETWEEN 2000 AND 5000;

-- 6. Display designations without duplicates
SELECT DISTINCT Designation
FROM Employee;

-- 7. Change salary to 45000 for Managers
UPDATE Employee
SET salary=45000
WHERE Designation='Manager';

-- 8. Change mobile number of employee named John
UPDATE Employee
SET mobile_no=9999999999
WHERE emp_name='John';

-- 9. Delete employees whose salary = 7000
DELETE FROM Employee
WHERE salary=7000;

-- 10. Name and mobile number starts with A
SELECT emp_name, mobile_no
FROM Employee
WHERE emp_name LIKE 'A%';

-- 11. Name has at least 3 characters and salary > 20000
SELECT *
FROM Employee
WHERE emp_name LIKE '___%' AND salary > 20000;

-- 12. Details of emp1, emp2, emp6
SELECT *
FROM Employee
WHERE emp_no IN ('emp1','emp2','emp6');

-- 13. Name and id salary between 120000 and 300000
SELECT emp_name, emp_no
FROM Employee
WHERE salary BETWEEN 120000 AND 300000;

-- 14. Designation Manager or Computer Assistant
SELECT *
FROM Employee
WHERE Designation='Manager'
   OR Designation='Computer Assistant';

-- 15. Count employees in each department
SELECT dept_no, COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_no;

-- 16. Average salary in each department
SELECT dept_no, AVG(salary) AS avg_salary
FROM Employee
GROUP BY dept_no;

-- 17. Total salary in each department
SELECT dept_no, SUM(salary) AS total_salary
FROM Employee
GROUP BY dept_no;

-- 18. Highest and lowest salary in each department
SELECT dept_no, MAX(salary) AS highest_salary,
MIN(salary) AS lowest_salary
FROM Employee
GROUP BY dept_no;

-- 19. Average salary except D05
SELECT AVG(salary) AS avg_salary
FROM Employee
WHERE dept_no <> 'D05';

-- 20. Average salary except D01 and >20000 ascending
SELECT dept_no, AVG(salary) AS avg_salary
FROM Employee
WHERE dept_no <> 'D01'
GROUP BY dept_no
HAVING AVG(salary) > 20000
ORDER BY avg_salary ASC;
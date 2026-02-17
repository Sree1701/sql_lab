#A
#1
CREATE DATABASE CollegeDB;

#2
USE CollegeDB;

#3
CREATE TABLE Student (
    roll_no INT,
    name VARCHAR(50),
    dob DATE,
    address TEXT,
    phone_no VARCHAR(15),
    blood_grp VARCHAR(5)
);

CREATE TABLE Course (
    course_id INT,
    course_name VARCHAR(50),
    course_duration INT
);

#4
SHOW TABLES;

#5
DESCRIBE Student;

#6
ALTER TABLE Student
DROP COLUMN blood_grp;

#7
ALTER TABLE Student
ADD Adar_no BIGINT;

#8ALTER TABLE Student
MODIFY phone_no INT;

#9
DROP TABLE Student;
DROP TABLE Course;

#10
DROP DATABASE CollegeDB;

#B
#1
CREATE DATABASE OrganizationDB;

#2
USE OrganizationDB;

#3CREATE TABLE Employee (
    emp_no VARCHAR(10),
    emp_name VARCHAR(50),
    dob DATE,
    address TEXT,
    mobile_no INT,
    dept_no VARCHAR(10),
    salary INT
);
CREATE TABLE Department (
    dept_no VARCHAR(10),
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

#4
SHOW TABLES;

#5
DESCRIBE Employee;
DESCRIBE Department;

#6
ALTER TABLE Employee
ADD Designation VARCHAR(50);

#7
ALTER TABLE Department
DROP COLUMN location;


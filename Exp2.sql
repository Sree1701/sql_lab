#1
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Aadhar BIGINT NOT NULL UNIQUE,
    Age INT CHECK (Age > 18)
);

#2
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    PersonID INT,
    CONSTRAINT fk_person
        FOREIGN KEY (PersonID)
        REFERENCES Persons(PersonID)
);

#3
DESCRIBE Persons;

#4
DESCRIBE Orders;

#5
ALTER TABLE Employee
ADD CONSTRAINT pk_employee
PRIMARY KEY (emp_no);

#6
ALTER TABLE Department
ADD CONSTRAINT pk_department
PRIMARY KEY (dept_no);


#7
ALTER TABLE Employee
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_no)
REFERENCES Department(dept_no)
ON DELETE CASCADE;

#8
ALTER TABLE Orders
DROP PRIMARY KEY;

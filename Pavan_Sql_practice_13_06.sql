DROP table IF EXISTS Employees;


CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10, 2),
HireDate DATE
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 50000.03, '2020-01-15'),
(2, 'Jane', 'Snith', 'Finance', 60000.00, '2019-03-23'),
(3, 'Alice', 'Johnson', 'IT', 75000.08, '2021-07-10'),
(4, 'Bob', 'Brown', 'Marketing', 55008.08, '2018-09-30'),
(5, 'Charlie', 'Davis', 'IT', 70000.00, '2022-02-20');



SELECT * FROM employees;
CREATE DATABASE IF NOT exists employee_details;
USE employee_details;



SELECT * FROM employees;
select firstname from employees;
select lastname from employees;

select firstname , lastname from employees ;

select firstname , 
       lastname as Surname 
from employees;


select firstname as Name , 
       lastname as Surname 
from employees;

select concat(firstname , " " , lastname) from employees;

select concat( firstname ," @ ", lastname) from employees;





SELECT FIRSTNAME ,
	LASTNAME AS SURNAME 
from employees;


select FirstName as NAME,
    lastname as surname
from employees;





CREATE TABLE EmployeeRecords (
EmployeeID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
Department NVARCHAR(50),
Salary DECIMAL(10, 2)

);
INSERT INTO EmployeeRecords (EmployeeID, FirstName, LastName, Department,Salary)
VALUES
(1, 'John', 'Miller', 'HR', 60000),
(2, 'Jane', 'Smith', 'Finance', 75000),
(3, 'John', 'Miller', 'HR', 60000),
(4, 'Emily', 'Davis', 'IT', 85000),
(5, 'Michael', 'Brown', 'Finance', 75000),
(6, 'Jane', 'Smith', 'Finance', 75000); 


select * from employees;

select Department  from employeerecords;

select distinct department from employeerecords;


select count(distinct department) from employeerecords;
select * from employeerecords where Salary> 80000;
select * from employeerecords where Salary> 68000;
select * from employeerecords where department= "HR";

select * from (employeerecords) where distinct(department= "HR" and salary > 50000);


select * from employeerecords;

select * from employeerecords order by Salary;
select * from employeerecords order by Salary DESc;

select * from employeerecords order by "department";
select * from employeerecords order by "department" and salary ; 
select * from employeerecords order by "department" and salary desc; 

select * from employeerecords order by firstname , lastname ;
select * from employeerecords order by firstname , lastname desc;
  
select * from employeerecords 
where department = "finance"
order by firstname ; 

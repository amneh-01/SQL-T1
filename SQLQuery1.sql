create database TechWorldHRDB ;


create table TemporaryStaff (
StaffID int PRIMARY KEY,
StaffName varchar(50) Not Null,
HireDate DATE,
);

create table Departments  (
DepartmentID int PRIMARY KEY,
DepartmentName varchar(50) Not Null UNIQUE,
);

create table Employees (
EmployeeID int PRIMARY KEY,
FullName varchar(100) Not Null,
Email VARCHAR(100) UNIQUE,
Salary DECIMAL(10,2) ,
DepartmentID int ,
);

ALTER TABLE Employees ADD PhoneNumber VARCHAR(20);

Drop Table TemporaryStaff;

INSERT INTO Employees VALUES (1, 'IT');
INSERT INTO Employees VALUES (2, 'HR');
INSERT INTO Employees VALUES (3, 'Finance');



INSERT INTO Employees VALUES (1, 'Ahmad Ali', 'ahmad@techworld.com' , 1200.00 ,1, '0791111111');

INSERT INTO Employees VALUES (2, 'Sara Hassan', 'sara@techworld.com' , 950.00  ,2, '0792222222');

INSERT INTO Employees VALUES (3, 'Zaid Omar', 'zaid@techworld.com' , 1500.00 ,1, '0793333333');

INSERT INTO Employees VALUES (4, 'Mona Khaled', 'mona@techworld.com' , 800.00 ,3,  '0794444444');
   

UPDATE Employees SET Salary = 1350.00 WHERE Salary =1200.00 ;
DELETE FROM Employees WHERE EmployeeID = 4;


------------------------------------------------------
 SELECT * FROM Employees

 SELECT FullName, Salary FROM Employees;

 SELECT SUM(Salary) FROM Employees;

 SELECT AVG(Salary) FROM Employees;

 SELECT MIN(Salary) FROM Employees;

 SELECT MAX(Salary) FROM Employees;

 SELECT COUNT(*) FROM Employees;
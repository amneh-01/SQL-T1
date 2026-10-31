use TechWorldHRDB;

CREATE TABLE AccessCards(

CardID int PRIMARY KEY,
CardNumber VARCHAR(50) NOT NULL UNIQUE ,
EmployeeID  INT UNIQUE FOREIGN KEY References Employees(EmployeeID)
); 


CREATE TABLE Projects (

ProjectID int PRIMARY KEY,
ProjectName VARCHAR(100) NOT NULL, 
); 


CREATE TABLE EmployeeProjects  (

EmployeeID int Foreign key REFERENCES Employees(EmployeeID),
ProjectID   int Foreign key REFERENCES Projects(ProjectID),
AssignedDate  date,
PRIMARY KEY (EmployeeID, ProjectID)
); 


INSERT into AccessCards 
values(1,101,1), (2,102 ,2), (3,103,3);

INSERT into Projects
values(1,'AI & Security Training'), (2,'Cloud Migration');

INSERT into EmployeeProjects
values(1,1,'2026-10-31'), (1,2,'2026-10-31'), (2,1,'2026-10-31'), (3,2,'2026-10-31');

SELECT Employees.FullName,Employees.Salary,Departments.DepartmentName
FROM Employees inner join Departments
ON Employees.DepartmentID = Departments.DepartmentID;


SELECT * FROM Departments left join Employees
ON Employees.DepartmentID= Departments.DepartmentID;


SELECT Employees.FullName,AccessCards.CardNumber 
FROM Employees inner join AccessCards 
ON AccessCards.EmployeeID = Employees.EmployeeID;


SELECT Employees.FullName,Projects.ProjectName,EmployeeProjects.AssignedDate
FROM Employees inner join EmployeeProjects
ON EmployeeProjects.EmployeeID=Employees.EmployeeID inner join Projects
ON EmployeeProjects.ProjectID = Projects.ProjectID;


SELECT DepartmentID, sum(Salary) as totalSalary,count(*)as EmployeeCount 
FROM Employees group by DepartmentID;

SELECT DepartmentID,avg(Salary) as avgSalary
FROM Employees group by DepartmentID
HAVING avg(Salary)>1000.00;


SELECT * FROM Employees WHERE Salary > (SELECT AVG(Salary)FROM Employees )


CREATE view vw_EmployeeDetails as
SELECT Employees.EmployeeID, Employees.FullName,  Employees.Email, Departments.DepartmentName
FROM Employees inner join Departments
ON Employees.DepartmentID = Departments.DepartmentID;


SELECT  * FROM vw_EmployeeDetails;


CREATE PROCEDURE sp_GetEmployeesByDepartment @DeptID INT
AS
BEGIN
    SELECT * 
    FROM Employees 
    WHERE DepartmentID = @DeptID;
END;


CREATE TABLE EmployeeAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    Action VARCHAR(50),
    ActionDate DATETIME
);

CREATE TRIGGER trg_AfterDeleteEmployee
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit (EmployeeID, Action, ActionDate)
    SELECT 
        EmployeeID, 
        'DELETED', 
        GETDATE()
    FROM deleted;
END;
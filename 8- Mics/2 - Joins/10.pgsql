-- INNER JOIN

SELECT Employyes.Name, Departments.Name
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentId = Departments.Id;
USE call_masterDW
GO

If (object_id('vETLEmployees') is not null) Drop View vETLEmployees;
go
CREATE VIEW vETLEmployees
AS
SELECT DISTINCT
	[EmployeeID],
	dep.[DepartmentID],
	emp.[Name],
	[Address],
	[Position]
FROM [raw_call_master].dbo.[Employees] as emp
JOIN [raw_call_master].dbo.[Department] as dep ON dep.DepartmentID = emp.DepartmentID
;
go

MERGE INTO DimEmployees as TT
	USING vETLEmployees as ST
		ON TT.ID_Employee = ST.EmployeeID
			WHEN Not Matched
				THEN
					INSERT  (
					[ID_Employee],
					[Name],
					[Address],
					[Position],
					[IsCurrent])
					Values (
					ST.EmployeeID,
					ST.Name,
					ST.Address,
					ST.Position,
					1
					
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;




UPDATE emp
SET emp.KEY_Department = dep.KEY_Department
FROM DimEmployees as emp
JOIN vETLEmployees as v ON emp.ID_Employee = v.EmployeeID
JOIN DimDepartment as dep ON dep.ID_Department = v.DepartmentID

Drop View vETLEmployees;



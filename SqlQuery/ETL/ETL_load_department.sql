USE call_masterDW
GO

If (object_id('vETLDepartment') is not null) Drop View vETLDepartment;
go
CREATE VIEW vETLDepartment
AS
SELECT DISTINCT
	[DepartmentID],
	[Name]
FROM [raw_call_master].dbo.[Department]
;
go

MERGE INTO DimDepartment as TT
	USING vETLDepartment as ST
		ON TT.Name = ST.Name
		AND TT.ID_Department = ST.DepartmentID
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.DepartmentID,
					ST.Name
					
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLDepartment;
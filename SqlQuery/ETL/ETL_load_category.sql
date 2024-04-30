USE call_masterDW
GO

If (object_id('vETLCategory') is not null) Drop View vETLCategory;
go
CREATE VIEW vETLCategory
AS
SELECT DISTINCT
	[CategoryID],
	[Name]
FROM [raw_call_master].dbo.[Category]
;
go

MERGE INTO DimCategory as TT
	USING vETLCategory as ST
		ON TT.Name = ST.Name
		AND TT.ID_Category = ST.CategoryID
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.CategoryID,
					ST.Name
					
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLCategory;
USE call_masterDW
GO

If (object_id('vETLCategory') is not null) Drop View vETLCategory;
go
CREATE VIEW vETLCategory
AS
SELECT DISTINCT
	[Name]
FROM [raw_call_master].dbo.[Category]
;
go

MERGE INTO Category as TT
	USING vETLCategory as ST
		ON TT.Name = ST.Name
			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.Name
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLCategory;
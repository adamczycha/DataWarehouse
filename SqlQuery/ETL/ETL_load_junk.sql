USE call_masterDW
GO

If (object_id('vETLJunk') is not null) Drop View vETLJunk;
go
CREATE VIEW vETLJunk
AS
SELECT DISTINCT
	[TicketResolution].[Escalated],
	[Ticket].[Priority],
	[TicketResolution].[ResolutionType]
FROM [raw_call_master].dbo.[TicketResolution], [raw_call_master].dbo.[Ticket]
;
go

MERGE INTO DimJunk as TT
	USING vETLJunk as ST
		ON TT.[Escalated] = ST.[Escalated]
		AND TT.[Priority] = ST.[Priority]
		AND TT.[ResolutionType] = ST.[ResolutionType]
			WHEN Not Matched
				THEN
					INSERT  
					Values (
					ST.[Priority],
					CAST(
							CASE 
								WHEN ST.[Escalated] = 1 THEN 'True'
								WHEN ST.[Escalated] = 0 THEN 'False'
							END
						AS varchar(5)),
					ST.[ResolutionType]
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLJunk;

USE call_masterDW
GO

If (object_id('vETLDescription') is not null) Drop View vETLDescription;
go
CREATE VIEW vETLDescription
AS
SELECT DISTINCT
	[TicketResolution].[TicketID],
	[TicketResolution].[Notes],
	[Ticket].[Description],
	[Ticket].[Title]
FROM [raw_call_master].dbo.[TicketResolution]
JOIN [raw_call_master].dbo.[Ticket] ON [TicketResolution].[TicketID] = [Ticket].TicketID
;
go

MERGE INTO DimTicketDescription as TT
	USING vETLDescription as ST
		ON TT.TicketID = ST.TicketID
			WHEN Not Matched
				THEN
					INSERT  
					Values (
					ST.[TicketID],
					ST.[Notes],
					ST.[Description],
					ST.[Title]
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLDescription;

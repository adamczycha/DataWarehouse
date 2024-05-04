USE call_masterDW
GO

If (object_id('vETLFeedback') is not null) Drop View vETLFeedback;
go
CREATE VIEW vETLFeedback
AS
SELECT DISTINCT
	[FeedbackID],
	[Satisfaction_level],
	[Feedback],
	[Follow_up],
	[Location],
	[TicketID]
FROM [raw_call_master].dbo.[Feedback]
;
go

MERGE INTO DimFeedback as TT
	USING vETLFeedback as ST
		ON TT.ID_feedback = ST.FeedbackID
			WHEN Not Matched
				THEN
					INSERT  
					Values (
					ST.FeedbackID,
					CAST(ST.Satisfaction_level AS varchar(2)),
					ST.Feedback,
					ST.Follow_up,
					ST.Location,
					ST.TicketID
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLFeedback;

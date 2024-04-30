USE call_masterDW
GO

If (object_id('vETLResolution') is not null) Drop View vETLResolution;
go
CREATE VIEW vETLResolution
AS
SELECT DISTINCT
	[ResolutionTime],
	[ResponseTime],
	[TicketResolution].[TicketID],
	[Category].[CategoryID],
	[Customer].[CustomerID],
	[Employees].EmployeeID,
	[Feedback].FeedbackID,
	junk.KEY_Junk,
	tdes.KEY_Description,
	ddate.KEY_Creation_Date
FROM [raw_call_master].dbo.[TicketResolution]
JOIN [raw_call_master].dbo.[Ticket] ON [Ticket].[TicketID] = TicketResolution.[TicketID]
JOIN [raw_call_master].dbo.[Category] ON [Ticket].CategoryID = Category.CategoryID
JOIN [raw_call_master].dbo.[Customer] ON Ticket.CustomerID = Customer.CustomerID
JOIN [raw_call_master].dbo.[Employees] ON TicketResolution.EmployeeID = Employees.EmployeeID
JOIN [raw_call_master].dbo.[Feedback] ON TicketResolution.TicketID = Feedback.TicketID
JOIN dbo.DimJUNK as junk ON CAST(CASE WHEN TicketResolution.[Escalated] = 1 THEN 'True' WHEN TicketResolution.[Escalated] = 0 THEN 'False' END AS varchar(5)) = junk.Escalated
AND junk.[ResolutionType] = TicketResolution.ResolutionType 
AND junk.Priority = Ticket.Priority
JOIN dbo.DimTicketDescription as tdes ON Ticket.Title = tdes.Title and Ticket.Description = tdes.Description and TicketResolution.Notes = tdes.Notes
JOIN dbo.DimDate as ddate ON TicketResolution.CreationDate = ddate.Date

;
go

MERGE INTO DimTicketResolution as TT
	USING vETLResolution as ST
		ON TT.TicketID = ST.TicketID
			WHEN Not Matched
				THEN
					INSERT (
					[Key_creation_date],
					[Key_Description],
					[Key_Junk],
					[ResolutionTime],
					[ResponseTime],
					[TicketID]
					)
					Values (
					ST.[Key_creation_date],
					ST.[Key_Description],
					ST.[Key_Junk],
					ST.[ResolutionTime],
					ST.[ResponseTime],
					ST.[TicketID]
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;


UPDATE res
SET res.KEY_Employee = emp.KEY_Employee,
	res.KEY_Customer = cus.KEY_Customer,
	res.KEY_Category = cat.KEY_Category,
	res.KEY_Feedback = fed.KEY_Feedback
FROM DimTicketResolution as res
JOIN vETLResolution as v ON res.TicketID = v.TicketID
JOIN DimEmployees as emp ON emp.ID_Employee = v.EmployeeID
JOIN DimCustomer as cus ON v.CustomerID = cus.ID_Customer
JOIN DimCategory as cat ON cat.ID_Category = v.CategoryID
JOIN DimFeedback as fed ON fed.ID_feedback = v.FeedbackID

Drop View vETLResolution;


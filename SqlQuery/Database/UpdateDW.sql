use [raw_call_master]
SELECT COUNT(*) 
FROM Employees 
WHERE Position = 'Help Desk Administrator';


UPDATE Employees
SET Position = CASE 
    WHEN Position = 'Help Desk Technician' THEN 'Help Desk Administrator'
    WHEN Position = 'Help Desk Administrator' THEN 'Help Desk Senior'
    ELSE Position
END;

SELECT COUNT(*) 
FROM Employees 
WHERE Position = 'Help Desk Administrator';


UPDATE Ticket
SET Priority = 'High' 
WHERE CustomerID <10;

UPDATE TicketResolution
SET Escalated = 'true'
WHERE ResolutionID = 1;

UPDATE Ticket
SET CustomerID = (
  SELECT CustomerID
  FROM Customer
  WHERE Name = 'Jan Kowalski'
)
WHERE TicketID IN (
  SELECT TicketID
  FROM TicketResolution
  WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Employees
    WHERE Position = 'Help Desk Administrator'
  )
);


use [raw_call_master]
BULK INSERT Customer
from 'C:\Users\Marcel\Documents\Studia\data_warehouse\Schemas\DataWarehouse_git_rep_now\output\CustomerT2.csv'
with (format='CSV',
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		ROWTERMINATOR='0X0a');

select * from Customer;


BULK INSERT Employees
from 'C:\Users\Marcel\Documents\Studia\data_warehouse\Schemas\DataWarehouse_git_rep_now\output\EmployeesT2.csv'
with (format='CSV',
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		ROWTERMINATOR='0X0a');

select * from Employees;


BULK INSERT Ticket
from 'C:\Users\Marcel\Documents\Studia\data_warehouse\Schemas\DataWarehouse_git_rep_now\output\TicketT2.csv'
with (format='CSV',
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		ROWTERMINATOR='0X0a');

select * from Ticket;




-- Create a temporary table with all columns defined as VARCHAR
CREATE TABLE TempTicketResolution (
  ResolutionID VARCHAR(50),
  TicketID VARCHAR(50),
  EmployeeID VARCHAR(50),
  ResolutionType VARCHAR(50),
  Escalated VARCHAR(50),
  CreationDate VARCHAR(50),
  ResponseTime VARCHAR(50),
  ResolutionTime VARCHAR(50),
  Notes VARCHAR(MAX)
);

-- Import the data into the temporary table
BULK INSERT TempTicketResolution
FROM 'C:\Users\Marcel\Documents\Studia\data_warehouse\Schemas\DataWarehouse_git_rep_now\output\TicketResolutionT2.csv'
WITH (
  FORMAT = 'CSV',
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n'
);

-- Insert the data into the main table, converting the data to the correct data types
INSERT INTO TicketResolution (ResolutionID, TicketID, EmployeeID, ResolutionType, Escalated, CreationDate, ResponseTime, ResolutionTime, Notes)
SELECT CAST(ResolutionID AS INT), CAST(TicketID AS INT), CAST(EmployeeID AS INT), ResolutionType, CAST(Escalated AS BIT), CAST(CreationDate AS DATE), CAST(ResponseTime AS INT), CAST(ResolutionTime AS INT), Notes
FROM TempTicketResolution;

-- Drop the temporary table
DROP TABLE TempTicketResolution;

select * from TicketResolution;



use [call_masterDW]

CREATE TABLE [DimDepartment] (
  [KEY_Department] Int IDENTITY  PRIMARY KEY,
  [ID_Department] Int,
  [Name] varchar(50),
);

CREATE TABLE [DimEmployees] (
  [KEY_Employee] Int IDENTITY,
  [KEY_Department] Int,
  [ID_Employee] Int,
  [Name] varchar(20),
  [Address] varchar(50),
  [Position] varchar(50),
  [IsCurrent] varchar(1) NOT NULL CHECK ([IsCurrent] IN('1','0')),
  PRIMARY KEY ([KEY_Employee]),
  FOREIGN KEY ([KEY_Department]) REFERENCES [DimDepartment]([KEY_Department])
);

CREATE TABLE [DimJUNK] ( 
  [KEY_Junk] INT IDENTITY PRIMARY KEY,
  [Priority] nvarchar (255) NOT NULL CHECK ([Priority] IN('Low', 'Medium','High')),
  [Escalated] nvarchar (255) NOT NULL CHECK ([Escalated] IN('True', 'False')),
  [ResolutionType] nvarchar (255) NOT NULL CHECK ([ResolutionType] IN('Processing', 'Finished'))
);



CREATE TABLE [DimDate] (
  [KEY_Creation_Date] Int IDENTITY PRIMARY KEY,
  [Date] date,
  [Creation_Day] int,
  [Creation_Month] varchar(40),
  [Creation_Year] int,
  [Creation_Month_No] int,
);


CREATE TABLE [DimTicketDescription] (
  [KEY_Description] INT IDENTITY PRIMARY KEY,
  [TicketID] INT,
  [Notes] varchar(255),
  [Description] varchar(255),
  [Title] varchar(100)
);

CREATE TABLE [DimCustomer] (
  [KEY_Customer] INT IDENTITY PRIMARY KEY,
  [ID_Customer] Int,
  [Name] varchar(20),
  [E-mail] varchar(100),
  [Phone] varchar(12)
);

CREATE TABLE [DimCategory] (
  [KEY_Category] INT IDENTITY PRIMARY KEY,
  [ID_Category] Int,
  [Name] varchar(50),
  
);


CREATE TABLE [DimFeedback] (
  [KEY_feedback] INT IDENTITY PRIMARY KEY,
  [ID_feedback] Int ,
  [Satisfaction Level] nvarchar (255) NOT NULL CHECK ([Satisfaction Level] IN('1', '2', '3', '4', '5', '6', '7', '8', '9', '10')),
  [Feedback] varchar(255),
  [Follow-up Required] nvarchar (255) NOT NULL CHECK ([Follow-up Required] IN('Yes', 'No')),
  [Customer Location ] varchar(255),
  [TicketID] int
);


CREATE TABLE [DimTicketResolution] (
  [KEY_Employee] Int,
  [KEY_Customer] Int,
  [KEY_Category] Int,
  [KEY_Creation_Date] Int,
  [KEY_Description] int,
  [KEY_Junk] int,
  [KEY_Feedback] int,
  [ResponseTime] int,
  [ResolutionTime] int,
  [TicketID] int,
  FOREIGN KEY ([KEY_Employee]) REFERENCES [DimEmployees]([KEY_Employee]), 
  FOREIGN KEY ([KEY_Customer]) REFERENCES [DimCustomer]([KEY_Customer]), 
  FOREIGN KEY ([KEY_Category]) REFERENCES [DimCategory]([KEY_Category]), 
  FOREIGN KEY ([KEY_Description]) REFERENCES [DimTicketDescription]([KEY_Description]), 
  FOREIGN KEY ([KEY_creation_date]) REFERENCES [DimDate]([KEY_Creation_Date]),
  FOREIGN KEY ([KEY_Junk]) REFERENCES [DimJunk]([KEY_Junk]),
  FOREIGN KEY ([KEY_Feedback]) REFERENCES [DimFeedback]([KEY_Feedback])
);

use [call_masterDW]

CREATE TABLE [Department] (
  [ID_Department] Int,
  [Name] varchar(50),
  PRIMARY KEY ([ID_Department])
);

CREATE TABLE [Employees] (
  [ID_Employee] Int,
  [ID_Department] Int,
  [Name] varchar(20),
  [Address] varchar(50),
  [Position] varchar(50),
  PRIMARY KEY ([ID_Employee]),
  FOREIGN KEY ([ID_Department]) REFERENCES [Department]([ID_Department])
);

CREATE TABLE [JUNK] (
  [ID_Junk] int,
  [Priority] nvarchar (255) NOT NULL CHECK ([Priority] IN('Low', 'Medium','High')),
  [Escalated] nvarchar (255) NOT NULL CHECK ([Escalated] IN('True', 'False')),
  [ResolutionType] nvarchar (255) NOT NULL CHECK ([ResolutionType] IN('Processing', 'Finished')),
  PRIMARY KEY ([ID_Junk])
);



CREATE TABLE [Date] (
  [ID_creation_date] Int,
  [Creation_Day] int,
  [Creation_Year] int,
  [Creation_Month] int,
  PRIMARY KEY ([ID_creation_date])
);

CREATE TABLE [TicketDescription] (
  [ID_Description] Int,
  [Notes] varchar(255),
  [Description] varchar(255),
  [Title] varchar(100),
  PRIMARY KEY ([ID_Description])
);

CREATE TABLE [Customer] (
  [ID_Customer] Int,
  [Name] varchar(20),
  [E-mail] varchar(100),
  [Phone] varchar(12),
  PRIMARY KEY ([ID_Customer])
);

CREATE TABLE [Category] (
  [ID_Category] Int,
  [Name] varchar(50),
  PRIMARY KEY ([ID_Category])
);

CREATE TABLE [Feedback] (
  [ID_feedback] int,
  [Satisfaction Level] nvarchar (255) NOT NULL CHECK ([Satisfaction Level] IN('1', '2', '3', '4', '5', '6', '7', '8', '9', '10')),
  [Feedback] varchar(255),
  [Follow-up Required] nvarchar (255) NOT NULL CHECK ([Follow-up Required] IN('Yes', 'No')),
  [Customer Location ] varchar(255),
  PRIMARY KEY ([ID_feedback])
);


CREATE TABLE [TicketResolution] (
  [ID_Employee] Int,
  [ID_Customer] Int,
  [ID_Category] Int,
  [ID_creation_date] Int,
  [ID_Description] int,
  [ID_Junk] int,
  [ID_Feedback] int,
  [ResponeTime] int,
  [ResolutionTime] int,
  [TicketID] int,
  FOREIGN KEY ([ID_Employee]) REFERENCES [Employees]([ID_Employee]), 
  FOREIGN KEY ([ID_Customer]) REFERENCES [Customer]([ID_Customer]), 
  FOREIGN KEY ([ID_Category]) REFERENCES [Category]([ID_Category]), 
  FOREIGN KEY ([ID_Description]) REFERENCES [TicketDescription]([ID_Description]), 
  FOREIGN KEY ([ID_creation_date]) REFERENCES [Date]([ID_creation_date]),
  FOREIGN KEY ([ID_Junk]) REFERENCES [Junk]([ID_Junk]),
  FOREIGN KEY ([ID_Feedback]) REFERENCES [Feedback]([ID_Feedback])
);
use [call_masterDW]

<<<<<<< HEAD
SET IDENTITY_INSERT [Department] ON;

INSERT INTO [Department] ([ID_Department], [Name]) VALUES 
(3, 'Technical Support Department'),
(7, 'Customer Care Department'),
(1, 'IT Solutions Department');

SET IDENTITY_INSERT [Department] OFF;


SET IDENTITY_INSERT [Employees] ON;

INSERT INTO [Employees] ([ID_Employee], [ID_Department], [Name], [Address], [Position],[IsCurrent]) VALUES  
(479, 3, 'Richard', '979 Rodriguez Throughway Apt. 182', 'Support Engineer','1'),
(341, 7, 'Savannah', 'Unit 5997 Box 0977', 'IT Help Desk Specialist','1'),
(226, 1, 'Teresa', '814 Hall Plaza Apt. 618', 'Help Desk Technician','0');

SET IDENTITY_INSERT [Employees] OFF;

SET IDENTITY_INSERT [JUNK] ON;

INSERT INTO [JUNK]  ([ID_Junk], [Priority], [Escalated], [ResolutionType]) VALUES 
(1, 'High', 'True', 'Finished'),
(2, 'Low', 'False', 'Processing'),
(3, 'Medium', 'True', 'Finished');
SET IDENTITY_INSERT [JUNK] OFF;
SET IDENTITY_INSERT [Date] ON;

INSERT INTO [Date] ([ID_creation_date], [Creation_Day], [Creation_Month], [Creation_Year], [Creation_Month_No]) VALUES 
(1, 1, 'Jule', 2023, 6),
(2, 26, 'December', 2023, 12),
(3, 3, 'March', 2024, 3);
SET IDENTITY_INSERT [Date] OFF;
SET IDENTITY_INSERT [TicketDescription] ON;

INSERT INTO [TicketDescription]  ([ID_Description], [Notes], [Description], [Title]) VALUES 
(1, 'Yeah available wait either.', 'Hope wife stand street.', 'Support'),
(2, 'Rise raise indicate mouth.', 'Because class parent pull.', 'Help'),
(3, 'Middle do best state weight.', 'Save air sign compare.', 'Issue');
SET IDENTITY_INSERT [TicketDescription] OFF;
SET IDENTITY_INSERT [Customer] ON;

INSERT INTO [Customer]  ([ID_Customer], [Name], [E-mail], [Phone]) VALUES 
(4158, 'Holly', 'annettewilson@gmail.com', '+1-299-256'),
(665, 'Jessica', 'douglasjames@yahoo.com', '920.619.01'),
(4575, 'Sonya', 'olee@hotmail.com', '(305)949-3');
SET IDENTITY_INSERT [Customer] OFF;
SET IDENTITY_INSERT [Category] ON;

INSERT INTO [Category] ([ID_Category], [Name]) VALUES
(19, 'Software Issues'),
(16, 'Hardware Issues'),
(1, 'Network Connectivity Problems');
SET IDENTITY_INSERT [Category] OFF;
SET IDENTITY_INSERT [Feedback] ON;

INSERT INTO [Feedback] ([ID_feedback], [Satisfaction Level], [Feedback], [Follow-up Required], [Customer Location]) VALUES
(22102, '2', 'Order kind when.', 'No', 'Afghanistan'),
(29245, '8', 'Local ok total million.', 'Yes', 'India'),
(33320, '9', 'Student truth later keep.', 'No', 'Reunion');
SET IDENTITY_INSERT [Feedback] OFF;


INSERT INTO [TicketResolution] ([ID_Employee], [ID_Customer], [ID_Category], [ID_creation_date], [ID_Description], [ID_Junk], [ID_Feedback], [ResponeTime], [ResolutionTime], [TicketID]) VALUES
(479, 4158, 19, 1, 1, 1, 22102, 1, 2, 1001), 
(341, 665, 16, 2, 2, 2, 29245, 2, 3, 1002), 
(226, 4575, 1, 3, 3, 3, 33320, 3, 4, 1003); 
=======
INSERT INTO [Department] VALUES 
( 'Technical Support Department'),
( 'Customer Care Department'),
( 'IT Solutions Department');

INSERT INTO [Employees] VALUES 
( 1, 'Richard', '979 Rodriguez Throughway Apt. 182', 'Support Engineer'),
( 2, 'Savannah', 'Unit 5997 Box 0977', 'IT Help Desk Specialist'),
( 3, 'Teresa', '814 Hall Plaza Apt. 618', 'Help Desk Technician');



INSERT INTO [JUNK]  VALUES 
( 'High', 'True', 'Finished'),
( 'Low', 'False', 'Processing'),
( 'Medium', 'True', 'Finished');

INSERT INTO [Date] VALUES 
( 7, 2023, 11),
( 26, 2023, 12),
( 24, 2024, 3);


INSERT INTO [TicketDescription]  VALUES 
( 'Yeah available wait either.', 'Hope wife stand street.', 'Support'),
( 'Rise raise indicate mouth.', 'Because class parent pull.', 'Help'),
( 'Middle do best state weight.', 'Save air sign compare.', 'Issue');

INSERT INTO [Customer]  VALUES 
( 'Holly', 'annettewilson@gmail.com', '+1-299-256'),
('Jessica', 'douglasjames@yahoo.com', '920.619.01'),
( 'Sonya', 'olee@hotmail.com', '(305)949-3');

INSERT INTO [Category] VALUES
( 'Software Issues'),
( 'Hardware Issues'),
('Network Connectivity Problems');

INSERT INTO [Feedback] VALUES
( '2', 'Order kind when.', 'No', 'Afghanistan'),
( '8', 'Local ok total million.', 'Yes', 'India'),
( '9', 'Student truth later keep.', 'No', 'Reunion');

INSERT INTO [TicketResolution] VALUES
(1,1,1,1,1,1,1,1,1,1),
(2,2,2,2,2,2,2,2,2,2),
(3,3,3,3,3,3,3,3,3,3);
>>>>>>> e115f337b384e84e8e1c9ec529e0c41d4452a9fe



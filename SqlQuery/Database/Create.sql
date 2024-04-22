IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'raw_call_master')
EXEC('CREATE DATABASE raw_call_master')

use [raw_call_master]

CREATE TABLE Department (
  DepartmentID INT PRIMARY KEY,
  Name VARCHAR(50)
);

CREATE TABLE Category (
  CategoryID INT PRIMARY KEY,
  Name VARCHAR(50)
);

CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(20),
  Address VARCHAR(50),
  Position VARCHAR(50),
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);



CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(20),
  Email VARCHAR(100),
  Phone VARCHAR(12)
);

CREATE TABLE Ticket (
  TicketID INT PRIMARY KEY,
  Title VARCHAR(100),
  Description VARCHAR(255),
  Priority VARCHAR(10),
  CustomerID INT,
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE TicketResolution (
  ResolutionID INT PRIMARY KEY,
  TicketID INT,
  EmployeeID INT,
  ResolutionType VARCHAR(20), -- Changed ENUM to VARCHAR
  Escalated BIT,
  CreationDate DATE,
  ResponseTime INT,
  ResolutionTime INT,
  Notes VARCHAR(255),
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
  FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

CREATE TABLE Feedback (
	FeedbackID INT PRIMARY KEY,
	Satisfaction_level INT, 
	Feedback varchar(250),
	Follow_up varchar(10),
	Location varchar(100),
	TicketID INT,
	FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
	)
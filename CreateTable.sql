-- Tworzenie tabeli Users
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    UNIQUE (Name, LastName) -- Unique constraint
);

-- Tworzenie tabeli Income_Category
CREATE TABLE Income_Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    UNIQUE (CategoryName) -- Unique constraint
);

-- Tworzenie tabeli Expense_Category
CREATE TABLE Expense_Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    UNIQUE (CategoryName) -- Unique constraint
);

-- Tworzenie tabeli Banking_Account_Type
CREATE TABLE Banking_Account_Type (
    TypeID INT IDENTITY(1,1) PRIMARY KEY,
    Banking_Account_type VARCHAR(255) NOT NULL,
    UNIQUE (Banking_Account_type) -- Unique constraint
);

-- Tworzenie tabeli BankNames
CREATE TABLE BankNames (
    BankID INT IDENTITY(1,1) PRIMARY KEY,
    BankName VARCHAR(255) NOT NULL,
    UNIQUE (BankName) -- Unique constraint
);

-- Tworzenie tabeli Banking_Account
CREATE TABLE Banking_Account (
    Banking_AccountID INT IDENTITY(1,1) PRIMARY KEY,
    Balance DECIMAL(10, 2) NOT NULL,
    UserID INT,
    Banking_Account_TypeID INT,
    BankNamesID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (Banking_Account_TypeID) REFERENCES Banking_Account_Type(TypeID),
    FOREIGN KEY (BankNamesID) REFERENCES BankNames(BankID),
    CHECK (Balance >= 0) -- Check constraint
);

-- Tworzenie tabeli FixedExpenses
CREATE TABLE FixedExpenses (
    FixedExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Frequency VARCHAR(255) DEFAULT 'Monthly',
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Expense_Category(CategoryID),
    CHECK (Amount >= 0) -- Check constraint
);

-- Tworzenie tabeli FixedIncome
CREATE TABLE FixedIncome (
    FixedIncomeID INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Frequency VARCHAR(255) DEFAULT 'Monthly',
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Income_Category(CategoryID),
    CHECK (Amount >= 0) -- Check constraint
);

-- Tworzenie tabeli Expense
CREATE TABLE Expense (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Description TEXT,
    ExpenseDate DATE,
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Expense_Category(CategoryID),
    CHECK (Amount >= 0) -- Check constraint
);

-- Tworzenie tabeli Income
CREATE TABLE Income (
    IncomeID INT IDENTITY(1,1) PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Description TEXT,
    IncomeDate DATE,
    UserID INT,
    CategoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Income_Category(CategoryID),
    CHECK (Amount >= 0) -- Check constraint
);

-- Tworzenie tabeli ³¹cz¹cej Many-to-Many miêdzy Income a Banking_Account
CREATE TABLE Income_Banking_Account (
    Income_Banking_AccountID INT IDENTITY(1,1) PRIMARY KEY,
    IncomeID INT,
    Banking_AccountID INT,
    FOREIGN KEY (IncomeID) REFERENCES Income(IncomeID),
    FOREIGN KEY (Banking_AccountID) REFERENCES Banking_Account(Banking_AccountID)
);

-- Tworzenie tabeli ³¹cz¹cej Many-to-Many miêdzy Income a Banking_Account
CREATE TABLE FixedIncomeIncome_Banking_Account (
    FixedIncomeIncome_Banking_AccountID INT IDENTITY(1,1) PRIMARY KEY,
    FixedIncomeID INT,
    Banking_AccountID INT,
    FOREIGN KEY (FixedIncomeID) REFERENCES FixedIncome(FixedIncomeID),
    FOREIGN KEY (Banking_AccountID) REFERENCES Banking_Account(Banking_AccountID)
);

-- Tworzenie tabeli ³¹cz¹cej Many-to-Many miêdzy Income a Banking_Account
CREATE TABLE FixedExpenseIncome_Banking_Account (
	FixedExpenseIncome_Banking_AccountID INT IDENTITY(1,1) PRIMARY KEY,
    FixedExpenseID INT,
    Banking_AccountID INT,
    FOREIGN KEY (FixedExpenseID) REFERENCES FixedExpenses(FixedExpenseID),
    FOREIGN KEY (Banking_AccountID) REFERENCES Banking_Account(Banking_AccountID)
);

-- Tworzenie tabeli ³¹cz¹cej Many-to-Many miêdzy Income a Banking_Account
CREATE TABLE Expense_Banking_Account (
    Expense_Banking_AccountID INT IDENTITY(1,1) PRIMARY KEY,
    ExpenseID INT,
    Banking_AccountID INT,
    FOREIGN KEY (ExpenseID) REFERENCES Expense(ExpenseID) ON DELETE CASCADE,
    FOREIGN KEY (Banking_AccountID) REFERENCES Banking_Account(Banking_AccountID)
);

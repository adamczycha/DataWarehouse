use call_masterDW
go

-- Fill DimDates Lookup Table
-- Step a: Declare variables use in processing
Declare @StartDate date; 
Declare @EndDate date;

-- Step b:  Fill the variable with values for the range of years needed
SELECT @StartDate = '2023-01-01', @EndDate = '2023-12-31';

-- Step c:  Use a while loop to add dates to the table
Declare @DateInProcess datetime = @StartDate;

While @DateInProcess <= @EndDate
	Begin
	--Add a row into the date dimension table for this date
		Insert Into [dbo].[DimDate]
		( [Date]
		, [Creation_Day]
		, [Creation_Month]
		, [Creation_Year]
		, [Creation_Month_No]
		)
		Values ( 
		  @DateInProcess -- [Date]
		  , Cast( Day(@DateInProcess) as int)
		  , Cast( DATENAME(month, @DateInProcess) as varchar(10)) -- [Month]
		  , Cast( Year(@DateInProcess) as int) -- [Year]
		  , Cast( Month(@DateInProcess) as int) -- [MonthNo]
		);  
		-- Add a day and loop again
		Set @DateInProcess = DateAdd(d, 1, @DateInProcess);
	End

USE call_masterDW
IF OBJECT_ID('dbo.FormatPhoneNumber', 'FN') IS NOT NULL
    DROP FUNCTION dbo.FormatPhoneNumber;
GO
CREATE FUNCTION dbo.FormatPhoneNumber(@phone VARCHAR(12))
RETURNS VARCHAR(12)
AS
BEGIN
    -- Remove non-numeric characters
    WHILE PATINDEX('%[^0-9+]%', @phone) > 0
    BEGIN
        SET @phone = STUFF(@phone, PATINDEX('%[^0-9+]%', @phone), 1, '')
    END

    -- Format the phone number
    SET @phone = CONCAT( SUBSTRING(@phone, 1, 3), '-', SUBSTRING(@phone, 4, 3), '-', SUBSTRING(@phone, 7, LEN(@phone)))


    RETURN @phone
END


GO

If (object_id('vETLCustomer') is not null) Drop View vETLCustomer;
go
CREATE VIEW vETLCustomer
AS
SELECT DISTINCT
	[CustomerID],
	[Name],
	[Email],
	dbo.FormatPhoneNumber(Phone) as phone

FROM [raw_call_master].dbo.[Customer]
;
go

MERGE INTO DimCustomer as TT
	USING vETLCustomer as ST
		ON TT.Name = ST.Name
		AND	TT.[E-mail] = ST.[Email]
		AND TT.[Phone] = ST.phone
		AND TT.ID_Customer = ST.CustomerID

			WHEN Not Matched
				THEN
					INSERT
					Values (
					ST.CustomerID,
					ST.Name,
					ST.[Email],
					ST.Phone
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

Drop View vETLCustomer;
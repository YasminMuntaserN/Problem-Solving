-- READ: Get All People
CREATE PROCEDURE SP_GetAllPeople
AS
BEGIN
    SELECT * FROM People
END

EXEC SP_GetAllPeople;


-- READ: Get Person By ID
CREATE PROCEDURE SP_GetPersonByID
    @PersonID INT
AS
BEGIN
    SELECT * FROM People WHERE PersonID = @PersonID
END

EXEC SP_GetPersonByID	@PersonID = 1


-- READ: Get Person By ID way 2
CREATE PROCEDURE SP_GetPersonByID2
    @PersonID INT,
    @FirstName NVARCHAR(100) OUTPUT,
    @LastName NVARCHAR(100) OUTPUT,
    @Email NVARCHAR(255) OUTPUT,
    @IsFound BIT OUTPUT  -- Additional parameter to indicate if a record was found
AS
BEGIN
    IF EXISTS(SELECT 1 FROM People WHERE PersonID = @PersonID)
    BEGIN
        SELECT 
            @FirstName = FirstName, 
            @LastName = LastName, 
            @Email = Email
        FROM People 
        WHERE PersonID = @PersonID;


        SET @IsFound = 1;  -- Set to 1 (true) if a record is found
    END
    ELSE
    BEGIN
        SET @IsFound = 0;  -- Set to 0 (false) if no record is found
    END
END

DECLARE @ID INT = 1;  -- Example PersonID
DECLARE @FName NVARCHAR(100);
DECLARE @LName NVARCHAR(100);
DECLARE @Email NVARCHAR(255);
DECLARE @Found BIT;


EXEC SP_GetPersonByID2
    @PersonID = @ID,
    @FirstName = @FName OUTPUT,
    @LastName = @LName OUTPUT,
    @Email = @Email OUTPUT,
    @IsFound = @Found OUTPUT;


IF @Found = 1
    SELECT @FName as FirstName, @LName as LastName, @Email as Email;
ELSE
    PRINT 'Person not found';


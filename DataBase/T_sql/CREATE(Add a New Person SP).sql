CREATE TABLE People (
    PersonID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255)
);


CREATE PROCEDURE SP_AddNewPerson
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(255),
    @NewPersonID INT OUTPUT
AS
BEGIN
    INSERT INTO People (FirstName, LastName, Email)
    VALUES (@FirstName, @LastName, @Email);


    SET @NewPersonID = SCOPE_IDENTITY();
END

DECLARE @PersonID INT;

EXEC SP_AddNewPerson 
    @FirstName = 'John', 
    @LastName = 'Doe', 
    @Email = 'john.doe@example.com',
    @NewPersonID = @PersonID OUTPUT;

SELECT @PersonID AS NewPersonID;
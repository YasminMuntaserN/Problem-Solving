CREATE PROCEDURE SP_UpdatePerson
    @PersonID INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(255)
AS
BEGIN
    UPDATE People
    SET FirstName = @FirstName, LastName = @LastName, Email = @Email
    WHERE PersonID = @PersonID
END

EXEC SP_UpdatePerson 
    @PersonID = 1, -- The ID of the person you want to update
    @FirstName = 'UpdatedFirstName',
    @LastName = 'UpdatedLastName',
    @Email = 'updated.email@example.com';

	select * from People;
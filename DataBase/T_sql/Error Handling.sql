use C21_DB1;
-- Assume we have a table called 'Employees' with a unique constraint on 'EmployeeID'
CREATE TABLE Employees3 (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Position NVARCHAR(100)
);


BEGIN TRY
    -- Insert a record into the Employees table
    INSERT INTO Employees3 (EmployeeID, Name, Position) VALUES (1, 'John Doe', 'Sales Manager');
    
    -- Attempt to insert a duplicate record which will cause an error
    INSERT INTO Employees3 (EmployeeID, Name, Position) VALUES (1, 'Jane Smith', 'Marketing Manager');
END TRY
BEGIN CATCH
    -- Handle the error
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
    -- Rollback the transaction if any
END CATCH
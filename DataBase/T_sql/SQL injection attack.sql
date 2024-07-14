DECLARE @SQL NVARCHAR(Max);

SET @SQL =N'SELECT * FROM EMPLOYEES WHERE EmployeeID =1';
PRINT @SQL ;
EXECUTE (@SQL);

DECLARE @input NVARCHAR(50) = '1 or 1=1';


DECLARE @input NVARCHAR(50) = '1 or 1=1';


IF ISNUMERIC(@input) = 1
BEGIN
    SELECT *
    FROM Students
    WHERE studentID = @input;
END
ELSE
BEGIN
    -- Handle invalid input
    SELECT 'Invalid input';
END
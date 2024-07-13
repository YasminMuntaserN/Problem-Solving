CREATE FUNCTION dbo.GetAverageGrade(@subject NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @averageGrade INT;


    SELECT @averageGrade = AVG(Grade)
    FROM Students
    WHERE Subject = @subject;


    RETURN @averageGrade;
END;

SELECT Name, dbo.GetAverageGrade(Subject) AS AverageGrade
FROM Teachers;

-- Example: Use the Scalar Function in a WHERE clause
SELECT Name, Subject
FROM Teachers
WHERE dbo.GetAverageGrade(Subject) > 80;
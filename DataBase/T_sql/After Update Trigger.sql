CREATE TRIGGER trg_AfterUpdateStudent ON Students
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Grade)
    BEGIN
        INSERT INTO StudentUpdateLog(StudentID, OldGrade, NewGrade)
        SELECT i.StudentID, d.Grade AS OldGrade, i.Grade AS NewGrade
        FROM inserted i
        INNER JOIN deleted d ON i.StudentID = d.StudentID;
    END
END;


  -- Testing the Trigger

-- Updating the grade of a student
UPDATE Students
SET Grade = 50
WHERE StudentID = 1;


-- Checking the log table
SELECT * FROM StudentUpdateLog;
SELECT * FROM Students;
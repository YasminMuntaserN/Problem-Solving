CREATE TRIGGER trg_AfterDeleteStudent ON Students
AFTER DELETE
AS
BEGIN
    INSERT INTO StudentDeleteLog(StudentID, Name, Subject, Grade)
    SELECT StudentID, Name, Subject, Grade FROM deleted;
END;

--Testing the Trigger

-- Assuming there is a student with StudentID = 1 in the Students table
-- Deleting a student
DELETE FROM Students WHERE StudentID = 1;


-- Checking the delete log table
SELECT * FROM StudentDeleteLog;
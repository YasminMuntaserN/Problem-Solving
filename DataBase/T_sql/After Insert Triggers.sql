CREATE TRIGGER trg_AfterInsertStudent ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentInsertLog(StudentID, Name, Subject, Grade)
    SELECT StudentID, Name, Subject, Grade FROM inserted;
END;

   -- Testing the Trigger

-- Inserting a new student
INSERT INTO Students (StudentID, Name, Subject, Grade)
VALUES (10, 'John Doe', 'Mathematics', 85);

-- Checking the log table

SELECT * FROM StudentInsertLog;
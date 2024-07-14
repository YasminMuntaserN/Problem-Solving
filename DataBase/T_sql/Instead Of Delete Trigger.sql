CREATE TRIGGER trg_InsteadOfDeleteStudent ON Students
INSTEAD OF DELETE
AS
BEGIN
    -- Marking the record as inactive instead of deleting
    UPDATE Students
    SET IsActive = 0
    FROM Students S
    INNER JOIN deleted D ON S.StudentID = D.StudentID;
END;


  --Testing the Trigger
-- Assuming there is a student with StudentID = 1

select * from Students
-- Attempting to delete a student
DELETE FROM Students WHERE StudentID = 2;


-- Checking the status of the student record
SELECT StudentID, Name, IsActive FROM Students WHERE StudentID = 2;
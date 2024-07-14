CREATE TRIGGER trg_InsertStudentView ON StudentView
INSTEAD OF INSERT
AS
BEGIN
    -- Insert into PersonalInfo
    INSERT INTO PersonalInfo (StudentID, Name, Address)
    SELECT StudentID, Name, Address FROM inserted;


    -- Insert into AcademicInfo
    INSERT INTO AcademicInfo (StudentID, Course, Grade)
    SELECT StudentID, Course, Grade FROM inserted;
END;

INSERT INTO StudentView (StudentID, Name, Address, Course, Grade)
VALUES (3, 'Alice Johnson', '789 Pine Rd', 'Physics', 88);

SELECT * FROM PersonalInfo WHERE StudentID = 3;
SELECT * FROM AcademicInfo WHERE StudentID = 3;
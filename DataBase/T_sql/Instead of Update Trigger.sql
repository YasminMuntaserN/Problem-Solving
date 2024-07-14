CREATE TRIGGER trg_UpdateStudentView ON StudentView
INSTEAD OF UPDATE
AS
BEGIN
    -- Update PersonalInfo
    UPDATE PersonalInfo
    SET Name = I.Name, Address = I.Address
    FROM PersonalInfo
    INNER JOIN inserted I ON PersonalInfo.StudentID = I.StudentID;


    -- Update AcademicInfo
    UPDATE AcademicInfo
    SET Course = I.Course, Grade = I.Grade
    FROM AcademicInfo
    INNER JOIN inserted I ON AcademicInfo.StudentID = I.StudentID;
END;


-- Testing TRIGGER

UPDATE StudentView
SET Name = 'Johnathan Doe', Course = 'Biology', Grade = 92
WHERE StudentID = 1;

SELECT * FROM PersonalInfo WHERE StudentID = 1;
SELECT * FROM AcademicInfo WHERE StudentID = 1;
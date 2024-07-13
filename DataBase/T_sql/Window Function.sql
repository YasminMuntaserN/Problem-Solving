-- ROW_NUMBER() Function in SQL
SELECT 
      StudentID , Name ,Subject ,Grade ,
	  ROW_NUMBER() OVER (ORDER BY Grade DESC)As RowNum
From
      Students order by grade desc;


 -- RANK() Function in SQL
SELECT 
    StudentID, Name, Subject,Grade,
    RANK() OVER (ORDER BY Grade DESC) AS GradeRank
FROM 
    Students;

 -- DENSE_RANK in SQL
SELECT 
    StudentID, Name, Subject,Grade,
    DENSE_RANK() OVER (ORDER BY Grade DESC) AS GradeRank
FROM 
    Students;


--Using RANK() with PARTITION BY
SELECT 
    StudentID, Name, Subject,Grade,
    RANK() OVER (PARTITION BY Subject ORDER BY Grade DESC) AS GradeRank
FROM 
    Students;

--Aggregate Functions with Partition
SELECT 
    StudentID, Name, Subject,Grade,
    AVG(Grade) OVER (PARTITION BY Subject) AS SubjectAvgGrade,
    SUM(Grade) OVER (PARTITION BY Subject) AS SubjectTotalGrade
FROM 
    Students
ORDER BY Subject;

-- LAG and LEAD Functions Using a Single SQL Query
SELECT 
    StudentID, Name,
    LAG(Grade, 1) OVER (ORDER BY Grade DESC) AS PreviousGrade,
    Grade,
    LEAD(Grade, 1) OVER (ORDER BY Grade DESC) AS NextGrade
FROM 
    Students
ORDER BY Grade DESC;
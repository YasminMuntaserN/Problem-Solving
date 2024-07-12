use C21_DB1;

SELECT 
    EmployeeID,
    CASE 
        WHEN Salary <= 30000 THEN 'Entry Level'
        WHEN Salary BETWEEN 30001 AND 60000 THEN 'Mid Level'
        WHEN Salary > 60000 THEN 'Senior Level'
        ELSE 'Not Specified'
    END AS EmployeeLevel
FROM Employees;

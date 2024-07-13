   CREATE TABLE #EmployeesTemp (
      EmployeeId INT ,
	  Name VARCHAR(100) ,
	  Department VARCHAR(50) 
	);

	INSERT INTO #EmployeesTemp (EmployeeId, Name, Department)
	VALUES (10, 'Mohammed', 'Marketing');

	INSERT INTO #EmployeesTemp (EmployeeId, Name, Department)
	VALUES (11, 'Ali', 'Sales');


	SELECT * FROM #EmployeesTemp WHERE Department = 'Sales';

	Drop TABLE #EmployeesTemp;
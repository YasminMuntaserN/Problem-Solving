use C21_DB1;

-- ERROR Handling with IF 
DECLARE @ErrorValue INT ;

Insert into Employees (Name) VALUES ('yasmin');

Set @ErrorValue =@@ERROR;

IF @ErrorValue <>0
    BEGIN
       PRINT 'An Error Occured with error Number'+cast (@ErrorValue As VARCHAR);
	 END

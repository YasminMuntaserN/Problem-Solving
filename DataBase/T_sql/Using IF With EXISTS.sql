use C21_DB1;

--Using IF With EXISTS 
 IF EXISTS (SELECT * FROM Employees WHERE Name ='Yasmin')
       BEGIN
           PRINT 'yes , yasmin there ';
	   END
ELSE 
       BEGIN
           PRINT 'NO , yasmin not there ';
	   END

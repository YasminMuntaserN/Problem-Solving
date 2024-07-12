use C21_DB1;

SELECT 
    *,CASE
        WHEN Employees.salary>500 and Employees.salary <10000 THEN 'a'
        WHEN Employees.salary>=10000 and Employees.salary <=30000 THEN 'b'
        WHEN Employees.salary>30000 and Employees.salary <50000 THEN 'c'
        WHEN Employees.salary>=50000 and Employees.salary <=70000 THEN 'd'

		ELSE  'e'
    END AS [Categorie]
FROM Employees
order by  [Categorie] asc

CREATE PROCEDURE GenerateDynamicSQL1
    @TableName NVARCHAR(128)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'SELECT * FROM ' + @TableName;
    EXECUTE(@SQL);
END

CREATE PROCEDURE GenerateDynamicSQL2
    @TableName NVARCHAR(128)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = N'SELECT * FROM ' + QUOTENAME(@TableName);
    EXEC sp_executesql @SQL;
END

DECLARE @RC INT
Declare @TableName nvarchar(120)

set @TableName= 'Employees';

EXECUTE @RC =[dbo].[GenerateDynamicSQL1]
@TableName

EXECUTE @RC =[dbo].[GenerateDynamicSQL2]
@TableName
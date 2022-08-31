/* ----- Aggregate Functions ----------- */
SELECT TOP 5 * 
FROM Purchasing.PurchaseOrderHeader
WHERE PurchaseOrderId = 2

SELECT PurchaseOrderID, SUM(LineTotal) AS Total
FROM Purchasing.PurchaseOrderDetail

GROUP BY PurchaseOrderID

SELECT PurchaseOrderID, LineTotal
FROM Purchasing.PurchaseOrderDetail
WHERE PurchaseOrderId = 2

SELECT YEAR(DueDate) AS Yr, SUM(LineTotal) AS Total 
FROM Purchasing.PurchaseOrderDetail
--WHERE PurchaseOrderID > 50
GROUP BY YEAR(DueDate)
HAVING SUM(LineTotal) > 5000000

/* ----- Datetime Functions ----------- */
-- Get current Datetime
SELECT GETDATE()
-- get difference between 2 dates
SELECT OrderDate, ShipDate, DATEDIFF(YEAR, OrderDate, ShipDate) AS YrDiff
FROm Purchasing.PurchaseOrderHeader

SELECT TOP 10 OrderDate, ShipDate, DATEDIFF(MONTH, OrderDate, ShipDate) AS MonthDiff
FROm Purchasing.PurchaseOrderHeader

-- Adding to Dates
SELECT TOP 10 OrderDate, ShipDate, DATEADD(MONTH, 5, ShipDate) AS FiveMonthLater
FROm Purchasing.PurchaseOrderHeader
-- WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 4
WHERE OrderDate BETWEEN '2011-04-01' AND '2011-04-30'

-- Get part of a Date
SELECT TOP 10 OrderDate, ShipDate, DATEPART(D, ShipDate) AS Day
FROm Purchasing.PurchaseOrderHeader

-- get Diffrent names of a date
SELECT TOP 10 OrderDate, ShipDate, DATENAME(WEEKDAY, ShipDate) AS Day
FROm Purchasing.PurchaseOrderHeader
WHERE DATENAME(WEEKDAY, ShipDate) = 'Saturday'

SELECT DATENAME(YEAR, GETDATE())        AS 'Year';        
SELECT DATENAME(QUARTER, GETDATE())     AS 'Quarter';     
SELECT DATENAME(MONTH, GETDATE())       AS 'Month Name';       
SELECT DATENAME(DAYOFYEAR, GETDATE())   AS 'DayOfYear';   
SELECT DATENAME(DAY, GETDATE())         AS 'Day';         
SELECT DATENAME(WEEK, GETDATE())        AS 'Week';        
SELECT DATENAME(WEEKDAY, GETDATE())     AS 'Day of the Week';     
SELECT DATENAME(HOUR, GETDATE())        AS 'Hour';        
SELECT DATENAME(MINUTE, GETDATE())      AS 'Minute';      
SELECT DATENAME(SECOND, GETDATE())      AS 'Second';      
SELECT DATENAME(MILLISECOND, GETDATE()) AS 'MilliSecond'; 
SELECT DATENAME(MICROSECOND, GETDATE()) AS 'MicroSecond'; 
SELECT DATENAME(NANOSECOND, GETDATE())  AS 'NanoSecond';  
SELECT DATENAME(ISO_WEEK, GETDATE())    AS 'Week';

/* ----- String Functions Functions ----------- */
SELECT UPPER(FirstName) AS Firstname, SUBSTRING(FirstName,1,3) AS Initials, LastName
FROM Person.Person

-- Class Work
-- Create an email address for the employees in the format f.lastname@adventureworks.com
-- and name the cilumn email(hint: SUBSTRING, CONCAT)
SELECT FirstName, LastName, '' AS Email
FROM Person.Person

-- CharacterIndex
SELECT FirstName, LastName, CHARINDEX('a', Lastname)
FROM Person.Person

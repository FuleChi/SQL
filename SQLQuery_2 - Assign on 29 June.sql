--Question 1.
/*
Write a query that displays the product ID and name for each product from the Production.Product table with the name starting with Chain.
*/
SELECT ProductID, Name
FROM Production.product
WHERE Name LIKE 'Chain%'

--Question 2.
/*
Write a query that displays the business entity ID number, first name, middle name, and last name from the Person.Person table for only
those rows that have E or B stored in the middle name column.
*/
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName = 'E' OR MiddleName = 'B'

--Question 3.--
/*
Explain the difference between the following two queries:
SELECT FirstName
FROM Person.Person
WHERE LastName LIKE 'Ja%es';
or
SELECT FirstName
FROM Person.Person
WHERE LastName LIKE 'Ja_es';
*/
--The first query returns names that have an infinity number of characters btw 'a' and 'e', so we may have Japhertes;
--Meanwhile the second query only returns names with 5 characters; eg. James, Jades, 

--Question 4.--
/*
Write a query displaying the order ID, order date, and total due from the Sales.SalesOrderHeader table.
Retrieve only those rows where the order was placed during the month of September 2011 and the total due exceeded $1,000.
*/
SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 06 AND TotalDue > 1000

--Question 5.--
/*
Change the query in question 1 so that only the dates September 1–3, 2011, are retrieved. See whether you can figure
out three different ways to write this query.
*/
SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 06 AND (DAY(OrderDate) = 1 OR DAY(OrderDate) = 2 OR DAY(OrderDate) = 3)

--or

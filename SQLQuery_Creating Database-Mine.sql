/*STEPS
    1) Create DB if required
    2) Import Flat File (Install SQL Server Import extension)
    3) Create tables from most Independent to dependent: Except StudentSubject table
    4) Check Uniqueness of Data from dbo.SchoolFlatDb Table and update where required
    5) Insert values into tables from most independent to dependent: Intro to Joins
    6) Create StudentSubject table using INSERT INTO
    7) Lets Recreate the original table by Joining Class, Student, Subject and StudentSubjects tables
    8) Lets Create a View (vw_DchoolFlatDB) to hold our query so we can DROP the SchoolFlatDB Table
    9) Lets INSERT a new Class with No students in it to show the different types of Joins (LEFT/RIGHT and INNER JOINS)
    10) Lets say the school aquired another school with a similar Db and you area sked to merge the records (UNION, UNION ALL, INTERSECT, EXCEPT)
    11) Talk about DROP, TRUNCATE, DELETE
*/
--STEP 1.
IF NOT EXISTS(SELECT name FROM sys.Databases WHERE name = 'SchoolFlatDB03')
CREATE DATABASE SchoolFlatDB03

SELECT *
FROM sys.databases


--STEP 2.
SELECT *
FROM SchoolFlatDB

--STEP 3. ColumnName DataType Constraint
CREATE TABLE Class(
    ClassID INT PRIMARY KEY IDENTITY(10,1), 
    ClassName NVARCHAR (250) NOT NULL)

SELECT * 
FROM Class

CREATE TABLE Subject(
    SubjectID INT PRIMARY KEY IDENTITY(100,1), 
    SubjectName NVARCHAR (250) NOT NULL)

SELECT * FROM Subject

CREATE TABLE Student(
    StudentID INT PRIMARY KEY IDENTITY(1,1), 
    StudentName NVARCHAR (250) NOT NULL,
    ClassID INT FOREIGN KEY REFERENCES Class(ClassID) ON DELETE SET NULL) 

SELECT * FROM Student

--STEP 4. Clean Data in SchoolFlatDB
SELECT * FROM SchoolFlatDB

SELECT DISTINCT Student FROM SchoolFlatDB
----
SELECT DISTINCT [Subject] FROM SchoolFlatDB

-----Intro to Update Statements
UPDATE SchoolFlatDB
SET Subject = 'Math'
WHERE Subject LIKE 'math%'

--STEP 5. 
--Class Insert
INSERT INTO Class(ClassName)
SELECT DISTINCT Class
FROM SchoolFlatDB
--Verify 
SELECT * FROM Class

--Subject Insert
INSERT INTO Subject(SubjectName)
SELECT DISTINCT Subject
FROM SchoolFlatDB
--Verify 
SELECT * FROM Subject

--Student Insert
INSERT INTO Student(StudentName, ClassID)
SELECT DISTINCT Student, Class
FROM SchoolFlatDB

SELECT * FROM Student



" use to create database"
CREATE DATABASE databaseName;  

" Creating table in sql"
USE db_name;
CREATE TABLE table_name(
    column_name1 datatype constraint,
    column_name1 datatype constraint
);
"Example:"
CREATE TABLE STUDENT(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
)

"
alter : to change the schema, schema means design
"
" to add column in table"
ALTER TABLE STUDENT
ADD COLUMN marks INT;
" to delete column in table"
ALTER TABLE STUDENT
DROP COLUMN marks;
" to rename table"
ALTER TABLE STUDENT
RENAME TO student;
" to rename  column name & change data type of column in table"
ALTER TABLE STUDENT
CHANGE COLUMN name studentName CHAR(50);
" to odify column datatype in constraints"
ALTER TABLE STUDENT
MODIFY age VARCHAR(3)

" truncate : used to delete data from table , only data will delete, table will exists"
TRUNCATE TABLE STUDENT;

" select command : used to select data from database"
SELECT  name, age FROM STUDENT;
" select all values"
SELECT * FROM STUDENT;
SELECT name FROM STUDENT;
" select only distinct values, do not fetch same value"
SELECT DISTINCT name FROM STUDENT

"To insert element into Table"
INSERT INTO STUDENT VALUES(1, "Sumit", 26);
INSERT INTO STUDENT VALUES(2, "Bablu", 28);

"for multiple data to inset"
INSERT INTO STUDENT
(id, name, age)
VALUES
(1, "Sumit", 26),
(2, "Bablu", 28),
(3, "Dablu", 32);


" update:
    to update existing rows
    SET : useto set values
"
"
SAFE mode in SQL:
it is a default mode in SQL
it prevents a data loss as it turn off major changes in database 
we can turn off using below query
SET SQL_SAFE_UPDATES = 0;
we can turn on using below query
SET SQL_SAFE_UPDATES = 1;
"

SET SQL_SAFE_UPDATES = 0;

UPDATE STUDENT
SET age = 23
WHERE age = 2;
" you can only use set "
UPDATE STUDENT
SET age = 23;

" Delete:
    to delete existing rows
"
DELETE FROM STUDENT
WHERE age > 23;
" to delete all data"
DELETE FROM STUDENT;


"🔹 GRANT Command
Definition: The GRANT command is used to give (assign) specific privileges or permissions to a user in SQL.
Meaning: It allows users to perform certain actions like SELECT, INSERT, UPDATE, etc. on database objects."
GRANT SELECT, INSERT ON Students TO user1;

"
🔹 REVOKE Command
Definition: The REVOKE command is used to remove (take back) privileges that were given to a user.
Meaning: It ensures security by withdrawing access rights."
REVOKE INSERT ON Students FROM user1;

"
COMMIT → Saves all changes made in the current transaction permanently to the database.
ROLLBACK → Undoes changes of the current transaction and restores the previous state.
SAVEPOINT → Creates a point within a transaction to which you can rollback later.
SET TRANSACTION → Defines properties of a new transaction (like read/write mode).
"
INSERT INTO Students VALUES (1, 'Raj', 85);
COMMIT;

DELETE FROM Students WHERE id = 1;
ROLLBACK;

SAVEPOINT sp1;
UPDATE Students SET marks = 90 WHERE id = 2;
ROLLBACK TO sp1;

SET TRANSACTION READ WRITE;

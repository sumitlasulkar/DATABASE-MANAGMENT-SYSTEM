CREATE DATABASE college;
USE college;

CREATE TABLE STUDENT(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
)

INSERT INTO STUDENT
(id, name, age)
VALUES
(1, "Sumit", 26),
(2, "Bablu", 28),
(4, "Bablu", 28),
(3, "Dablu", 32);


" Table related quries "

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

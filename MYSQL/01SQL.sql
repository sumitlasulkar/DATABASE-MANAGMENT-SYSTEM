" DATATBASE QURIES IN SQL"

" use to create database"
CREATE DATABASE ONE;   
create database two;
" if we dont know database is present or not, if present still no error occurs"
CREATE DATABASE IF NOT EXISTS ONE;   

" use to delete database"
DROP DATABASE ONE;
drop database two;
DROP DATABASE IF EXISTS ONE;

" use to access database"
USE ONE

" To show all Databases"
SHOW DATABASES;
" To show all tables in Database"
SHOW TABLES

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

"TO print and select all elements, Select and view columns, * represents all"
SELECT * FROM STUDENT;


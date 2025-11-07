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

" select command : used to select data from database"
SELECT  name, age FROM STUDENT;
" select all values"
SELECT * FROM STUDENT;
SELECT name FROM STUDENT;
" select only distinct values, do not fetch same value"
SELECT DISTINCT name FROM STUDENT

" Clause : to define conditions"
" Where clause : to define some conditions"
SELECT  * FROM STUDENT WHERE age > 27;
SELECT  * FROM STUDENT WHERE age > 27 AND name = "Bablu";

" OPERATORS in SQL"
"
Arithematic :   + - * / %
Comparison :   =  !=  >  < >=  <=
Logical :   AND OR NOT IN BETWEEN ALL LIKE ANY
Bitwise :   &  !
"
SELECT  * FROM STUDENT WHERE age+10 > 27;
" AND  : both condition true"
SELECT  * FROM STUDENT WHERE age > 27 AND name = "Bablu";
" OR : one condition should true"
SELECT  * FROM STUDENT WHERE age > 27 OR name = "Bablu";
" BETWEEN : selects a given range"
SELECT  * FROM STUDENT WHERE age BETWEEN 20 AND 30;
" IN : matches any value in list"
SELECT  * FROM STUDENT WHERE age IN(23,27,30);
" NOT : to negate (remove) given condition"
SELECT  * FROM STUDENT WHERE age NOT IN(23,27,30);

" LIMIT clause : sets an upper limit of rows to be returned"
SELECT  * FROM STUDENT LIMIT 3; " only three elements come"
SELECT  * FROM STUDENT WHERE age IN(23,27,30) LIMIT 1;

" Order by clause : to sort in assending desending order"
" ASC : assending & DESC : desending"
SELECT  * FROM STUDENT ORDER BY age  ASC;
SELECT  * FROM STUDENT ORDER BY age DESC;

" Aggregate Functions : perform calculation on set of values, returns a single value"
"
COUNT() : count the values
MAX() :give max value
MIN(): give min value
SUM() : give sum of all values
AVG() : give average of all values

"
SELECT MAX(age) FROM STUDENT;
SELECT MIN(age) FROM STUDENT;
SELECT AVG(age) FROM STUDENT;
SELECT SUM(age) FROM STUDENT;

" Group By clause : 
groups rows having same values into summary rows
collects data from mutiple records and groups that result by one or more column
generally use with aggrgation function
"

SELECT name, count(age) FROM STUDENT GROUP BY name;

" Having Clause:
    similar to where clause
    sedwhen we want toapply any condition after grouping
"
SELECT name, count(age) FROM STUDENT GROUP BY name HAVING max(age) > 30;

" General order for clause: ecan right all clauses together 
 SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
"
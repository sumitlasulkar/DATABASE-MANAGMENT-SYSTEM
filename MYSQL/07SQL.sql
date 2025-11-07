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

" 
SQL SubQuery / InnerQuery / NestedQuery
    it involves two select statments
    query that is written in another query
    use to create a dynamic query
"
" using WHERE"
SELECT name, age
FROM STUDENT
WHERE age > (SELECT AVG(age) FROM STUDENT);
" using FROM"
SELECT AVG(age)
FROM(SELECT *
FROM STUDENT
WHERE age = 23)
" using SELECT"
SELECT (SELECT MAX(age) FROM STUDENT)
FROM STUDENT;


"
MySQL views
    Virtual table in database
    always shows up to date data
    database engine recreates view, every time a user quries it
"

CREATE VIEW viewName AS 
SELECT id, name, age FROM STUDENT;

SELECT * FROM viewName
WHERE age > 20;

DROP VIEW viewName;
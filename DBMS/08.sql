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

CREATE TABLE COURCE(
    id INT PRIMARY KEY,
    cource_name VARCHAR(50)
);
INSERT INTO COURCE(id, cource_name)
VALUES
(1,"enlish"),
(2, "maatagd")
(4,"ffshfgg");

"
SQL JOINS
    used to combine data of multiple tables, to retrive information
    it is based on related column
 "

" 1. inner join : matching value in both tables"
SELECT *
FROM STUDENT
INNER JOIN COURCE
ON STUDENT.id = COURCE.id;
"alias : giving short form to larger Table names"
SELECT *
FROM STUDENT as s
INNER JOIN COURCE as c
ON s.id = c.id;

" 2. left outer join : values of left and same value of both"
SELECT *
FROM STUDENT as s
LEFT JOIN COURCE as c
ON s.id = c.id;

" 3. right outer join : values of right and same value of both"
SELECT *
FROM STUDENT as s
RIGHT JOIN COURCE as c
ON s.id = c.id;

" 4. Full outer join : values of both"
"  UNION : use to combine result set of two or more columns, it gives only unique record"
"  UNION ALL : use to combine result set of two or more columns, it gives only unique record, all values"
SELECT *
FROM STUDENT as s
LEFT JOIN COURCE as c
ON s.id = c.id
UNION
SELECT *
FROM STUDENT as s
RIGHT JOIN COURCE as c
ON s.id = c.id;

SELECT *
FROM STUDENT as s
LEFT JOIN COURCE as c
ON s.id = c.id
UNION ALL
SELECT *
FROM STUDENT as s
RIGHT JOIN COURCE as c
ON s.id = c.id;

" 5. left exclusive join : values of left and not same value of present in another"
SELECT *
FROM STUDENT as s
LEFT JOIN COURCE as c
ON s.id = c.id;
WHERE c.id IS NULL;

" 6. right exclusive join : values of right and not same value of present in another"
SELECT *
FROM STUDENT as s
RIGHT JOIN COURCE as c
ON s.id = c.id;
WHERE c.id IS NULL;

" 7. Full exclusive join : diffrent values from both"
SELECT *
FROM STUDENT as s
LEFT JOIN COURCE as c
ON s.id = c.id;
WHERE c.id IS NULL
UNION
SELECT *
FROM STUDENT as s
RIGHT JOIN COURCE as c
ON s.id = c.id;
WHERE c.id IS NULL;

" 8. Self join : join in which table joined to itself"
SELECT *
FROM STUDENT as a
JOIN STUDENT as b
ON a.id = b.age;

SELECT a.name, b.name
FROM STUDENT as a
JOIN STUDENT as b
ON a.id = b.age;

"9. Natural join "
SELECT *
FROM STUDENT as s
NATURAL JOIN COURCE as c
ON s.id = c.id;






"Sample Tables"
CREATE TABLE STUDENT(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

CREATE TABLE COURSE(
    id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

"Insert sample data"
INSERT INTO STUDENT VALUES
(1, "Sumit", 26),
(2, "Bablu", 28),
(3, "Dablu", 32),
(4, "Ravi", 24);

INSERT INTO COURSE VALUES
(1, "English"),
(2, "Mathematics"),
(3, "Physics"),
(5, "Chemistry");

---------------------------------------------------
"1. EQUI JOIN → using '=' operator"
SELECT s.name, c.course_name
FROM STUDENT s
INNER JOIN COURSE c
ON s.id = c.id;

---------------------------------------------------
"2. NON-EQUI JOIN → using other comparison operators"
SELECT s.name, s.age, c.course_name
FROM STUDENT s
INNER JOIN COURSE c
ON s.id > c.id;

---------------------------------------------------
"3. Multiple Join Conditions → using AND"
SELECT s.name, s.age, c.course_name
FROM STUDENT s
INNER JOIN COURSE c
ON s.id = c.id AND s.age > 25;

"Multiple Join Conditions using OR"
SELECT s.name, s.age, c.course_name
FROM STUDENT s
INNER JOIN COURSE c
ON s.id = c.id OR s.age = 24;

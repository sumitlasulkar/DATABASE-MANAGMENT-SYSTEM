"Sample Table"
CREATE TABLE STUDENT(
    id INT,
    name VARCHAR(50),
    age INT
);

INSERT INTO STUDENT VALUES 
(1, 'Amit', 20),
(2, 'Neha', 22),
(3, 'Raj', 24),
(4, 'Sara', 22);

---------------------------------------------------
"1. IN → check if age is in the set"
SELECT name, age
FROM STUDENT
WHERE age IN (20, 22);
-- Result: Amit, Neha, Sara

"2. NOT IN → check if age is not in the set"
SELECT name, age
FROM STUDENT
WHERE age NOT IN (22);
-- Result: Amit, Raj

"3. ANY / SOME → compare with any value from subquery"
SELECT name, age
FROM STUDENT
WHERE age > ANY (SELECT age FROM STUDENT WHERE id < 3);
-- Compares age with any value returned by subquery

"4. ALL → compare with all values from subquery"
SELECT name, age
FROM STUDENT
WHERE age > ALL (SELECT age FROM STUDENT WHERE id < 3);
-- Compares age with all values returned by subquery


"Sample Table"
CREATE TABLE STUDENT(
    id INT,
    name VARCHAR(50),
    age INT
);

INSERT INTO STUDENT VALUES
(1, 'Amit', 20),
(2, 'Neha', 22),
(3, 'Raj', 24),
(4, 'Sara', 22);

"Self join using tuple variables"
SELECT a.name AS Student1, b.name AS Student2
FROM STUDENT AS a
JOIN STUDENT AS b
ON a.age = b.age
WHERE a.id <> b.id;




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

"STRING_AGG → concatenate strings"
SELECT region, STRING_AGG(product, ', ') AS products
FROM SALES
GROUP BY region;

"STDDEV → standard deviation of amount"
SELECT STDDEV(amount) AS std_dev_amount
FROM SALES;

"VARIANCE → variance of amount"
SELECT VARIANCE(amount) AS variance_amount
FROM SALES;

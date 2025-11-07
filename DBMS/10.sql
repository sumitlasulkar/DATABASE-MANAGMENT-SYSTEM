"Sample Table"
CREATE TABLE STUDENT(
    id INT,
    name VARCHAR(50),
    age INT,
    marks INT
);

INSERT INTO STUDENT VALUES
(1, 'Amit', 20, 80),
(2, 'Neha', 22, 90),
(3, 'Raj', 24, 85),
(4, 'Sara', 22, 75);

---------------------------------------------------
"1. Single-row subquery → find student with max marks"
SELECT name, marks
FROM STUDENT
WHERE marks = (SELECT MAX(marks) FROM STUDENT);

"2. Multiple-row subquery → students with age in list"
SELECT name, age
FROM STUDENT
WHERE age IN (SELECT age FROM STUDENT WHERE marks > 80);

"3. Multiple-column subquery → student with max marks per age"
SELECT name, age, marks
FROM STUDENT
WHERE (age, marks) IN (
    SELECT age, MAX(marks)
    FROM STUDENT
    GROUP BY age
);

"4. Correlated subquery → compare each student with others"
SELECT name, marks
FROM STUDENT s1
WHERE marks > (
    SELECT AVG(marks)
    FROM STUDENT s2
    WHERE s1.age = s2.age
);

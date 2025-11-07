-- Base Table
CREATE TABLE Students (
   id INT PRIMARY KEY,
   name VARCHAR(50),
   age INT,
   marks INT
);

-- Insert Sample Data
INSERT INTO Students VALUES 
(1, 'Amit', 20, 85),
(2, 'Neha', 19, 55),
(3, 'Raj', 21, 72);

-------------------------------------------------
-- 1. Simple View (single table, updatable)
CREATE VIEW SimpleView AS
SELECT name, marks FROM Students;

-------------------------------------------------
-- 2. Complex View (multiple tables, read-only)
CREATE TABLE Courses (
   course_id INT PRIMARY KEY,
   course_name VARCHAR(50),
   student_id INT
);

CREATE VIEW ComplexView AS
SELECT s.name, c.course_name
FROM Students s
JOIN Courses c ON s.id = c.student_id;

-------------------------------------------------
-- 3. Materialized View (stores data physically)
-- (Syntax works in Oracle/PostgreSQL)
CREATE MATERIALIZED VIEW MaterializedView AS
SELECT name, marks FROM Students WHERE marks > 60;

-------------------------------------------------
-- 4. Updatable View (insert/update/delete allowed)
CREATE VIEW UpdatableView AS
SELECT id, name, age FROM Students;

-------------------------------------------------
-- 5. Read-only View (because of GROUP BY) ( view with aggregation)
CREATE VIEW ReadOnlyView AS
SELECT name, AVG(marks) AS avg_marks
FROM Students
GROUP BY name;




-- Create Base Table
CREATE TABLE Students (
   id INT PRIMARY KEY,
   name VARCHAR(50),
   age INT,
   marks INT
);

-- Insert sample data into base table
INSERT INTO Students VALUES (1, 'Amit', 20, 85);
INSERT INTO Students VALUES (2, 'Neha', 19, 55);

-- Create an Updatable View (based on single table)
CREATE VIEW StudentView AS
SELECT id, name, age, marks FROM Students;

-- INSERT → Adds a new row using view
INSERT INTO StudentView VALUES (3, 'Raj', 21, 72);

-- UPDATE → Modifies existing row using view
UPDATE StudentView
SET marks = 95
WHERE id = 1;

-- DELETE → Removes a row using view
DELETE FROM StudentView
WHERE id = 2;

-- DROP → Removes the view definition (not the base table)
DROP VIEW StudentView;



-- creating view like table
CREATE VIEW viewName AS 
SELECT id, name, age FROM STUDENT;

SELECT * FROM viewName
WHERE age > 20;

DROP VIEW viewName;
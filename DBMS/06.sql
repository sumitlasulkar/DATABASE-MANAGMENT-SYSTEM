-- Create Base Table
CREATE TABLE Students (
   id INT PRIMARY KEY,        -- Primary Index (created automatically)
   name VARCHAR(50) UNIQUE,   -- Unique Index (created automatically)
   age INT,
   marks INT
);

---------------------------------------------------
-- 1. Primary Index → Automatically created on PRIMARY KEY
-- Already created for column 'id'

-- 2. Unique Index → Automatically created on UNIQUE column 'name'

-- 3. Clustered Index → In MySQL, PRIMARY KEY creates a clustered index automatically
-- Example (for SQL Server / Oracle):
-- CREATE CLUSTERED INDEX idx_students_marks ON Students(marks);

-- 4. Non-Clustered Index → Creates separate index structure
CREATE NONCLUSTERED INDEX idx_students_age ON Students(age);

-- 5. Composite Index → Index on multiple columns
CREATE INDEX idx_students_name_age ON Students(name, age);

-- 6. Implicit Index → Created automatically by DB when PRIMARY KEY or UNIQUE is defined
-- Example: PRIMARY KEY (id) & UNIQUE(name) already created implicit indexes

---------------------------------------------------
-- Drop Index Examples
DROP INDEX idx_students_age;         -- Drop non-clustered index
DROP INDEX idx_students_name_age;    -- Drop composite index





-- Create a Sequence
CREATE SEQUENCE seq_student_id
START WITH 1       -- Starting value
INCREMENT BY 1     -- Step size
MINVALUE 1         -- Minimum value
MAXVALUE 1000      -- Maximum value
CYCLE;             -- Restart after max value (optional)

-- Use the Sequence to insert values
INSERT INTO Students (id, name, age, marks)
VALUES (NEXTVAL(seq_student_id), 'Amit', 20, 85);

-- View next value without inserting
SELECT NEXTVAL(seq_student_id);

-- Drop the Sequence
DROP SEQUENCE seq_student_id;

-- Now Alter the Sequence to increment by 5 and max 500
ALTER SEQUENCE seq_student_id
INCREMENT BY 5
MAXVALUE 500;

-- Use the altered sequence
INSERT INTO Students (id, name, age, marks)
VALUES (NEXTVAL(seq_student_id), 'Neha', 21, 90);

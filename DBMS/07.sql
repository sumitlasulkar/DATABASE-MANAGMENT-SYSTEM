-- Create sample tables
CREATE TABLE Students1 (id INT, name VARCHAR(50));
CREATE TABLE Students2 (id INT, name VARCHAR(50));

INSERT INTO Students1 VALUES (1, 'Amit'), (2, 'Neha'), (3, 'Raj');
INSERT INTO Students2 VALUES (2, 'Neha'), (3, 'Raj'), (4, 'Sara');

---------------------------------------------------
-- 1. UNION → Combine, no duplicates
SELECT name FROM Students1
UNION
SELECT name FROM Students2;
-- Result: Amit, Neha, Raj, Sara

-- 2. UNION ALL → Combine, keep duplicates
SELECT name FROM Students1
UNION ALL
SELECT name FROM Students2;
-- Result: Amit, Neha, Raj, Neha, Raj, Sara

-- 3. INTERSECT → Common rows
SELECT name FROM Students1
INTERSECT
SELECT name FROM Students2;
-- Result: Neha, Raj

-- 4. MINUS (Oracle) / EXCEPT (SQL Server, PostgreSQL) → Difference
SELECT name FROM Students1
MINUS
SELECT name FROM Students2;
-- Result: Amit

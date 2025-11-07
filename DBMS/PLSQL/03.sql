"================== TRIGGERS EXAMPLE =================="

"Create sample table"
CREATE TABLE STUDENT(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER
);

"Insert some sample data"
INSERT INTO STUDENT(id, name, age) VALUES (1, 'Amit', 20);
INSERT INTO STUDENT(id, name, age) VALUES (2, 'Neha', 22);

"------------------ BEFORE INSERT TRIGGER ------------------"
"Automatically set age to 18 if not provided"
CREATE OR REPLACE TRIGGER before_insert_student
BEFORE INSERT ON STUDENT
FOR EACH ROW
BEGIN
    IF :NEW.age IS NULL THEN
        :NEW.age := 18;
    END IF;
END;

"------------------ AFTER INSERT TRIGGER ------------------"
"Print message after a new student is inserted"
CREATE OR REPLACE TRIGGER after_insert_student
AFTER INSERT ON STUDENT
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New student inserted: ' || :NEW.name);
END;

"------------------ BEFORE UPDATE TRIGGER ------------------"
"Prevent changing age to less than 18"
CREATE OR REPLACE TRIGGER before_update_student
BEFORE UPDATE OF age ON STUDENT
FOR EACH ROW
BEGIN
    IF :NEW.age < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Age cannot be less than 18!');
    END IF;
END;

"------------------ STATEMENT-LEVEL TRIGGER ------------------"
"Execute once after DELETE statement"
CREATE OR REPLACE TRIGGER after_delete_student
AFTER DELETE ON STUDENT
BEGIN
    DBMS_OUTPUT.PUT_LINE('A delete operation was performed on STUDENT table.');
END;

"------------------ INSTEAD OF TRIGGER (for view) ------------------"
"Create a simple view"
CREATE OR REPLACE VIEW student_view AS
SELECT id, name, age FROM STUDENT;

"Instead of trigger allows INSERT on view"
CREATE OR REPLACE TRIGGER instead_of_student_view
INSTEAD OF INSERT ON student_view
FOR EACH ROW
BEGIN
    INSERT INTO STUDENT(id, name, age)
    VALUES(:NEW.id, :NEW.name, :NEW.age);
END;





"================== EXCEPTION HANDLING EXAMPLE =================="

DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 0;
    v_result NUMBER;
    v_age STUDENT.age%TYPE;


    
    "User-defined exception"
    e_invalid_age EXCEPTION;
BEGIN
    "------------------ PREDEFINED EXCEPTION ------------------"
    "Division by zero example"
    BEGIN
        v_result := v_num1 / v_num2;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed.');
    END;

    "------------------ NO_DATA_FOUND EXCEPTION ------------------"
    BEGIN
        SELECT age INTO v_age FROM STUDENT WHERE id = 100; -- id 100 does not exist
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No student found with given ID.');
    END;

    "------------------ USER-DEFINED EXCEPTION ------------------"
    IF v_num1 < 0 THEN
        RAISE e_invalid_age;  -- raise user-defined exception
    END IF;
EXCEPTION
    "Catch user-defined exception"
    WHEN e_invalid_age THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid age!');

    "Catch all other exceptions"
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some other error occurred: ' || SQLERRM);
END;





"================== ASSERTION EXAMPLE =================="

DECLARE
    v_age NUMBER := -5;   -- value to check
BEGIN
    "Assertion: age must be positive"
    IF v_age < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Assertion Failed: Age cannot be negative!');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Age is valid: ' || v_age);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);  -- prints the assertion error message
END;



"================== PL/SQL ROLES & PRIVILEGES EXAMPLE =================="

BEGIN
    "------------------ CREATE ROLE ------------------"
    EXECUTE IMMEDIATE 'CREATE ROLE student_role';

    "------------------ GRANT OBJECT PRIVILEGES TO ROLE ------------------"
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON STUDENT TO student_role';

    "------------------ GRANT SYSTEM PRIVILEGES TO ROLE ------------------"
    EXECUTE IMMEDIATE 'GRANT CREATE TABLE, CREATE VIEW TO student_role';

    "------------------ GRANT ROLE TO USER ------------------"
    EXECUTE IMMEDIATE 'GRANT student_role TO USER1';

    "------------------ GRANT SPECIFIC PRIVILEGE TO USER ------------------"
    EXECUTE IMMEDIATE 'GRANT DELETE ON STUDENT TO USER2';

    "------------------ REVOKE PRIVILEGES ------------------"
    EXECUTE IMMEDIATE 'REVOKE INSERT ON STUDENT FROM USER1';

    "------------------ REVOKE ROLE FROM USER ------------------"
    EXECUTE IMMEDIATE 'REVOKE student_role FROM USER1';
END;

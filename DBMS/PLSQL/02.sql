"================= PL/SQL CONTROL STRUCTURES ================="

DECLARE
    v_marks NUMBER := 78;        -- sample marks for IF conditions
    v_counter NUMBER := 1;       -- counter for loops
BEGIN
    "------------------- CONDITIONAL STATEMENTS -------------------"
    
    "Simple IF"
    IF v_marks >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('Simple IF: Excellent');
    END IF;
    
    "IF...ELSE"
    IF v_marks >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('IF-ELSE: Excellent');
    ELSE
        DBMS_OUTPUT.PUT_LINE('IF-ELSE: Good');
    END IF;
    
    "IF...ELSIF...ELSE"
    IF v_marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('IF-ELSIF-ELSE: Outstanding');
    ELSIF v_marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('IF-ELSIF-ELSE: Very Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('IF-ELSIF-ELSE: Needs Improvement');
    END IF;

    "------------------- BASIC LOOP -------------------"
    v_counter := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE('Basic LOOP Counter: ' || v_counter);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;   -- exit condition
    END LOOP;

    "------------------- WHILE LOOP -------------------"
    v_counter := 1;
    WHILE v_counter <= 3 LOOP
        DBMS_OUTPUT.PUT_LINE('WHILE LOOP Counter: ' || v_counter);
        v_counter := v_counter + 1;
    END LOOP;

    "------------------- FOR LOOP -------------------"
    FOR v_counter IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('FOR LOOP Counter: ' || v_counter);
    END LOOP;

    "------------------- LOOP WITH EXIT -------------------"
    v_counter := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE('LOOP WITH EXIT Counter: ' || v_counter);
        EXIT WHEN v_counter >= 2;   -- exit after 2 iterations
        v_counter := v_counter + 1;
    END LOOP;

    "------------------- LOOP WITH CONTINUE -------------------"
    FOR v_counter IN 1..5 LOOP
        IF MOD(v_counter, 2) = 0 THEN
            CONTINUE;  -- skip even numbers
        END IF;
        DBMS_OUTPUT.PUT_LINE('LOOP WITH CONTINUE Odd Counter: ' || v_counter);
    END LOOP;

END;





DECLARE
    v_marks NUMBER := 85;
    v_grade VARCHAR2(10);
BEGIN
    v_grade := CASE v_marks
                WHEN 100 THEN 'A+'
                WHEN 90 THEN 'A'
                WHEN 80 THEN 'B+'
                ELSE 'C'
               END;
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
END;



"Simple procedure to greet a student"
CREATE OR REPLACE PROCEDURE greet_student
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, student!');
END;
BEGIN
    greet_student;
END;
--Execute the procedure:
BEGIN
    greet_student;
END;



"Function to double a number"
CREATE OR REPLACE FUNCTION double_num(v_num IN NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN v_num * 2;
END;

DECLARE
    v_result NUMBER;
BEGIN
    v_result := double_num(5);  -- calling the function
    DBMS_OUTPUT.PUT_LINE('Double: ' || v_result);
END;



"================== SIMPLE CURSOR EXAMPLE =================="

DECLARE
    "Explicit Cursor Declaration"
    CURSOR student_cursor IS
        SELECT id, name, age FROM STUDENT;

    "Variables for explicit cursor"
    v_id STUDENT.id%TYPE;
    v_name STUDENT.name%TYPE;
    v_age STUDENT.age%TYPE;

    "Variable for implicit cursor"
    v_count NUMBER;
BEGIN
    "------------------ IMPLICIT CURSOR ------------------"
    "Counting total students using implicit cursor"
    SELECT COUNT(*) INTO v_count FROM STUDENT;
    DBMS_OUTPUT.PUT_LINE('Total Students (Implicit Cursor): ' || v_count);

    "------------------ EXPLICIT CURSOR ------------------"
    OPEN student_cursor;   -- open the cursor
    LOOP
        FETCH student_cursor INTO v_id, v_name, v_age;   -- fetch row
        EXIT WHEN student_cursor%NOTFOUND;             -- exit when no more rows
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Name: ' || v_name || ', Age: ' || v_age);
    END LOOP;
    CLOSE student_cursor;  -- close the cursor
END;


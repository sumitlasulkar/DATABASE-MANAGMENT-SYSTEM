DECLARE
    v_name VARCHAR2(50);      -- string
    v_age NUMBER;             -- numeric
    v_status BOOLEAN;         -- true/false
    v_dob DATE;               -- date
BEGIN
    v_name := 'Amit';
    v_age := 20;
    v_status := TRUE;
    v_dob := TO_DATE('2004-06-04','YYYY-MM-DD');

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Age: ' || v_age);
END;



DECLARE
    TYPE student_rec_type IS RECORD(
        id NUMBER,
        name VARCHAR2(50),
        age NUMBER
    );
    v_student student_rec_type;
BEGIN
    v_student.id := 1;
    v_student.name := 'Neha';
    v_student.age := 22;

    DBMS_OUTPUT.PUT_LINE('Student: ' || v_student.name || ', Age: ' || v_student.age);
END;



DECLARE
    TYPE ref_cursor_type IS REF CURSOR;
    v_cursor ref_cursor_type;
    v_name STUDENT.name%TYPE;
BEGIN
    OPEN v_cursor FOR SELECT name FROM STUDENT;
    LOOP
        FETCH v_cursor INTO v_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name);
    END LOOP;
    CLOSE v_cursor;
END;



DECLARE
    v_text CLOB;
BEGIN
    v_text := 'This is a large text stored in CLOB.';
    DBMS_OUTPUT.PUT_LINE(v_text);
END;



DECLARE
    v_name STUDENT.name%TYPE;  -- same type as STUDENT.name column
    v_age STUDENT.age%TYPE;    -- same type as STUDENT.age column
BEGIN
    v_name := 'Amit';
    v_age := 20;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Age: ' || v_age);
END;



DECLARE
    v_student STUDENT%ROWTYPE;  -- holds entire STUDENT row
BEGIN
    SELECT * INTO v_student
    FROM STUDENT
    WHERE id = 1;

    DBMS_OUTPUT.PUT_LINE('ID: ' || v_student.id || ', Name: ' || v_student.name || ', Age: ' || v_student.age);
END;

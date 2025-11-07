" DATATPE IN SQL"
"
1. CHAR : store characters of fixed length(if we give CHAR(50) then memory allocation is given if you even not used)
2. VARCHAR : store characters of given length
3. BLOB : can store binary numbers
4. INT : to store int  values
5. TINYINT : integer(128 to 127)
6. BIGINT : integre in larger values
7. BIT : store bit values
8. FLOAT : to store decimal numbers
9. DOUBLE : to store  larger decimal numbers
10. BOOLEAN : used using TINYINT
11. DATE : to store date in date format
12. YEAR : to store data in year format
"
"
1. Signed data : store positive and negative both
2. unsigned data : store positive only
"


" SQL Commands"
"
DDL : data defination language : use to define language : create, alter , rename, truncate, drop
DQL : query : use to apply query : select
DML : Manipulation : use to manipulate quries : insert, update, delete
DCL : control : grant & revoke permissions to user
TCL : Transaction control language : star transaction commit
"


" Keys in SQL"
"
1. primary key
    give unique id to row
    cannot be same
    only one in table
    cannot be null
    -> id
"
"
2. Foreign key
    refers to primary key
    can be same
    multiple in table
    create link between two tabless
"
CREATE TABLE STUDENT(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);
CREATE TABLE DEPARTMENT(
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE TEACHER(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
);

" where forign key is used then table will be child table of parent table with primary key

Cascading in foreign key:
    if change at one table then change in related other table
    DELETE : if data from one table deleted then data from second table will also deleted
    UPDATE : if data from one table updated then data from second table will also updated
 "
 CREATE TABLE TEACHER(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
     ON DELETE CASCADE
     ON UPDATE CASCADE
);

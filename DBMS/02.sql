" OPERATORS in SQL"
"
Arithematic :   + - * / %
Comparison :   =  !=  >  < >=  <=
Logical :   AND OR NOT IN BETWEEN ALL LIKE ANY
Bitwise :   &  !
"
SELECT  * FROM STUDENT WHERE age+10 > 27;
" AND  : both condition true"
SELECT  * FROM STUDENT WHERE age > 27 AND name = "Bablu";
" OR : one condition should true"
SELECT  * FROM STUDENT WHERE age > 27 OR name = "Bablu";
" BETWEEN : selects a given range"
SELECT  * FROM STUDENT WHERE age BETWEEN 20 AND 30;
" IN : matches any value in list"
SELECT  * FROM STUDENT WHERE age IN(23,27,30);
" NOT : to negate (remove) given condition"
SELECT  * FROM STUDENT WHERE age NOT IN(23,27,30);

SELECT * FROM Students WHERE name IN ('Raj','Amit','Neha');
SELECT * FROM Students WHERE name LIKE 'A%';
SELECT * FROM Students WHERE marks IS NULL;

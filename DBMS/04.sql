" LIMIT clause : sets an upper limit of rows to be returned"
SELECT  * FROM STUDENT LIMIT 3; " only three elements come"
SELECT  * FROM STUDENT WHERE age IN(23,27,30) LIMIT 1;

" Order by clause : to sort in assending desending order"
" ASC : assending & DESC : desending"
SELECT  * FROM STUDENT ORDER BY age  ASC;
SELECT  * FROM STUDENT ORDER BY age DESC;

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

" Group By clause : 
groups rows having same values into summary rows
collects data from mutiple records and groups that result by one or more column
generally use with aggrgation function
"

SELECT name, count(age) FROM STUDENT GROUP BY name;

" Having Clause:
    similar to where clause
    sedwhen we want toapply any condition after grouping
"
SELECT name, count(age) FROM STUDENT GROUP BY name HAVING max(age) > 30;

" General order for clause: ecan right all clauses together 
 SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
"
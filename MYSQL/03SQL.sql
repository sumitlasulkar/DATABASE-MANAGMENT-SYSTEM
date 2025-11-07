" Constraints in SQL : used to specify rules for data in a table "

"
NOT NULL  : column cannot have  null value
UNIQUE : all value in column are diffrent
PRIMARY KEY : makes a column unique + not null

"

CREATE TABLE STUDENT(
    id INT UNIQUE,
    id2 INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
)

INSERT INTO STUDENT
(id, name, age)
VALUES
(1,2, "Sumit", 26),
(2,3, "Bablu", 28),
(3,4, "Dablu", 32);

" second way to use primary key"
CREATE TABLE STUDENT(
    id INT,
    name VARCHAR(50),
    PRIMARY KEY(id, name)
);

" Foregin Key : prevent actions that would destroy links between tables"
CREATE TABLE temp(
    id int,
    FOREIGN KEY (id) refrences customer(id)
);

" DEFAULT : sets default value for column "
CREATE TABLE EMPLOYEE(
    id INT,
    salary INT DEFAULT 20000
);

" CHECK : it can limit values allowed in column"
CREATE TABLE city(
    id INT,
    age INT,
    city VARCHAR(50),
    CONSTRAINT age_check CHECK (age >= 18 and city = "pune")
);
" second way"
CREATE TABLE newTab(
    age INT CHECK (age>=18)
);

select * from student

-- ALIAS
select sname from student
select sname  as 'Student Name' from student

-- ORDER BY
Select * from student order by age    ---- ascending order by default
select * from student order by age desc   ---- descending order

-- ordering more than one column
select * from student order by states asc, marks desc
select * from student order by gender asc, states desc

--- TOP KEYWORD   -- number, percentage
-- it is used to return specified number or percentage of rows
select top 2 * from student
select top 5 * from student

select top 50 percent * from student

-- name of student who scored maximum marks
select top 1 sname from student order by marks desc
-- select sname from student order by marks limit 1  -- limit is used in mysql

-- name of student who scored minimum marks
select top 1 sname from student order by marks 

-- show students who are not from mh and ka and have marks less than 90 but not equal to 85
select * from student where states not in ('mh','ka') and marks < 90 and marks !=85

-- display top 3 students who are above 20 years old but not male and have marks less than 70 or above 90
select top 3 * from student where age > 20 and gender != 'm' and (marks < 70 or marks > 90)

-- return top 2 students with highest marks provided they are not from 'ka','mh' and they scored less than 80
select top 2 * from student  where states not in ('ka','mh') and marks < 80 order by marks desc


-- AGREEGATES
-- SUM(), MAX(), MIN(), COUNT(), AVG()

-- total marks
select sum(marks) as 'Summation' from student

--maximum score
select max(marks) as 'maximum marks' from student

-- find minimum age
select min(age) as 'minimum age' from student

-- find average age of students
select avg(age) as 'avg age' from student

-- find min,max, average score
select min(marks) as 'minimum marks',max(marks) as 'maximum marks', avg(marks) as 'average marks' from student


select *from student
--count the number of students who scored more than 80
select count(*) from student where marks > 80
select count(roll) from student where marks > 80


--LIKE OPERATOR



--WILD CARD CHARACTERS
--to search for particular pattern in the data

--A % wildcard(it reflects any number of characters)
--select students name where name starts with a
select * from student where sname like 'a%'

--select students name where name ends with a
select * from student where sname like '%a'

--select students name where name starts with b and ends with a
select * from student where sname like 'b%a'

--select students name contaning letter k in their name
select * from student where sname like '%k%'

--select students name contaning letter 'an' in their name
select * from student where sname like '%an%'


--B _(SINGLE CHARACTER)
-- show the name of students whose name's second letter is N
select * from student where sname like '_n%'

--show the name of students that are exactly 10 characters long
select * from student where sname like '__________'

-- show me name of students whose third last character is 'h'
select * from student where sname like '%h__'


--C [] (SET OF CHARACTERS)
-- give me name of students whose name starts with A,R,S
select * from student where sname like 'a%' or sname like 'r%' or sname like 's%'
select * from student where sname like '[ars]%'

-- give me name of students whose name third letter is  A or R or S
select * from student where sname like '__[ars]%' 

-- select name of students whose name ends with a or i
select * from student where sname like '%a' or sname like '%i'
select * from student where sname like '%[ai]'


--D [^] EXCLUDE CHARACTER
-- names not starting with A or R
select * from student where sname not like '[ar]%'
select * from student where sname like '[^ar]%'

-- names whose second letter is not N
select * from student where sname like '_[^n]%'
select * from student where sname not like '_n%'

-- names that are not ending with A or I
select * from student where sname like '%[^ai]'


--SOME QUESTIONS
-- show names starting with A and ending with A
select * from student where sname like 'a%a'

-- show me students name with five letters or are from UP
select * from student where sname like '_____' or states = 'up'

--Show names where 2nd letter is N and from states such as 'mh or uk'
select * from student where sname like '_n%' and states in ('mh','uk')


--FIND STUDENTS WHOSE NAME STARTS WITH A AND SECOND LETTER NOT N AND BELONGS TO STATE STARTING WITH r.
select * from student where sname like 'a[^n]' and states like 'r%'

-- find student whose name contains IT or ends with A, age is less than 22 but not from MP
select * from student where sname like '%it%' or sname like '%a' and age < 22 and states != 'mp'

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SET OPERATORS

-- They are used to combine tables vertically

create table training_q1(
emp_id int, emp_name varchar(100), department varchar(50));

insert into training_q1 values
(101, 'Alice', 'Finance'),
(102, 'Bob','HR'),
(103, 'Charlie', 'IT'),
(104, 'David', 'Sales'),
(105, 'Eva', 'Finance');

create table training_q2(
emp_id int, emp_name varchar(100), department varchar(50));

insert into training_q2 values
(103, 'Charlie', 'IT'),
(104, 'David', 'Sales'),
(106, 'Farah', 'HR'),
(107, 'George', 'IT'),
(108, 'Hina', 'Marketing');

-- use campusx_class1

select * from training_q1
select * from training_q2


-- list all employee who attended training (exclude duplicate values)
select * from training_q1 
union 
select * from training_q2

-- union all give duplicate values also
select * from training_q1 
union all 
select * from training_q2

-- list of employees who attended traning in both the quarters
select * from training_q1 
intersect 
select * from training_q2

-- select name of employees who attended traing of q1 but not q2 (a-b)
select * from training_q1 
except 
select * from training_q2


----clauses of set
--1. number of columns in both the tables should be same 
select emp_name from training_q1 union select emp_name from training_q2

--2.data type of both the combined columns should be same 
select emp_name from training_q1 union select emp_id from training_q2
-- this code will through an error

--find employees who attended only one training (either q1 or q2 but not both)
select * from training_q1 union select * from training_q2
except
select * from training_q1 intersect select * from training_q2


select DB_NAME() as [current_Database]

--SUBQUERY
-- student who scored maximum marks without top
select * from student

select * from student where marks =
(select max(marks) from student)


-- print the details of the students who scored in the range AVG - 5 TO AVG + 5
select * from student where marks <=
(SELECT AVG(MARKS)+ 5 from student)
and marks >=
(SELECT AVG(MARKS)- 5 from student)

-- display the deatils of 2nd highest scorer
select top 1 * from 
(select top 2 * from student order by marks desc)k 
order by marks asc

select * from(
select top 2 * from student order by marks desc)k order by marks desc offset 1 row


-- find the students who scored more than all the students from up but are not from up
select * from student where marks >
(
select max(marks) from student where states = 'up'
)

-- another way of doing same question
select * from student where marks >all
(
select marks from student where states = 'up'
)





create database campusx_class1


use campusx_class1

-- creating table in database
CREATE table STUDENTT
( 
roll int,
sname varchar(100),
marks numeric(5,2),
Age int,
gender varchar(1),
States varchar(2)
)


SELECT * FROM STUDENT

-- insert values in the table
insert into studentt values
(1,'khushbu',89.50,28,'F','MH')
(3,'ketan',80.50,30,'M','MH'),
(5,'harshu',75,26,'M','Gj'),
(11,'Vaibhav',86,27,'M','Dl');

select * from studentt

select roll,marks from Studentt

-- all the information of female students
select * from studentt where gender='f'
select * from studentt where Gender='M'
select marks from studentt where gender='m'


insert into studentt values
(1, 'Aarnav Mehta', 89.50,18,'M', 'MH'),
(2, 'Sneha Reddy', 92.75, 17, 'F', 'DL'),
(3, 'Rohan Das', 76.25, 19, 'M', 'DL'),
(4, 'Pooja Sharma', 85.00, 18, 'F', 'DL'),
(5, 'Imran Khan', 67.00, 20, 'M', 'UP'),
(6, 'Meena Joshi', 90.25, 21, 'F', 'RJ'),
(7, 'Yash Patel', 73.80, 18, 'M', 'GJ'),
(8, 'Anjali Nair', 95.60, 17, 'F', 'CH'),
(9, 'Ravi Verma', 82.40, 19, 'M', 'CH'),
(10, 'Tanya Sen', 88.20, 18, 'F', 'AS'),
(11, 'Nikhil Roy', 69.70, 20, 'M', 'BR'),
(12, 'Divya Kaur', 91.10, 17, 'F', 'AS'),
(13, 'Arjun Rathi', 84.50, 19, 'M', 'HR'),
(14, 'Neha Jain', 87.65, 20, 'F', 'CH'),
(15, 'Vikas Singh', 79.00, 18, 'M', 'UP');


select * from studentt
select * from studentt where states='UP'
select *from studentt where states in ('MH','KA','DL')
select distinct states from studentt
select distinct gender,states from studentt   -- unique combination of gender and states
select distinct gender, states, marks from studentt    -- unique combination of gender , states and marks

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- comparision operators

-- = equl to
-- !=, <> not equal to
-- > greater than
-- < less than
-- >= greater than equal to
-- <= less than equl to

-- find students who scored exactly 85 marks
select * from STUDENTT where marks = 85

-- list all the students who scored more than 80 marks
select * from studentt where marks > 80
select roll,marks from studentt where marks > 80

-- students who are underage(<18)
select * from studentt where age <18

-- find students whose gender is not male
select * from studentt where gender != 'M'

--find students who have scored between 70 and 90
select * from studentt where marks between 70 and 90


--conditional operators ( AND , OR)
-- students from delhi who scored more than 80 marks and age greater than 17
select * from studentt where states = 'DL' and marks > 80 and age > 17

-- either you should be from delhi or you scored more than 80 marks
select * from STUDENTT where states ='Dl' or marks >80

--select students from mh who scored greater than 80 marks
select * from studentt where states='mh' and  marks > 80



--IMP QUESTIONS
-- Get details of students who are either from UP or RJ and have marks less than 80
select * from STUDENTT where states in ('Up','rj') and marks < 80

-- get students whose age is greater than 18 and marks are less than 75 or they belong to gj
select * from studentt where (age >18 and marks <75) or (states = 'gj')

-- select students who are not from mh and ka and have marks greater than 85
select * from studentt where states not in ('mh','ka') and marks > 85

-- college wants to give sholorship to students who satisfy one of the both conditions
-- 1. state is WB and marks >75
--2. gender = f and age < 19
select * from studentt where (states ='wb' and marks >75) or (gender = 'f' and age < 19)

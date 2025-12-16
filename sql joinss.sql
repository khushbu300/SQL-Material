CREATE TABLE student_hobby (
    roll  int,
    hobby VARCHAR(50)
);

-- Step 2: Insert 15 rows (only even roll numbers)
INSERT INTO student_hobby (roll, hobby) VALUES
(2, 'Reading'),
(4, 'Painting'),
(6, 'Dancing'),
(8, 'Football'),
(10, 'Photography'),
(12, 'Swimming'),
(14, 'Gardening'),
(16, 'Chess'),
(18, 'Singing'),
(20, 'Writing'),
(22, 'Cycling'),
(24, 'Cooking'),
(26, 'Sketching'),
(28, 'Playing Guitar'),
(30, 'Blogging');

select * from student_hobby

--JIONS
CREATE TABLE STUDENT
(
Roll int, 
Sname varchar(100),
Marks numeric(5,2),
Age int,
Gender varchar(1),
States varchar(2)
)

insert into student values
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

select * from student
select * from student_hobby

--INNER JOIN
--It returns only those rows which have matching values in both the tables

--Que- give information of all students whose hobbies are registered
select * from student as s1
inner join
student_hobby as s2
on s1.roll = s2.roll


select s1.roll,sname,marks from student as s1
inner join
student_hobby as s2
on s1.roll = s2.roll

--LEFT OUTER JOIN (LEFT JOIN)
-- it returns all the values from left table(first table) and corresponding values from right table
-- and if there are no corresponding value , it will give null
select * from student as s1
left join
student_hobby as s2
on s1.roll=s2.roll


--name the students who dont any any hobby
select * from
(
select s1.roll,sname,hobby from student as s1
left join
student_hobby as s2
on s1.roll=s2.roll
)k where hobby is null




-- list all the students along with there hobbies
select s1.roll,sname,hobby from 
student as s1
left join
student_hobby as s2
on s1.roll=s2.roll




--RIGHT OUTER JOIN (RIGHT JOIN)
-- it returns all the values from right table(second table) and corresponding values from left table
-- and if there are no corresponding value , it will give null
select * from student as s1
right join
student_hobby as s2
on s1.roll=s2.roll


--FULL OUTER JOIN
--IT display all the records from both the tables
select * from student as s1 
full outer join student_hobby as s2
on s1.roll= s2.roll


-- SELF JOIN
-- find pairs of students who are from same states
select * from student as A
join
student as B
on A.states = B.states
and a.roll != b.roll


-- ASSIGNMENT

CREATE TABLE student_hobby (
    roll INT ,
    hobby VARCHAR(50)

);


-- Step 2: Insert 15 rows (only even roll numbers)

INSERT INTO student_hobby (roll, hobby) VALUES
(102, 'Reading'),
(104, 'Painting'),
(106, 'Dancing'),
(108, 'Football'),
(110, 'Photography'),
(112, 'Swimming'),
(114, 'Gardening'),
(116, 'Chess'),
(118, 'Singing'),
(120, 'Writing'),
(122, 'Cycling'),
(124, 'Cooking'),
(126, 'Sketching'),
(128, 'Playing Guitar'),
(130, 'Blogging'),
(132, 'Chess'),
(134, 'Singing'),
(136, 'Writing'),
(138, 'Cycling'),
(140, 'Cooking'),
(142, 'Sketching'),
(144, 'Playing Guitar'),
(146, 'Blogging');


SELECT * FROM student
SELECT * FROM student_hobby

--●	Find the name and marks of students whose marks are higher than the average marks of students from their state.

select * from
(
select  states, avg(marks) as 'average' from student group by states
) as k
inner join student as s1 on
k.states = s1.states
where marks > average


--●	Display each state with its average marks,but only for states having more than 2 students.Order by average marks 
--descending.
select  states, avg(marks) as 'average'
from student group by states having count(*) > 2 order by avg(marks) desc


--●	Find students and hobbies  who have the same hobby as at least one other student.
select *  from student as s1
inner join
student_hobby as s2
on s1.roll = s2.roll
where s2.hobby in
(
 select hobby from student_hobby group by hobby 
 having count(*) > 1
 )

--●	Show hobbies that are shared by students from more than 1 different states.
select h.hobby, count(states) from student as s
inner join
student_hobby as h
on s.roll = h.roll
group by hobby
having count(states) > 1


--●	Find students who have the same marks as another student from a different state.(SELF JOIN )
select * from student as s
join 
student as b
on s.marks = b.marks
and s.states!= b.states


--CORRELATED SUBQUERY
-- CORRELATED SUBQUERY IS A QUERY THAT DEPENDS ON OUTER QUERY FOR ITS VALUE


--Que - show students whose marks are greater than average marks of all other students
select * from student  as s1
where s1.marks >
    (
   select avg(s2.marks)
   from student as s2
   where s2.roll!= s1.roll
   ) 




--●	 Find names of students who share a hobby with someone from a different state.
select * from student as s1
join
student_hobby as h1
on s1.roll = h1.roll
where h1.hobby in
  (
  	  select h2.hobby from 
	  student as s2
	  join
	  student_hobby as h2
	  on s2.roll = h2.roll
	  where s1.states<> s2.states
	)
																																											  																																								  
																																											  
--●	Find states where the average marks of females are higher than that of males.
select f.states from
(select states, avg(marks) as 'avg_marks_of_female' from student  where gender = 'f' group by states) as f
join
(select states, avg(marks) as 'avg_marks_of_male' from student  where gender = 'm' group by states) as m
on f.states = m.states
where f.avg_marks_of_female > m.avg_marks_of_male


--●	 List students whose hobbies are entirely unique (no one else has the same hobby).
select sname from student as s1
join
student_hobby as h1
on s1.roll = h1.roll
where h1.hobby in
(
select hobby  from student_hobby 
group by hobby having count(*) = 1
)


--●	 Find students whose entire state has a lower average than their marks.
--●	Find students who belong to the state with the highest number of different hobbies.
--●	Show names of students who have hobbies, and those who don't — in one list with indicator.
--●	 List states where total male and female student counts are equal.
--●	List students whose hobby is also practiced by students from at least 3 other states.
--●	 List hobbies that are only practiced by students below the average age.
--●	 Find all students who have exactly the same set of hobbies as Sneha Iyer.






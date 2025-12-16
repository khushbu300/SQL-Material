select * from student
-- ASSIGNMENT

--●	List the genders and their average marks for students younger than 20, only if the average marks are between 
-- 70 and 80.
select gender, avg(marks) from student where age < 20 group by gender having avg(marks) between 70 and 80

--●	Find average marks of male students in each state who are from 'UP', 'DL' or 'CH', and only show the states where average is below 80.
select states, avg(marks) from student where gender ='m' and states in ('up', 'dl', 'ch') group by states having avg(marks) < 80

--●	List states where female students have an average age greater than 18 and a total of more than 1 student.
select states , count(*) as 'count', avg(age) as 'avg age' from student where gender = 'f'  group by states
having avg(age) > 18 and count(*) > 1

--●	Show the state(s) whose topper scored less than the class average marks. Display state and that topper's marks.
select states, max(marks)as'state topper marks' from student group by states having max(marks)<(select avg(marks) from student)

--●	List the names of students who are not among the top 3 average-scoring states.
select * from student where states not in(
select top 3 states from student group by states order by  avg(marks) desc)



--● Show each state and its average marks, only for states whose average is higher than the overall class average.
-- Also, sort the result by highest average first.
select states, avg(marks) as 'avg_marks' from student  group by states 
having  avg(marks) > (select avg(marks) from student) order by avg(marks) desc


--	Find the name(s) of the student(s) who belong to the state with the second highest number of students.


SELECT *FROM student WHERE states = (
    SELECT states FROM (
        SELECT states, COUNT(*) AS number_of_students
        FROM student
        GROUP BY states
        ORDER BY COUNT(*) DESC
        OFFSET 1 ROWS              -- Skip 1st highest
        FETCH NEXT 1 ROWS ONLY     -- Take 2nd highest
    ) AS x
);



select * from student where states in(
select top 1 states from
(select  top 2 states,count(*) as 'countt' from student 
group by states 
order by count(*) desc)k
order by countt asc)

--●	Find the names of students who are the youngest in their state, and from the state with the highest number of students.
select top 1 * from(
select * from student where states in
 (select top 1 states from student group by states order by count(*) desc))K order by age

--●	Find the students who scored the highest marks among all those whose state has exactly 2 students.
select  top 1 sname from(
select * from student where states in(
select states from student group by states having count(*) = 2))k order by marks desc



--●	Find the name(s) of the student(s) who belong to the only state where the average age and average marks 
 -- both exceed the overall average.
 
 select * from student where states in(
 select states from student group by states
 having avg(age)> (select avg(age) from student) and avg(marks)>(select avg(marks) from student))

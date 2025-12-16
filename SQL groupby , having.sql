select * from student
--GROUP BY
-- it is used to organise data into groups based on specific column and to perform aggregate functions like
--(count,min,max,sum,avg) on each group

-- select maximum marks per gender
select gender, max(marks) from student group by gender

-- show average marks per state
select states, avg(marks) as 'state average marks'  from student group by states

--select avg marks gender and state wise
select gender, states , avg(marks) from student group by states, gender

-- HAVING AND WHERE
-- give avg marks per states for male
select states, avg(marks) from student where gender = 'm' group by states

-- get avg marks per states for male where avg marks > 70
select states, avg(marks) from student where gender = 'm' group by states having avg(marks) > 70

-- get the number of students from each states where age is more than 18, but only show those 
-- states which have minimum two students
select states, count(roll) as ' number of students' from student where age > 18 group by states having count(roll) >= 2

-- select total number of female students in each states who scored more than 85 but include only those states 
-- with atleast 2 students
select states, count(*) from student where gender = 'f' and marks > 85 group by states having count(*) >= 2


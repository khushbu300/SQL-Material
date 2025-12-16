create database home_assignment

use home_assignment
--●	Create a table  that will store the orders data  and have columns , orderid (int), customer name, order amount ,
--status , payment method, region.
create table assign1
(
orderid int,
customer_name varchar(100),
order_amount int,
status varchar(20),
payment_method varchar(20),
region varchar(20)
)

insert into assign1 values
(1001, 'Rahul Mehta', 250.75, 'Completed', 'Credit Card', 'North'),
(1002, 'Pooja Sharma', 125.00, 'Pending', 'Debit Card', 'South'),
(1003, 'Amit Singh', 560.00, 'Completed', 'Net Banking', 'East'),
(1004, 'Sneha Iyer', 310.50, 'Cancelled', 'Credit Card', 'West'),
(1005, 'Karan Patel', 410.20, 'Completed', 'UPI', 'North'),
(1006, 'Neha Gupta', 89.99, 'Pending', 'Debit Card', 'East'),
(1007, 'Arjun Nair', 150.00, 'Completed', 'Credit Card', 'South'),
(1008, 'Riya Das', 199.99, 'Completed', 'Net Banking', 'West'),
(1009, 'Manish Rawat', 320.00, 'Pending', 'UPI', 'North'),
(1010, 'Anjali Jain', 420.50, 'Completed', 'Credit Card', 'East'),
(1011, 'Vikram Patel', 280.00, 'Cancelled', 'Debit Card', 'South'),
(1012, 'Divya Mishra', 199.75, 'Completed', 'Net Banking', 'West'),
(1013, 'Siddharth Rao', 600.00, 'Pending', 'Credit Card', 'North'),
(1014, 'Tanvi Joshi', 305.00, 'Completed', 'Debit Card', 'East'),
(1015, 'Nikhil Kumar', 510.00, 'Pending', 'UPI', 'South'),
(1016, 'Harshita Reddy', 75.50, 'Completed', 'Credit Card', 'West'),
(1017, 'Yash Malhotra', 380.00, 'Cancelled', 'Debit Card', 'North'),
(1018, 'Meera Sinha', 450.00, 'Completed', 'Net Banking', 'South'),
(1019, 'Rohit Khanna', 220.00, 'Pending', 'UPI', 'East'),
(1020, 'Simran Kaur', 330.00, 'Completed', 'Credit Card', 'West'),
(1021, 'Lakshay Bhatia', 410.00, 'Completed', 'Debit Card', 'North'),
(1022, 'Kritika Chopra', 95.00, 'Pending', 'Net Banking', 'South'),
(1023, 'Varun Bansal', 140.00, 'Completed', 'UPI', 'East'),
(1024, 'Tanya Thakur', 230.00, 'Cancelled', 'Credit Card', 'West'),
(1025, 'Pranav Nair', 340.00, 'Completed', 'Debit Card', 'North'),
(1026, 'Ayesha Khan', 150.00, 'Pending', 'Net Banking', 'South'),
(1027, 'Deepak Yadav', 420.00, 'Completed', 'UPI', 'East'),
(1028, 'Ishita Patel', 185.00, 'Cancelled', 'Credit Card', 'West'),
(1029, 'Saurabh Tripathi', 230.00, 'Completed', 'Debit Card', 'North'),
(1030, 'Nikita Sen', 295.00, 'Pending', 'Net Banking', 'South'),
(1031, 'Gautam Raj', 320.00, 'Completed', 'UPI', 'East'),
(1032, 'Shalini Menon', 200.00, 'Cancelled', 'Credit Card', 'West'),
(1033, 'Rajeev Ranjan', 490.00, 'Completed', 'Debit Card', 'North'),
(1034, 'Bhavna Arora', 75.00, 'Pending', 'Net Banking', 'South'),
(1035, 'Kunal Ghosh', 430.00, 'Completed', 'UPI', 'East'),
(1036, 'Mehul Shah', 350.00, 'Cancelled', 'Credit Card', 'West'),
(1037, 'Priti Chatterjee', 120.00, 'Completed', 'Debit Card', 'North'),
(1038, 'Rakesh Chauhan', 220.00, 'Pending', 'Net Banking', 'South'),
(1039, 'Sanya Malhotra', 310.00, 'Completed', 'UPI', 'East'),
(1040, 'Ankit Dubey', 275.00, 'Cancelled', 'Credit Card', 'West'),
(1041, 'Ira Saxena', 305.00, 'Completed', 'Debit Card', 'North'),
(1042, 'Jay Sinha', 400.00, 'Pending', 'Net Banking', 'South'),
(1043, 'Lavanya Kapoor', 460.00, 'Completed', 'UPI', 'East'),
(1044, 'Zoya Mirza', 210.00, 'Cancelled', 'Credit Card', 'West'),
(1045, 'Vivek Anand', 320.00, 'Completed', 'Debit Card', 'North'),
(1046, 'Rashmi Jha', 390.00, 'Pending', 'Net Banking', 'South'),
(1047, 'Alok Tiwari', 220.00, 'Completed', 'UPI', 'East'),
(1048, 'Preeti Nair', 175.00, 'Cancelled', 'Credit Card', 'West'),
(1049, 'Mohit Suri', 290.00, 'Completed', 'Debit Card', 'North'),
(1050, 'Tarun Kohli', 350.00, 'Pending', 'Net Banking', 'South');

select * from assign1

-- ● Find all distinct regions where orders were either completed with an amount greater than 300 or pending 
-- with an amount less than 200.
select distinct region from assign1 where (status = 'completed' and order_amount > 300) or 
(status = 'pending' and order_amount < 200)



--●	List distinct customer names who have either cancelled orders or completed orders with an amount greater than or 
--equal to 400, but exclude those who paid via UPI.
select customer_name from assign1 where payment_method != 'upi' and order_amount > 400



--●	Retrieve OrderIDs for orders placed in the 'East' or 'West' region with order amount between 200 and 350 
-- inclusive, and payment method is either Credit Card or Debit Card.
select orderid from assign1 where (region in ('east','west')) and (order_amount between 200 and 350) 
and (payment_method in ('credit card', 'debit card'))



--●	Identify distinct regions where payment method is Net Banking and order status is either Completed or 
-- Pending with amount greater than or equal to 200
select distinct region from assign1 where payment_method = 'net banking' and order_amount >= 200



--●	Find all distinct payment methods used for orders that are either completed with an order amount above 400 
-- or pending with order amount below 150, and region is NOT ‘West’.
select * from assign1  where (status = 'completed' and order_amount >400) 
or (status = 'pending' and order_amount < 150) and region != 'west'



--●	The sales manager wants to identify all unique customers who have made at least one high-value order 
-- (above 500) that is either completed or pending, but only from the 'North' or 'East' regions. Also, exclude 
-- customers who used 'Credit Card' for payment.

select * from assign1 where order_amount > 500 and region in ('north', 'east') and  payment_method != 'credit card'



--●	Marketing wants to send targeted campaigns to customers who have placed orders that are either:
--●	Pending orders above 200 and paid by 'Debit Card' or 'Credit Card', or
--●	Completed orders below 150 from the 'South' or 'East' region.
--Find the distinct customers who meet either of these two conditions.

select * from assign1 where (status = 'pending') and (order_amount < 150)
and (payment_method in ('debit card','credit card'))
or ((order_amount < 150) and region in ('south','east'))



-- ● The logistics team wants to identify unique order IDs for orders which are either:Completed orders 
-- with amounts between 300 and 600 but not from 'North' region,Or pending orders less than 100 made using 'UPI'.
select  distinct orderid from assign1 where ((status ='completed') and (order_amount between 300 and 600) and (region != 'north' ))
or ((status = 'pending') and (order_amount < 100) and (payment_method = 'upi'))





---● List distinct customers who have placed orders with amounts between 150 and 350, where the order status 
-- is either 'Pending' or 'Completed', and payment method is not 'Credit Card' or 'Net Banking'. Also, exclude 
-- customers from the 'South' region.
select * from assign1 where order_amount between 150 and 350 and status in ('completed', 'pending') 
and payment_method not in ('credit card' , 'net banking') and region != 'south'


__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

                                                      ----ASSIGNMENT NO 2
CREATE TABLE employees 
(
    emp_id INT,
    emp_name VARCHAR(50),
    age INT,
    gender CHAR(1),
    department VARCHAR(50),
    city VARCHAR(50)
);

-- Table: training_Q1
CREATE TABLE training_Q1 
(
    emp_id INT,
    training_name VARCHAR(50),
    training_score INT
);

-- Table: training_Q2
CREATE TABLE training_Q2 
(
    emp_id INT,
    training_name VARCHAR(50),
    training_score INT
);


INSERT INTO employees VALUES
(1, 'John Smith', 34, 'M', 'Tech', 'Delhi'),
(2, 'Nina J.', 29, 'F', 'Tech', 'Mumbai'),
(3, 'Akash N', 41, 'M', 'HR', 'Delhi'),
(4, 'Kriti Shah', 25, 'F', 'HR', 'Kolkata'),
(5, 'Daniel K', 38, 'M', 'Finance', 'Mumbai'),
(6, 'Jaya P.', 30, 'F', 'Tech', 'Chennai'),
(7, 'Anil_', 33, 'M', 'HR', 'Delhi'),
(8, 'Zara Khan', 28, 'F', 'Finance', 'Delhi');

INSERT INTO training_Q1 VALUES
(1, 'Advanced SQL', 90),
(2, 'Advanced SQL', 55),
(3, 'Leadership', 80),
(4, 'Leadership', 70),
(5, 'Risk Mgmt', 60),
(6, 'Advanced SQL', 65),
(7, 'Leadership', 50),
(8, 'Risk Mgmt', 75);

INSERT INTO training_Q2 VALUES
(1, 'Data Analysis', 88),
(2, 'Ethics', 78),
(3, 'Data Analysis', 82),
(4, 'Ethics', 60),
(5, 'Financial Modeling', 85),
(6, 'Ethics', 50),
(7, 'Data Analysis', 48),
(8, 'Financial Modeling', 92);


select * from employees
select * from training_Q1
select * from training_Q2

--●	Find names of all employees from non-Mumbai cities whose names start with vowel and end with consonants.
select emp_name from employees where city != 'mumbai' and emp_name like '[aeiou]%' and emp_name not like '%[aeiou]'


--●	Find names where the name starts with r but name does not contains a.
select emp_name from employees where emp_name like 'r%'and emp_name not like '%a%'


--●	Find emp_ids who did not appear in either Q1 or Q2.
select emp_id  from employees where emp_id not in 
(
select emp_id from training_Q1
union 
select emp_id from training_Q2
)


--●	Find employees trained in any topic that contains exactly 2 words in name.
select emp_name  from employees where emp_id in
(
select distinct emp_id from training_Q1 where training_name like '% %'
union
select distinct emp_id from training_Q2 where training_name like '% %'
)



--●	List employees from Mumbai who scored more than every employee from Delhi in Q1.
select emp_name from employees where city = 'mumbai' and  emp_id in(
select emp_id from training_Q1 where training_score > all
(
select training_score from training_Q1 where emp_id in
(
select emp_id from employees where city = 'delhi'
)
)
)

--●	 List all employees who never trained in ‘Cyber Security’ in any quarter.
SELECT emp_id, emp_name
FROM employees
WHERE emp_id NOT IN (
    SELECT emp_id FROM training_Q1 WHERE training_name = 'Cyber Security'
    UNION
    SELECT emp_id FROM training_Q2 WHERE training_name = 'Cyber Security'
)



--●	 List employees who scored more than 70 in Q1 and belong to departments where at least one person failed in Q2 (<40).
select emp_id from training_Q1 where training_score > 70 and emp_id in
(
select emp_id from employees where department in 
(
select department from employees where emp_id in
(
select emp_id from training_Q2 where training_score < 40
)
)
)



--●	Get emp_ids trained in ‘AI’ in Q1 or Q2 but not both.

(select emp_id from training_Q1 where training_name = 'ai'
union
select emp_id from training_Q2 where training_name = 'ai')
except
(select emp_id from training_Q1 where training_name = 'ai'
intersect
select emp_id from training_Q2 where training_name = 'ai')


--●	 Find employees whose score in Q2 is higher than max score of Q1.
select emp_name from employees where emp_id in(
select emp_id from training_Q2 where training_score > 
(select max(training_score) from training_Q1))


select * from employees
select * from training_Q1
select * from training_Q2


---●	Get departments where no employee trained in Q2.

SELECT DISTINCT department FROM employees
WHERE department NOT IN (
    SELECT DISTINCT department
    FROM employees as e
    JOIN training_Q2 t ON e.emp_id = t.emp_id
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             -- ASSIGNMENT 3

--1.	Create a new table named  “Employee” & “Charity” and insert some data.
use home_assignment

create table employee
(
EID varchar(10),
ENAME VARCHAR (100),
GRADE VARCHAR (2),
AGE INT,
GENDER VARCHAR (2),
STATE VARCHAR (10),
SALARY INT
)

INSERT INTO employee VALUES
(101,'GAUTAM SINHA', 'A',40,'M','BH',50000),
(102,'SHRIJAN BASU', 'B',30,'M','WB',40000),
(103,'NANDINI APTE', 'A',45,'F','MH',57000),
(104,'SATYEN MURMU', 'B',33,'M','JH',32000),
(105,'PRIYA KUMARI', 'C',31,'F','JH',25000),
(106,'VIGNESH D', 'D',25,'M','TN',15000),
(107,'GRISHMA DASARI', 'C',27,'F','AP',17000)


CREATE TABLE CHARITY
(
EID VARCHAR (10),
ENAME VARCHAR(100),
DONATION INT
)


INSERT INTO CHARITY VALUES
(101, 'GAUTAM SINHA', 500),
(103, 'NANDINI APTE',3000),
(107, 'GRISHMA DASARI', 750),
(501, 'DHEERAJ RAJ', 1250)


SELECT * FROM employee
SELECT * FROM CHARITY

--2.	Write a query to show all the employee names who have donated something
select ename from charity

--3.	Write a query to show the names who have donated something from the employee table.
select ename from employee where ename in(
select ename from charity)


--4.	Write a query to show the names who have not donated at all from the employee table.
select ename from employee where ename not in(
select ename from charity)

--5.	Write a query to show the names who have donated something but not from the employee table.
select ename from charity where ename not in(
select ename from employee)


--6.	Write a query to show the names of everyone either he/she is from employee table or from charity table.
select ename from employee
union 
select ename from charity


-- 7.	Write a query to show the distinct names of everyone either he/she is from employee table or from charity table. 
-- (should not get repetitive names)
select ename from employee
union 
select ename from charity


--8.	Write a query to show the names and IDs of the employees (from employee table) who have donated something.
select eid, ename from employee where eid in
(
select eid from charity
)

--9.	Write a query to show the names and IDs of everyone from the employee table and charity table.
select eid, ename from employee
union
select eid, ename from charity


--10.	Write a query to show the distinct names and IDs of everyone from the employee table and Charity table.
--(should not be repetitive)
select eid, ename from employee
union 
select eid, ename from charity



--11.	Write a query to show the names (which is not matching) from both the table
select ename from employee where eid in
(
		(select eid from employee
		except
		select eid from charity)
)
union
select ename from charity where eid in
(
		(select eid from charity
		except
		select eid from employee)
)


-- 12.	Write a query to show name, age, and gender of the employees who has donated something
select ename, age, gender from employee where eid in 
(
select eid from charity
)

--13.	Write a query to show name, age, and gender of the employees who has not donated anything.
select ename, age, gender from employee where eid not in 
(
select eid from charity
)


--14.	Write a query to show the grades from which no one has donated anything.
select distinct grade from employee
except
select distinct grade from employee where eid in
(select eid from charity)



--15.	Write a query to show names of the employee who belongs to the grade from which no one has donated anything.
select ename from  employee where grade in
(
	select distinct grade from employee
	except
	select distinct grade from employee where eid in
	(select eid from charity)
)



--16.	Write a query to show the full details of the employee who has donated maximum.
select * from employee where eid in
(select eid from charity where donation = (select max(donation) from charity))


--17.	Write a query to show the full details of the employee who has donated 2nd highest amount.
--(person should be from employee table)
select * from employee where eid in
(select top 1 eid from
(select top 2 * from charity where eid in
(select eid from charity where eid in
(select eid from employee)) order by donation desc)k order by donation)



--18.	Write a query to show the name of the employee who earns the highest salary.
select ename from employee where salary = (select max(salary) from employee)


--19.	Write a query to show the name of the employee who earns the 2nd highest salary.
select top 1 ename from (select  top 2 * from employee order by salary desc)k order by salary


--20.	Write a query to show the name and salary of the employee who earns the lowest salary.
select top 1 ename, salary from employee order by salary


--21.	Write a query to show the name , salary and age of the employee who earns the 3rd lowest salary.
select top 1 ename, salary, age from (select top 3 * from employee order by salary)k order by salary desc


--22.	Write a query to show the names of the states from which only male employees work. “JH” would not be there,
-- as there is a female employee in the organization from state “JH”.
select state from employee where gender = 'm' and state != 'jh'


SELECT * FROM employee
SELECT * FROM CHARITY
------------------------------------------------------------------------------------------------------------------
--23.	Write a query to show the names of the male employee for which there is a female employee from the same state.
select state,gender, count(eid) from employee group by state, gender having gender = 'm'
select eid , state from employee where gender = 'm'
select * from employee where gender = 'f'


--24.	Write a query to show the names of the employee whose salary is in a range between lowest salary and 30000.
select * from employee where salary between (select top 1  salary from employee order by salary) and 30000


--25.	Write a query to display all the information of the employees who are on those grades in which age of
--some employees >= 35.
select * from employee where age >= 35

SELECT * FROM employee
SELECT * FROM CHARITY
--26.	Write a query to display all the information of the employees having age less than 32 but belong to
--those grade in which there is any person having age >= 32.
select *  from employee where grade  in
(select  grade from employee where age >= 32 ) and age < 32


--●	Example: Srijan Basu’s name would come up, as his age is 30 (which is less than 32), but Satyen Murmu 
--(on the Same Grade “B”) is having age (which is 33) greater than 32.


--27.	Write a query to display the employee name for all employees in the same Grade as Nandini.
select ename from (
select * from employee where grade =
(select grade from employee where ename = 'nandini apte')
)k where ename != 'nandini apte'

--28.	Write a query to display the employee ID and name for all employees who do not work in a grade with 
--any employee whose name contains a ‘T’.



--29.	Write a query to display all the information of the employee who earns more than the average salary of 
--the organization.
 select * from employee  where salary > (select avg(salary) from employee)



--30.	Write a query to show all the information of the employees who are not among 3 lowest salary getting persons.
select * from employee where eid not in(
select top 3 eid from employee order by salary)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                -- ASSIGNMENT 4 --
USE HOME_ASSIGNMENT
SELECT * FROM employee

-- 1.	Add a new column named email_id, datatype of which would be varchar(100).
alter table employee add email_id varchar(100)


--2.	Add a new column named Phone_Number, datatype of which would be int.
alter table employee add phone_number int


--3.	Add a new column named manager_id, datatype of which would be int.
alter table employee add manager_id int


--4.	Make the EID column identity.


--5.	Change datatype of Phone_Number to BIGINT.
alter table employee alter column phone_number bigint

sp_help employee

--6.	Change the datatype of GENDER to BIT.
alter table employee alter column gender bit


--7.	Change the size of email_id column to 50 from 100.
alter table employee alter column email_id varchar(50)


select * from employee
--8.	Enter the phone numbers into the column “phone_number” as per the below table.
update employee set contact_number = 9075103656 where eid = 101
update employee set contact_number = 5632698442 where eid= 102
update employee set contact_number = 9823659841 where eid= 103
update employee set contact_number = 8942563125 where eid= 104
update employee set contact_number = 2563987458 where eid= 105
update employee set contact_number = 7896563269 where eid= 106
update employee set contact_number = 1258963578 where eid= 107
update employee set contact_number = 7456893698 where eid= 109


--9.	Enter the Manager’s id into the column “manager_id” as per the below table.
UPDATE Employee SET manager_id = NULL WHERE EID = 101;
UPDATE Employee SET manager_id = 101 WHERE EID = 102;
UPDATE Employee SET manager_id = 101 WHERE EID = 103;
UPDATE Employee SET manager_id = 103 WHERE EID = 104;
UPDATE Employee SET manager_id = 102 WHERE EID = 105;
UPDATE Employee SET manager_id = 105 WHERE EID = 106;
UPDATE Employee SET manager_id = 104 WHERE EID = 107;

--10.	Remove the column “email_id”.
alter table employee drop column email_id


--11.	Insert a new record for Rahul Roy with following details.
insert into employee (ename, age, gender, salary) values ('RAHUL ROY' ,35, 'M', 900000)



--12.	Insert a new record for Nibedita Sen with age 29, Grade C only. Other fields would be NULL.
insert into employee VALUES(null, 'NIBEDITA SEN', 'C',29, NULL, NULL, NULL, NULL, NULL, NULL)


--13.	Change the column name Phone_Number to Contact_No.
 exec sp_rename 'employee.phone_number', 'contact_number','column'

--14.	Convert column [GRADE] as Not nullable, means it cannot contain any NULL value.


--15.	Delete the record for Nibedita Sen from the table.
delete from employee where ename = 'NIBEDITA SEN'


--16.	Insert again the record for Nibedita Sen with age 29, Grade C only and with EID 109 again.
insert into employee VALUES(109, 'NIBEDITA SEN', 'C',29, NULL, NULL, NULL, NULL, NULL, NULL)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                 -- ASSIGNMENT 5 --
--●	Create a table with DDL Schema:- Student (ROLL, SNAME, SUBJECTS, MARKS, GENDER, STATE)
create table student
(
roll varchar(10),
sname varchar(100),
subject varchar(10),
marks numeric(5,2),
gender varchar(2),
state varchar(10)
)


insert into student values
(1,'Ankan','phys',30.5,'M','WB'),
(1,'Ankan','chem',75.5,'M','WB'),
(1,'Ankan','math',87.0,'M','WB'),
(2,'Shreya','phys',82.5,'F','WB'),
(2,'Shreya','chem',77.5,'F','WB'),
(2,'Shreya','math',91.0,'F','WB'),
(3,'Radhika','phys',60.0,'F','WB'),
(3,'Radhika','chem',85.5,'F','WB'),
(3,'Radhika','math',89.0,'F','WB'),
(4,'Uday','phys',90.0,'M','WB'),
(4,'Uday','chem',71.5,'M','WB'),
(4,'Uday','math',92.0,'M','WB'),
(5,'Vijay','phys',90.0,'M','DL'),
(5,'Vijay','chem',91.5,'M','DL'),
(5,'Vijay','math',38.5,'M','DL'),
(6,'Sujay','phys',70.0,'M','DL'),
(6,'Sujay','chem',70.5,'M','DL'),
(6,'Sujay','math',78.5,'M','DL'),
(7,'Suman','phys',20.0,'M','DL'),
(7,'Suman','chem',82.0,'M','DL'),
(7,'Suman','math',50.5,'M','DL'),
(8,'Nidhi','phys',61.0,'F','DL'),
(8,'Nidhi','chem',63.0,'F','DL'),
(8,'Nidhi','math',69.0,'F','DL'),
(9,'Zoya','phys',21.0,'F','DL'),
(9,'Zoya','chem',71.0,'F','DL'),
(9,'Zoya','math',72.5,'F','DL'),
(10,'Olga','phys',11.0,'F','CA'),
(10,'Olga','chem',81.0,'F','CA'),
(10,'Olga','math',82.5,'F','CA'),
(11,'Georgy','phys',18.0,'F','CA'),
(11,'Georgy','chem',25.5,'F','CA'),
(11,'Georgy','math',85.0,'F','CA'),
(12,'Smith','phys',81.0,'M','CA'),
(12,'Smith','chem',82.5,'M','CA'),
(12,'Smith','math',77.0,'M','CA'),
(13,'Alan','phys',21.0,'M','WB'),
(13,'Alan','chem',22.5,'M','WB'),
(13,'Alan','math',37.0,'M','WB'),
(14,'George','phys',82.0,'M','LN'),
(14,'George','chem',62.5,'M','LN'),
(14,'George','math',55.0,'M','LN'),
(15,'Adams','phys',91.0,'M','LN'),
(15,'Adams','chem',92.0,'M','LN'),
(15,'Adams','math',87.0,'M','LN')

select * from student


--●	Write a query to print the highest individual marks.
 --(Means Roll 1 with its best subject score, then Roll 2 with its best subject score.)
 select sname, max(marks) from student group by sname

--●	Write a query to print highest marks in math.
select max(marks) from student where subject = 'math'

--●	Write a query to print highest marks in each subject.
select subject, max(marks) from stud group by subject

--●	Write a query to print average marks in each subject.
select subject, avg(marks) from stud group by subject

--●	Write a query to print the total marks of each student.
select sname, sum(marks) from student group by sname


--●	Write a query to print the subject-wise average marks.
select subject, avg(marks) from stud group by subject


--●	Write a query to print state-wise highest marks in math.
select state, max(marks) from student where subject = 'math' group by state


select * from student

--●	Write a query to print gender-wise average marks in physics.
select gender, avg(marks) from student where subject = 'phys' group by gender


--●	Write a query to print state-wise count of students who passed the chem exam (passing marks: 40).
select state, count(roll) from student  where subject = 'chem' and marks >40  group by state


--●	Write a query to print the number of male and female students who passed the math exam.
select gender, count(roll) from student where subject = 'math' and marks > 40 group by gender

--●	Write a query to print the count of male and female students.
select gender, count(*) from(
select distinct sname, gender from student)k group by gender


--●	Write a query to print state-wise subject-wise highest marks.
select state, subject, max(marks) from student group by  subject, state

--●	Write a query to print subject-wise gender-wise highest marks.
select subject, gender, max(marks) from student group by gender, subject


--●	Write a query to print subject-wise state-wise average marks.
select  subject,state ,avg(marks) from student group by  subject, state

--●	Write a query to print state-wise subject-wise gender-wise maximum marks.
select state, subject, gender, max(marks) from student group by  state, subject, gender

--●	Print the total marks for each student.
select sname, sum(marks) from student group by sname

--●	Print the total marks for each student who passed the exam in terms of total marks (i.e., 120).
select sname, sum(marks) from student group by sname having sum(marks) >=120


--●	Print the total marks of Physics and Chemistry of each student.
select sname, sum(marks) from student where subject in('phys','chem') group by sname


--●	Write a query to print the highest total marks in the class.
select  top 1 sname, sum(marks) from student group by sname order by sum(marks) desc


--●	Write a query to print the average total marks of each student.
select avg(total_marks) from(
select sname, sum(marks) as 'total_marks' from student group by sname)k


--●	Write a query to print the subject wise average total marks of the students.
select subject,avg(marks) from student group by subject

select * from stud


--●	Write a query to print gender-wise top total marks.
select gender, sum(marks) from student group by gender

--●	Write a query to print state-wise topper’s total marks.
select  state, max(total_marks) from (
select state, sname,sum(marks)as  'total_marks' from stud group by sname, state 
)k group by state

--●	Write a query to print state-wise average total marks.
select state, avg(total_marks) from (
select state,roll, sum(marks) as 'total_marks' from student group by state, roll)k group by state


--●	Write a query to print state-wise average total marks, but show the states having average total marks > 150.
select state, avg(total_marks) from (
select state,roll, sum(marks) as 'total_marks' from student group by state, roll)k group by state
having avg(total_marks) > 150



--●	Write a query to print the total marks of the student who is the topper in the class in terms of total marks.
select top 1 sname, sum(marks) as 'total_marks' from student group by sname order by sum(marks) desc




--●	Print the state names only for whom the average marks in Physics is greater than 80.
select state, avg(marks) as  'avg_marks' from student where subject = 'phys' group by state
having avg(marks) > 80



--●	Print the state-wise count of the students who scored greater than 250 in total.
select state, count(roll) from (
select roll, state, sum(marks) as 'total_marks' from student group by state,roll having sum(marks) > 250)k
group by state




--●	Print the state-wise gender-wise count of the students who scored greater than 250 in total.
select state, gender, count(roll) from (
select roll, state, gender , sum(marks)as 'total_marks' from student group by state, gender, roll having sum(marks) > 250)k
group by state, gender


--●	Among female students, state-wise highest total marks.
select state, max(total_marks) from(
select state,sname, sum(marks)as 'total_marks' from student where gender= 'f' group by state, sname)k
group by state



--●	Top 3 total marks.
select top 3 sname , sum(marks) from student group by sname order by sum(marks) desc


--●	Count of students who failed in total marks.
select count(*) from (
select sname, sum(marks) as 'total_marks' from student group by sname)k where total_marks < 120 


--●	Gender-wise count of students who failed in terms of total marks.
select gender, count(*) from(
select sname,gender, sum(marks) as 'total_marks' from student group by sname, gender)k where total_marks <120 group by 
gender


--●	Count of students who failed in at least 1 subject.
select count(*) from(
select  roll, count(*) as total_count from student where marks < 40 group by roll)k


--●	Count of students who failed in all of the 3 subjects.
select roll from (
select roll,  count(*)as 'count' from student where marks < 40 group by roll)k where count = 3


--●	Count of students who failed in exactly 1 subject.
select count(*) from(
select  roll, count(roll) as 'count' from student where marks < 40 group by roll)k where count = 1



--●	Gender-wise state-wise count of students who failed in all 3 subjects.
select  gender, state, count(*) from(
select roll, state,gender ,count(roll)as 'count' from student where marks < 40 group by gender, state, roll)k
 where count = 3 group by gender, state



--●	Gender-wise state-wise count of students who failed in at least 1 subject.
select  gender, state, count(*) from(
select roll, state,gender ,count(roll)as 'count' from student where marks < 40 group by gender, state, roll)k
 where count >=1 group by gender, state



--●	Gender-wise state-wise count of students who failed in at least 1 subject, but passed in total marks.



 select gender, state, count(*) as [No. of student] from
(select roll, gender, state from student where marks<40 
group by roll, gender, state
intersect
select roll, gender, state from student  
group by roll, gender, state
having sum(marks)>120)t
group by gender, state



--●	Gender-wise state-wise count of students who failed in exactly 2 subjects.
select gender, state, count(*) from(
select roll, gender, state,count(*) as 'count' from student where marks < 40 group by roll, gender, state
)k where count = 2 group by gender, state



--●	Name of the state with highest average marks in Physics for female students.
select top 1 state, avg(marks) from student where subject = 'phys' and gender = 'f' group by state order by avg(marks) desc


--●	Name of the state with lowest average marks in Math for female students.
select top 1 state, avg(marks) from student where subject = 'math' and gender = 'f' group by state order by avg(marks)


--●	Name of the top 3 states with highest average marks in Physics for female students.
select state, avg(marks) from student where subject = 'phys' and gender = 'f' group by state order by avg(marks) desc


--●	Name of the state with highest average total marks.
select  top 1 state, avg(total_marks) from(
select roll, state, sum(marks) as 'total_marks' from student group by roll,state 
)k group by state order by avg(total_marks) desc



select * from student
exec sp_rename 'stud', 'student'
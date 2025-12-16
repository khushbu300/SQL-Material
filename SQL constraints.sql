--CONSTRAINTS
--PRIMARY KEY
--1. primary key should not have null values
--2. primary key do not accept duplicate values
--3. one primary key per table
--4. primary key can be defined on one or more than one column
--5. clustered index is created with creation on primary key on same column

-- use campusx_class1

create table flight
(
FID varchar(20) primary key,
source_city varchar(100),
dest_city varchar(100),
price int
)

sp_help flight

Insert into flight values
(101,'delhi','mumbai',2999)

select * from flight

Insert into flight values
(null,'delhi','mumbai',2999)      --gives error

Insert into flight values
(101,'delhi','mumbai',2999)        --- gives error



-- primary key on multiple columns
create table courseenrollment
(
studentid int,
courseid int,
enrollment_date date
primary key (studentid, courseid)
)

sp_help courseenrollment

-- desc courseenrollment    --- this desc function does not work in mssql

insert into courseenrollment values
(1,101,getdate())

select * from courseenrollment

insert into courseenrollment values   -- error
(null,102,getdate())

insert into courseenrollment values    --error
(1,null,getdate())

insert into courseenrollment values
(1,102,getdate())

insert into courseenrollment values
(2,102,getdate())

--------------------------------------------------------------------------------------------------------------------------------------------------
--UNIQUE KEY
--Any column defined as unique will restrict the entry of duplicates
--There can be many unique key in a table
--non clustered index is created.

create table users
(
userid int primary key,
email varchar(100) unique,
phone int unique,
names varchar (100)
)

sp_help users

insert into users values
(1,'abc@gmail.com',1234,'khushbu')

select * from users

insert into users values
(2,'abc@gmail.com',1234,'khushbu')    --- error

insert into users values
(2,null ,12345,'khushbu')

insert into users values        -- error as null is duplicate value
(3,null,12345896,'khushbu')

select * from users

-- droping the constraint
alter table users
drop constraint UQ__users__AB6E61641C89D120


insert into users values     --- no error
(3,null,1234,'khushbu')


--NAMING THE CONSTRAINTS
create table orders
(
orderid int,
ordernumber int,
constraint pk_orders_orderid primary key(orderid),
constraint uq_orders_ordernumber unique(ordernumber)
)

select * from orders

sp_help orders



-- CREATING PRIMARY KEY ON AN EXISTING TABLE
select * from student


sp_help student

alter table student
alter column roll int not null


alter table student 
add constraint c2 primary key (roll)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--NOT NULL.
Create table employees
(
employeeid int primary key,
names varchar(100) not null,
email varchar(100),
department varchar(50) not null
)

sp_help employees

select * from employees

insert into employees values
(1,'khushbu shahare',null, 'IT')


insert into employees values    --- error
(2,null,'abc@gmail.com', 'ITT')


insert into employees values    --- error
(2,'Nisha','abc@gmail.com', null)

-------------------------------------------------------------------------------------------------------------------------------------------
-- FOREIGN KEY
--  foreign key is a field (or collection of fields) in one table that refers to primary key of other table

select * from flight





create table passengers
(
pid int,
pname varchar(100),
flid varchar(20) foreign key references flight(fid)
)

sp_help passengers
sp_help flight


insert into passengers values
(2,'khushbu',102)

insert into passengers values
(3,'Bhavneet',101)



select * from passengers
select * from flight

insert into flight values
(102, 'delhi','mumbai',2999)

insert into flight values
(111, 'pune','kolkata',3999)

delete from flight where fid = 111       --- no error

delete from flight where fid = 102         --- error

-- we can not delete the records from parent table which have reference to the child table.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ON DELETE CASCADE
--(on deleting some rows from parent table , corresponding rows from child table will also get deletade
select * from passengers
select * from flight

create table department
(
deptid int primary key,
deptname varchar(50) not null
)


create table employees1
(
empid int primary key,
empname varchar(100) not null,
deptid int,
constraint c1 foreign key (deptid) references department(deptid) on delete cascade
)


insert into department values
(1,'hr'),
(2,'IT')

insert into employees1 values
(101,'ajay',2),
(102,'neha',2),
(103,'ravi',1)


select * from department
select * from employees1

delete from department where deptid=1


--CREATING FOREIGN KEY ON MULTIPLE COLUMNS
create table coursegrade
(
studentid int, 
courseid int,
grade varchar(1),
constraint c3 foreign key(studentid,courseid) references
courseenrollment(studentid, courseid)
)



select * from courseenrollment

---------------------------------------------------------------------------------------------------------------------------------------

-- DEFAULT CONSTRAINTS
-- default constraint is used to assign a default value to a column if nothing is inserted

create table employees2
(
empid int primary key,
empname varchar(100),
deptid int,
joiningdate date default getdate(),
status varchar(20) constraint df_status default 'Active'
)

sp_help employees2

insert into employees2(empid,empname,deptid) values
(1,'ajay',1)

select * from employees2


-- ADDING DEFAULT CONSTRAINT ON AN EXISTING TABLE
Create table projects
(
projectid int primary key,
projectname varchar(100),
status varchar(100)
)

 alter table projects
 add constraint c5 default 'pending' for status

 -- alter table projects modify column status varchar(100) default 'pending'        ---mysql


 sp_help projects

-- droping the constraint
 alter table projects
 drop constraint c5

 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECK CONSTRAINT
-- It restricts the values that can be inserted into a particulat column, it ensures that only those values are inserted that follows a particular rule

create table employees3
(
empid int primary key,
empname varchar(100),
age int check (age >=18 and age<=60),
salary decimal(10,2),
gender char(1) constraint c11 check(gender in ('m','f'))
)

sp_help employees3

insert  into employees3 values
(1,'ajay',24,500000,'m')

insert  into employees3 values   --- error
(1,'amir',14,500000,'m')


-- adding check constraint on existing table
alter table projects
add constraint c5 check (projectid>10)


-----------------------------------------------------------------------------------------------------------------------------------------

--IDENTITY COLUMN
Create table emp
(
empid int identity(1,1) primary key,     ---(1,1) starting from 1 and increment of 1
name varchar(100),
dept varchar(100)
)

insert into emp (name, dept) values
('john','hr'),('jane','finance')

select * from emp

insert into emp values     ---- error
(4,'beta','marketing')


-- turn on identity insert
set identity_insert emp on;

-- insert values
insert into emp(empid,name,dept)values
(4,'beta','marketing');

--turn it off
set identity_insert emp off;

select * from emp
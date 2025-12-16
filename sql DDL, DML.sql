--DDL/DML COMMANDS

--DDL - Data Defination Language, Structure of database
--DML - Data Manipulation Language, Data


--DDL
--1.CREATE
--2.ALTER - to perforn any modification on the table

-- add  new column email

-- use master
select * from studentt
alter table studentt add email varchar(100)

sp_help studentt
-- modify an existinhg datatype
alter table studentt alter column age smallint

-- rename the column
exec sp_rename 'studentt.sname','student_name', 'column'

--DROP - TO DELETE THE TABLE AND ITS STRUCTURE
 drop table studentt


-- TRUNCATE - DELETE ALL THE DATA OF THE TABLE BUT KEEP ITS STRUCTURE
 truncate table studentt

 -- RENAME THE TABLE
 exec sp_rename 'studentt', 'student1'
 
 select * from student1


 -- DML COMMONDS
 --INSERT
 --SELECT

 --UPDATE - TO MODIFY EXISTING DATA
 select * from student1
  update student1 set marks = 95.00 where roll =15

  select * from student1 update student1 set roll = 16 where roll = 1


--DELETE -- TO REMOVE SPECIFIC RECORDS
delete from student where  roll = 3

-- DIFFERENCE BETWEEN TRUNCATE AND DELETE
--truncate - drops the entire table and create back the entire table angain in background
--delete - delete data row by row

--truncate - 'where' commond can not be used with it
--delete - 'where' commond can be used

--truncate - DDL
--delete - DML

--truncate - faster
--delete - slower


--DROP THE COLUMN
alter table student1 drop column email

select * from student1

-- INTO
select roll, student_name into abc from student

select * from abc

--TEMPORARY TABLE  (LOCAL)
select roll, student_name into #abcd from student
select * from #abcd

--TEMPORARY TABLE  (global)
select roll, student_name into ##abcde from student
select * from ##abcde


-- DROP DATABASE
drop database campusx_class
create database khush
drop database khush

-- CREATING VARIABLES

-- declare the variable
declare @var int
-- set a value
set @var = 45
-- use it or show
select @var

-- another  way
declare @var int = 45
select @var


declare @salary decimal(10,2) = 1000000
declare @increment decimal(4,2) = 10
select @salary + (@salary*@increment/100) as 'new_salary'


--DATA TYPES
--1. NUMERIC DATA TYPES

-- INT  it stores only integer values (-2,14,74,83,648 to 2,14,74,83,648)
-- 4 bytes
declare @a int = 10000000000000    -- it  will give error
select @a


declare @a int = 1000000    -- it  will not give error
select @a

-- SMALL INT INTEGER ( -32,768 to 32,768)
-- 2 bytes

--TINYINT INTEGER (0,255)
--1 byte


--BIGINT
--to store very large numbers
-- 8 bytes
-- -9.8 quntillons to + 9.8 quntillons


-- DECIMAL(PRECISION, SCALE)/ NUMERIC(PRECISION , SCALE)
declare @price decimal(6,2) = 156.26
select @price

declare @price decimal(6,2) = 156.267256    -- it will round off the values after decimal
select @price

declare @price decimal(6,2) = 15456.264563     --- error
select @price

--(6,2) means to total 6 digits . means before decimal it can have 4 digits and after decimal it will have 2 digits only.
-- if more number of digits are there after decimal then it will round off upto 2 digits



-- FLOAT
-- fractional data
-- no limit
declare @price float = 1564589638.26256314789269
select @price


-- STRING
--ASCII CHARACTERs SET
--OLDEST, REPRESENT ONLY LIMITED VALUE
--128 CHARACTERS
--(A-Z), (a-z), (0-9), punctuations and control characters


--UNICODE CHARACTERS SET
--MODERN AND UNIVERSAL CHARACTER SET.
--EMOJIS, HINDI, CHINESE, ARABIC LANGUAGE , ETC
-- 1 MILLIONS CHARACTERS


--CHAR(N)
--stores fixed number of text
-- number of characters (1-8000)
-- no unicode , only ascii

-- varchar(N)
-- stores text, length is variable
-- no unicode, only ascii

-- text  --- only avaibale in mysql, depreciated from mssql
-- stores very very large values
-- no unicode, only ascii

-- nchar(N)
-- everything is same as char
-- includes accept values(1-4000)
-- accept unicode

-- nvarchar(n)
-- same as varchar
-- stores unicode 

-- ntext
-- same as text
-- depreciated from mssql
-- stores upto 2gb
-- stores unicode


create table names
(name varchar(50))

insert into names values
('हर्षित')            -- name won't be seen in dataset

select * from names

create table names1
(name nvarchar(50))

insert into names1 values
(N'हर्षित')

select * from names1

-- DATE AND TIME

-- DATE
-- stores only date (y,m,d)

-- DATETIME
-- stores dates and time (y, m, d, hrs, minutes, seconds, milliseconds)
-- stores upto 3 milli seconds

-- SMALL DATETIME
-- dates and time (date, time, hrs, minutes, seconds)

-- TIME
-- stores only time (hrs, minutes, seconds)

-------------------------------------------------------------------------------------------------------------------------

-- STORE PROCEDURE
-- it is like a function in python, once written, it can be used multiple times.

select * from ai_job_dataset
exec sp_rename 'ai_job_dataset', 'ai_jobs'

select * from ai_jobs

-- show average for per employment type
create procedure avg_salary_per_emp_type
as
begin
select  employment_type , avg(salary_usd) as 'avg_ salary' from ai_jobs group by employment_type
end


exec avg_salary_per_emp_type



-- SHOW AVERAGE SALARY FOR EACH EMPLOYNMENT TYPE  AS PER JOB TITLE.
CREATE PROCEDURE AVG_SALARY 
        @JOB_TITLe VARCHAR(50)
AS 
BEGIN 
   SELECT EMPLOYMENT_TYPE , AVG(SALARY_USD) AS SALARY FROM ai_jobs
   WHERE JOB_TITLE= @JOB_TITLe
   GROUP BY EMPLOYMENT_TYPE
END


exec AVG_SALARY 'AI Architect'



select *  from ai_jobs

-- FIND JOBS BY EDUCATION AND EXPERIENCE LEVEL,USER WILL ENTER EDUCATION,EXPERIENCE.
create procedure jobs_by_edu_exp 
       @edu varchar(100) , 
	   @exp smallint
as
begin
select job_title  from ai_jobs where education_required = @edu and years_experience = @exp
end


exec jobs_by_edu_exp 'master',7



select * from ai_jobs
-- TOP 3 INDUSTRIES BY COUNT OF JOB OPENING FOR GIVEN EXPERIENCE LEVEL
create or alter procedure top_industries
          @exp  smallint
as
begin
select top 3 industry, count(*) from ai_jobs where years_experience <= @exp 
group by industry order by count(*) desc
end


exec top_industries 5


select * from ai_jobs
-- show all the openings that are there for the skills provided by users(3)
create procedure skilljob
              @skill1 varchar(10),
			  @skill2 varchar(10),
			  @skill3 varchar(10)
as 
begin
	select * from ai_jobs where  
	required_skills like '%'+@skill1+'%'
	or required_skills like '%'+@skill2+'%'
	or required_skills like '%'+@skill3+'%'
end

exec skilljob 'python', 'powerbi','sql'

----------------------------------------------------------------------------------------------------------------
-- usecase of store procedure

CREATE TABLE Warehouse_Inventory (
    ProductID    INT PRIMARY KEY,
    ProductName  VARCHAR(100),
    Quantity     INT
);

INSERT INTO Warehouse_Inventory (ProductID, ProductName, Quantity) VALUES
(101, 'Levi Jeans', 100),
(102, 'Denim Jacket', 60),
(103, 'Cotton Shirt', 150),
(104, 'Sneakers', 80),
(105, 'Leather Belt', 40);



CREATE TABLE new_consignment (
    ProductID    INT,
    ProductName  VARCHAR(100),
    Quantity     INT
);


INSERT INTO new_consignment (ProductID, ProductName, Quantity) VALUES
(101, 'Levi Jeans', 25),       
(103, 'Cotton Shirt', 15),    
(106, 'Sports Cap', 50),       
(107, 'Woolen Scarf', 30),     
(104, 'Sneakers', 10);  



select * from Warehouse_Inventory
select * from new_consignment


--drop table Warehouse_Inventory
--drop table new_consignment


--update existing products

update w
set w.quantity = w.quantity + n.quantity from 
Warehouse_Inventory as w
inner join
new_consignment as n
on w.ProductID = n.ProductID


-- inserting new products
select n.* from Warehouse_Inventory as w
right join
new_consignment as n
on w.ProductID = n.ProductID
where w.ProductID is null

insert into Warehouse_Inventory
select n.* from Warehouse_Inventory as w
right join
new_consignment as n
on w.ProductID = n.ProductID
where w.ProductID is null



create procedure upsert
as 
begin 
	update w
set w.quantity = w.quantity + n.quantity from 
Warehouse_Inventory as w
inner join
new_consignment as n
on w.ProductID = n.ProductID

	insert into Warehouse_Inventory
select n.* from Warehouse_Inventory as w
right join
new_consignment as n
on w.ProductID = n.ProductID
where w.ProductID is null

END

EXEC UPSERT


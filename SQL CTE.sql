-- CTE  -- Common Table Expression

use campusx_class1

select * from student

-- find out the female students name who have marks greater than the 
-- avg marks of all students

with avg_marks as(
select * from student where marks >(select avg(marks) from student))
select sname from avg_marks where gender = 'f'



-- RECURSIVE CTE
-- it is special kind of cte that calls itself again and again untill and unless condition is satisfied

-- it has two parts
-- 1. Anchor part --- starting point
-- 2. Recursive part --- repetative part-- untill condition is satisfied
-- 3. by default 100 loops


-- generate numbers from 1-100
with number_cte as
( select 1 as num                     -- anchor part
  union all
  -- recursive part
  select num + 1 from  number_cte 
  where num <100
 )                     -- condition
select * from number_cte



with number_cte as
( select 1 as num                     -- anchor part
  union all
  -- recursive part
  select num + 1 from  number_cte 
  where num <1000
 )                     -- condition
select * from number_cte
option (maxrecursion 1000)


-- Total sales by year
create table sales
(product_id int,
period_start date,
period_end date,
average_daily_sales int)

insert into sales values
(1,'2019-01-25', '2019-02-28',100),
(2,'2018-12-01','2020-01-01',10),
(3,'2019-12-01', '2020-01-31',1)

select * from sales
-- step 1 --- find  max and min dates
-- step 2 --- generate all the dates between maximun and minimum dates
-- step 3 -- group by on the basis of years and product id

-- step 1
select min(period_start) as min_date , max(period_end) as max_date from sales

-- step 2 
with salesyear as
(
   select min(period_start) as dates, max(period_end) as max_date
   from sales
   union all
   select dateadd(day, 1, dates), max_date
   from salesyear
   where dateadd(day, 1, dates) <max_date
)
select year(dates), product_id, sum(average_daily_sales) as total_sales  from salesyear 
inner join
sales on dates between period_start and period_end
group by year(dates), product_id
option(maxrecursion 1000)


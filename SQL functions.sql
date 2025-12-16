use campusx_class1

-- FUNCTIONS
--A sql function is a build-in or user defined operation that accept zero or more input parameters,
--performs a computation, and return a single output value of a specific data type

-- In sql, functions are pre-defined or user defined toutines that performs
--specific operations on data and returns a result. functions are reusable,
--encapsuled piece of code that performs a specific task or calculations and return a value

-- DATE AND TIME FUNCTIONS
select getdate() --- return current date and time

select sysdatetime()  --  similar to datetime with more accuracy

select current_timestamp    --- ANSI function for the replacement of getdate()

select sysdatetimeoffset()

select datename(month, getdate())
select datename(weekday, getdate())
select datename(quarter, getdate())
select datename(year,getdate())
select datename(day,getdate())
select datename(week, getdate())
select datename(dayofyear, getdate())
select datename(minute, getdate())
select datename(hour, getdate())
select datename(second, getdate())


select year(getdate())
select month(getdate())
select day(getdate())


-- DATEADD
-- unit ------ year, month, day, hr, minutes
select dateadd(day, 20, getdate())
select dateadd(day, 20, getdate())
select dateadd(year, 2, getdate())
select dateadd(minute, 40, getdate())
select dateadd(HOUR, 4, getdate())

select dateadd(hour, -6, getdate())


-- DATEDIFF
select datediff(day, '2025-02-26', '2025-03-09')
select datediff(month, '2025-02-26', '2025-03-09')
select datediff(year, '2025-02-26', '2025-03-09')
select datediff(hour, '2025-02-26', '2025-03-09')
select datediff(minute, '2025-02-26', '2025-03-09')
select datediff(second, '2025-02-26', '2025-03-09')


-- EOMONTH()
select eomonth(getdate())

-- begining of month
select getdate() - day(getdate()) + 1

-- ISDATE()
select isdate('2026-03-25')         -- result 1 if in correct form otherwise 0


-- FORMAT
select format(getdate(),'dd-MM-yyy')
select format(getdate(),'dddd,dd-MM-yyy')
select format(getdate(), 'MMMM dd, yyyy') as fulldate   --December 14, 2025
select format(getdate(), 'ddd, MMM dd, yyyy') as AbbrDate   --select format(getdate(), 'MMMM dd, yyyy') as fulldate   --December 14, 2025
select format(getdate(), 'dddd, MMMM dd, yyyy') as FancyDate     ----Sunday, December 14, 2025

select format(getdate(), 'yyyy-MM-dd') as ISODate       ----2025-12-14
select format(getdate(), 'MM/dd/yyyy') as USDate         ---- 12/14/2025
select format(getdate(), 'dd-MM-yyyy') as IndianDate      --- 14-12-2025


use campusx_class1
create table orders1(
OrderID int primary key,
CustomerID int,
OrderDate datetime,
ShippedDate datetime,
Delivereddate datetime
)

INSERT INTO Orders1 VALUES
(101, 1, '2025-06-01 10:15:00', '2025-06-03 14:30:00', '2025-06-05 09:00:00'),
(102, 2, '2025-06-02 09:00:00', '2025-06-02 17:00:00', '2025-06-06 11:20:00'),
(103, 3, '2025-06-03 11:45:00', NULL, NULL),
(104, 1, '2025-06-04 15:20:00', '2025-06-05 10:00:00', '2025-06-07 16:45:00'),
(105, 4, '2025-06-05 08:00:00', '2025-06-06 09:00:00', '2025-06-06 18:30:00');

select * from orders1

--QUESTIONS
-- In how many days each order was delivered
select *, DATEDIFF(day, orderdate, delivereddate) as days from orders1 where Delivereddate is not null 



-- flag the orders that were delayed(deliverd in more than 3 days)
select orderid, DATEDIFF(day, orderdate, delivereddate) as days,
case 
    when  DATEDIFF(day, orderdate, delivereddate)> 3 then 'Delayed'
	else 'On Time'
end
from orders1 
where Delivereddate is not null 



-- classify the orders as morning, afternoon, evening or night
select  *,
 case
    when DATEPART(hour, delivereddate) between 5 and 11 then  'morning'
    when DATEPART(hour, delivereddate) between 12 and 16 then 'afternoon'
    when DATEPART(hour, delivereddate) between 17 and 20 then 'evening'
    else 'night'
 end as 'Time_slot'
from   orders1
where Delivereddate is not null




CREATE TABLE subscriptions (
    user_id INT PRIMARY KEY,
    name NVARCHAR(50),
    plan_start DATE,
    plan_end DATE,
    last_renewal DATETIME,
    is_active BIT
);


INSERT INTO subscriptions 
(user_id, name, plan_start, plan_end, last_renewal, is_active)
VALUES
(1, 'Alice',   '2024-01-01', '2025-01-01', '2025-01-01 09:00:00', 1),
(2, 'Bob',     '2023-06-01', '2024-06-01', '2024-05-31 23:55:00', 0),
(3, 'Charlie', '2024-10-15', '2025-10-15', '2024-10-15 00:00:00', 1),
(4, 'Diana',   '2024-07-01', '2025-07-01', '2024-12-01 08:15:00', 1),
(5, 'Ethan',   '2023-12-20', '2024-12-20', '2024-12-20 12:30:00', 1);


select * from subscriptions

--- QUESTIONS
-- IDENTIFY THE SUBSCRIPTIONS EXPIRING WITHIN THE NEXT 30 DAYS
select *  from subscriptions where DATEDIFF(day,getdate(),plan_end) between 1 and 30

-- how many days since last rewal for each user
select *, DATEDIFF(day, last_renewal, getdate()) from subscriptions

--users who renewed at midnight
select * from subscriptions
where datepart(minute,last_renewal) =0 
and
datepart(hour, last_renewal) = 0





--- interview question
CREATE TABLE SupportTickets (
    TicketID INT PRIMARY KEY,
    OpenedAt DATETIME,
    ClosedAt DATETIME
);


INSERT INTO SupportTickets VALUES
(201, '2025-06-10 16:30:00', '2025-06-11 10:15:00'),
(202, '2025-06-11 09:00:00', '2025-06-11 17:30:00'),
(203, '2025-06-12 17:00:00', '2025-06-13 11:00:00'),
(204, '2025-06-13 08:45:00', '2025-06-13 12:15:00');


select * from SupportTickets
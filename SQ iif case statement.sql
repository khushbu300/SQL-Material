-- iif
-- it evaluates the expression and generate boolean value
-- based on the boolean value it perform the desired action


use campusx_class1

select * from ai_jobs

-- if salary is greater than 1lakh, print high paying else low paying
select job_id, salary_usd,
iif (salary_usd > 100000, 'High Paying', 'Low Paying')
from ai_jobs


select * from STUDENT

--100-90--a
--90-80--b
--80-70--c
--70-60--d

select *, iif(marks >=90, 'A',
               iif(marks >= 80, 'B',
			         iif(marks >= 70, 'C',
					     iif(marks >= 60,'D', 'F')))) as 'Grade'
from student

--CASE
select *,
	case
		when marks >=90 then 'A'
		when marks >= 80 then 'B'
		when marks >=70 then 'C'
		when marks >= 60 then 'D'
		else 'F'
	end 
	as grade
from student



-- iif/case --- are used when you want to return a value based on a condition

-- if --- execute set of commands based on condition

select * from ai_jobs

-- if currency is EUR - give 10% increment, for GBP give 20% increment, for USD give 30% increment

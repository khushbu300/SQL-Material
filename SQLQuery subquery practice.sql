CREATE TABLE Employee_Training (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id VARCHAR(10)
);


INSERT INTO Employee_Training (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 'D1'),
(102, 'Bob', 'D1'),
(103, 'Carol', 'D2'),
(104, 'David', 'D2'),
(105, 'Eva', 'D1'),
(106, 'Faisal', 'D3'),
(107, 'Gita', 'D3'),
(108, 'Hema', 'D3');


CREATE TABLE Training_Score (
    emp_id INT,
    score INT,
);

INSERT INTO Training_Score (emp_id, score) VALUES
(101, 85),
(102, 92),
(103, 88),
(104, 91),
(105, 92),
(106, 80),
(107, 95),
(108, 95);

select * from Employee_Training
select * from Training_Score


-- show details of employee who scored maximum
select emp_name from Employee_Training where emp_id in

(select emp_id from Training_Score where score =
  (select max(score) from Training_Score)

)

use campusx_class1

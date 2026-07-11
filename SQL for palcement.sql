
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- creating DATABASE :----

create database practice_db;
show databases;
 use practice_db;
 
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- creating table :---

 create table Employees(
	emp_id int  primary key,
    emp_name varchar(50),
    age int,
    city varchar(50),
    salary int,
    dept_id int
    );
    
    
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-- creating table :---
	
 create table Department1(
	dept_id int primary key,
    dept_name varchar(50)
    );
    
INSERT INTO Department1 VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');

INSERT INTO Employees VALUES
(101,'Alice',24,'Bangalore',45000,2),
(102,'Bob',30,'Mysore',60000,2),
(103,'Charlie',28,'Bangalore',50000,1),
(104,'David',35,'Delhi',70000,3),
(105,'Eva',27,'Mumbai',65000,2),
(106,'Frank',29,'Delhi',48000,4),
(107,'Grace',31,'Mumbai',55000,1),
(108,'Harry',26,'Bangalore',52000,3);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

                                               -- 1. SELECT (SELECT is used to retrieve data from a table.)


select*from Employees;
select*from Department1;


SELECT * FROM Employees;

SELECT emp_name,salary
FROM Employees;


select age 
from Employees;

SELECT age, emp_name
FROM Employees;

select emp_name from Employees;

insert into  Employees 
values (23,"kiran s",22,"mangaluru",500000,4);

select*from Employees;

INSERT INTO Employees
VALUES (111, 'Priya', 27, 'null', 62000,8);


select*from employees 
where emp_id=111;


INSERT INTO Employees (emp_id, emp_name, age, city, salary, dept_id)
VALUES (112, 'Rahul', 24, 'Delhi', 48000, 3);



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 


                                       -- 2)  WHERE (WHERE filters records,Show only rows that satisfy a condition.)


select * from Employees
where salary >50000; 
 
 
 select* from Employees
 where city='mysore';
 
 select * from Employees 
 where age < 50;


select * from Employees 
 where age < 23;

select * from Employees 
where emp_id=111;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

                                                                        -----  3)  ORDERBY 

															-- Ascending(normally it should be ascending  )
                                                            -- Decending( we want to  use DESC )

select * from Employees 
ORDER BY salary ;


select * from employees
order by dept_id;

select  *from employees 
order by age,salary; 




-- Decending( we want to  use DESC )

select*from Employees 
order by salary DESC;

select * from Employees
order by age desc;
       
select * from Employees
order by emp_name desc;

select * from Employees
order by dept_id desc;


select  *from employees 
order  by emp_id desc;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

                                                 -- 4) GROUP BY (Groups rows having the same value.Mostly used with aggregate functions.)



SELECT emp_id,
SUM(salary)
FROM employees
GROUP BY emp_id;

SELECT dept_id,
SUM(salary)
FROM employees
GROUP BY dept_id;

select * from employees;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 


                                                               -- 5) HAVING (filters groups after GROUP BY)
      
                                                                                       --  WHERE filters rows before grouping.
																						-- HAVING filters groups after grouping.
   
   
   select emp_id,
   sum(salary)
   from employees 
   group by emp_id
   having sum(salary)>50000;
   
   
   select emp_id,
   sum(salary)
   from employees 
   group by emp_id
   having sum(salary)<50000;
   
   

select* from employees;

SELECT dept_id,
SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id
HAVING SUM(salary) > 100000;

select dept_id,
COUNT(*) AS total_employees
from employees
GROUP BY dept_id
HAVING count(*)>2;


select city,
COUNT(*) AS employee_count
from employees
GROUP BY city
HAVING count(*)>2;

SELECT dept_id,
SUM(salary) AS total_salary
FROM Employees
WHERE salary > 50000
GROUP BY dept_id
HAVING SUM(salary) > 120000;

SELECT dept_id,
AVG(age) AS average_age
FROM Employees
GROUP BY dept_id
HAVING AVG(age) > 27;



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 


                                                 -- 6. JOINS (Joins combine data from two or more tables using a common column.)

                                                           -- 1. INNER JOIN  (Returns only matching rows./ The INNER JOIN clause returns only rows that have matching values in both tables.)
														   -- 2. LEFT JOIN ( All rows from LEFT table .Matching rows from RIGHT table)
                                                           -- 3. RIGHT JOIN ( Opposite of LEFT JOIN.Returns All rows from RIGHT table Matching rows from LEFT table.)




-- 1. INNER JOIN  (Returns only matching rows./ The INNER JOIN clause returns only rows that have matching values in both tables.)

SELECT e.emp_name,
d.dept_name
FROM Employees e
INNER JOIN Department1 d
ON e.dept_id = d.dept_id;
       


-- 2. LEFT JOIN ( All rows from LEFT table .Matching rows from RIGHT table)

SELECT e.emp_id,
       e.emp_name,
       d.dept_name
FROM Employees e
LEFT JOIN Department1 d
ON e.dept_id = d.dept_id;

SELECT d.dept_id,
       d.dept_name,
       e.emp_name
FROM Department1 d
LEFT JOIN Employees e
ON d.dept_id = e.dept_id;




SELECT e.emp_name,
       e.dept_id
FROM Employees e
LEFT JOIN Department1 d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- 3. RIGHT JOIN ( Opposite of LEFT JOIN.Returns All rows from RIGHT table Matching rows from LEFT table.)

SELECT d.dept_id,
       d.dept_name,
       e.emp_name
FROM Employees e
RIGHT JOIN Department1 d
ON e.dept_id = d.dept_id;


INSERT INTO Department1
VALUES (5,'Sales');

SELECT d.dept_id,
       d.dept_name,
       e.emp_name
FROM Employees e
RIGHT JOIN Department1 d
ON e.dept_id = d.dept_id;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


                                                              -- 10. Subquery (A query inside another query.)


SELECT emp_name
FROM Employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
);



SELECT emp_name
FROM Employees
WHERE salary <
(
    SELECT AVG(salary)
    FROM Employees
);


SELECT emp_name, salary
FROM Employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employees
);



      
         -- second_highest_salary
        
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employees
);



       -- third_highest_salary
       
SELECT MAX(salary) AS third_highest_salary
FROM Employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Employees
    )
);

SELECT emp_name, salary
FROM Employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Employees
        WHERE salary <
        (
            SELECT MAX(salary)
            FROM Employees
        )
    )
);


    --  fourth_highest_salary
SELECT MAX(salary) AS fourth_highest_salary
FROM Employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Employees
        WHERE salary <
        (
            SELECT MAX(salary)
            FROM Employees
        )
    )
);

-- (OR)

SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 3,1;


      --  fifth_highest_salary
      
      
SELECT MAX(salary) AS fifth_highest_salary
FROM Employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Employees
        WHERE salary <
        (
            SELECT MAX(salary)
            FROM Employees
            WHERE salary <
            (
                SELECT MAX(salary)
                FROM Employees
            )
        )
    )
    
);



-- "Find the Nth highest salary."  
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 9,1;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 										 Aggregate Functions:---

-- 											COUNT()
-- 											SUM()
-- 											AVG()
-- 											MAX()
-- 											MIN()

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                      -- 11. COUNT()   (The COUNT() function returns the number of rows that matches a specified criterion.)
                
                                                           --   COUNT(*) - Counts the total number of rows in a table (including NULL values).
			                                                 -- COUNT(columnname) - Counts all non-null values in the column.
		                                             -- 		COUNT(DISTINCT columnname) - Counts only the unique, non-null values in the colum




SELECT COUNT(*)
FROM Employees;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


                                      -- 12. SUM()  (function is used to calculate the total sum of values within a numeric column.)
                               
                                                 --     The SUM() function ignores NULL values in the column.
                           
                           
SELECT SUM(Salary)
FROM Employees;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SALES TABLE

CREATE TABLE Sales(
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO Sales VALUES
(1,'Laptop',2,50000),
(2,'Mouse',5,500),
(3,'Keyboard',3,1000),
(4,'Monitor',2,15000);

select * from sales;


				
-- Calculate total sales amount.
                
SELECT SUM(quantity * price) AS total_sales
FROM Sales;


-- Calculate total sales for each product.
                
SELECT product_name,
       SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name;


	-- Calculate total sales greater than ₹20,000.
            
SELECT product_name,
       SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name
HAVING SUM(quantity * price) > 20000;



	-- Find the product with the highest sales.

SELECT product_name,
       SUM(quantity * price) AS total_sales
FROM Sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 1;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


                                  -- 13) AVG() [Calculates average./The AVG() function returns the average value of a numeric column.]
                                                 --   The AVG() function ignores NULL values in the column.
                                                   -- AVG() is an Aggregate Function that returns the average (mean) value of a numeric column.
     
     
SELECT AVG(Salary)
FROM Employees;


SELECT AVG(quantity * price) AS average_sales
FROM Sales;

select * from sales;




-- Find the average age
SELECT AVG(age) AS average_age
FROM Employees;



-- Find the average salary department-wise
SELECT dept_id,
       AVG(salary) AS average_salary
FROM Employees
GROUP BY dept_id;
  
  
  
  
-- Average salary of employees older than 25

select avg(salary) as average_salary
from employees
where age>25;

--  Average salary of employees in the IT department

select avg(salary) as average_salary
from employees
where dept_id = 2 ; 


--   Average salary of employees in Bangalore
  
SELECT AVG(salary) AS average_salary
FROM Employees
WHERE city = 'Bangalore';

use practice_db;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                                       -- MAX() [Returns highest value.]
                                                                  -- The MAX() function returns the largest value of the selected column.
																--  The MAX() function works with numeric, string, and date data types. 
  
  
  
--   Find the highest salary      
select max(salary)
from employees;

SELECT MAX(salary) AS highest_salary
FROM Employees;



  --  Find the oldest employee's age
  
SELECT MAX(age) AS oldest_employee
FROM Employees;



-- . Find the highest employee ID

SELECT MAX(emp_id) AS highest_emp_id
FROM Employees;



--  Find the highest salary in the IT department

select max(salary) as highest_salary
from employees
where dept_id =2;

select max(salary) as highest_salary
from employees
where dept_id =1;

select max(salary) as highest_salary
from employees
where dept_id =3;


-- Find the highest salary in Bangalore

select max(salary) as higest_salary 
from employees 
where city ='bangalore';

select * from employees;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


											-- 15. MIN() [Returns lowest value.]

														--  The MIN() function returns the smallest value of the selected column.

														-- The MIN() function works with numeric, string, and date data types. 
        
    
    
-- find the lowest salary by using min()
    
select min(salary) 
from employees;

SELECT MIN(salary) AS minimum_salary
FROM Employees;

select min(salary) as lowest_salary
from employees
where city ='bangalore';



-- Find the youngest employee's age

select min(age) as lowest_age
from employees;



-- . Find the youngest employee (Subquery)

SELECT emp_name, age
FROM Employees
WHERE age =
(
    SELECT MIN(age)
    FROM Employees
);


SELECT emp_name, salary
FROM Employees
ORDER BY salary ASC
LIMIT 1;



-- youngest employees in the table 

SELECT emp_name, age
FROM Employees
order by age asc
limit 1;



-- Find the minimum salary in the IT department

SELECT MIN(salary) AS minimum_salary
FROM Employees
WHERE dept_id = 2;



SELECT dept_id,
       MIN(salary) AS minimum_salary
FROM Employees
GROUP BY dept_id;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

																	 -- Window Functions (Basic)

                          --      A window function performs calculations across a set of rows without grouping them into one row. Unlike GROUP BY, it keeps every original row in the result.  (OR)

                          --        A Window Function performs calculations across a set of rows without grouping them into a single row. Unlike GROUP BY, it does not reduce the number of rows.

                          --        One of the most common window functions is ROW_NUMBER().




-- 1. ROW_NUMBER() [Assigns a unique number to every row.]

SELECT emp_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM Employees;


-- 2. RANK() [Employees with the same salary receive the same rank, but the next rank is skipped.]



SELECT emp_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS rank_no
FROM Employees;




-- 3. DENSE_RANK() [Like RANK(), but it doesn't skip numbers.]

                 -- PostgreSQL / Oracle / MySQL: Use double quotes: "dense_rank"
                 -- SQL Server (T-SQL): Use square brackets: [dense_rank]


SELECT emp_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS "dense_rank"
FROM Employees;


--  Find the highest-paid employee

SELECT *                -- using subquerry
FROM
(
    SELECT emp_name,
           salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 1;


(or)

                            -- NOTE:---
SELECT emp_name,           -- The QUALIFY clause is not working because it is not supported in MySQL.
       salary,             --  The QUALIFY clause is supported in certain databases, such as:  Snowflake,BigQuery,Teradata
       DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
FROM Employees
QUALIFY rnk = 1;

(or)

SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 1;



 -- Find the second highest-paid employee


SELECT *
FROM
(
    SELECT emp_name,
           salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 2;

(or)

SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 2;



 -- Find the third highest-paid employee


SELECT *
FROM
(
    SELECT emp_name,
           salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 3;

(or)

SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;



--  Rank employees within each department

SELECT emp_name,
       dept_id,  -- Each department starts ranking from 1.
       salary,
       RANK() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank
FROM Employees;  
               



 -- Row number within each department
 
SELECT emp_name,
       dept_id,
       ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS row_no
FROM Employees;




--  Highest-paid employee in each department

SELECT *
FROM
(
    SELECT emp_name,
           dept_id,
           salary,
           ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS rn
    FROM Employees
) t
WHERE rn = 1;

--  Lowest-paid employee in each department

SELECT *
FROM
(
    SELECT emp_name,
           dept_id,
           salary,
           ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary ASC) AS rn
    FROM Employees
) t
WHERE rn = 1;


-- Running total of salaries

SELECT emp_name,
       salary,
       SUM(salary) OVER(ORDER BY emp_id) AS running_total
FROM Employees;


-- Average salary of all employees shown on every row

SELECT emp_name,
       salary,
       AVG(salary) OVER() AS average_salary
FROM Employees;



--  Maximum salary shown on every row

SELECT emp_name,
       salary,
       MAX(salary) OVER() AS highest_salary
FROM Employees;


-- Minimum salary shown on every row

SELECT emp_name,
       salary,
       MIN(salary) OVER() AS lowest_salary
FROM Employees;


-- Department-wise average salary

SELECT emp_name,
       dept_id,
       salary,
       AVG(salary) OVER(PARTITION BY dept_id) AS dept_average
FROM Employees;






create database practice_db;
show databases;
 use practice_db;
 
 
 create table Employees(
	emp_id int  primary key,
    emp_name varchar(50),
    age int,
    city varchar(50),
    salary int,
    dept_id int
    );
    

	
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


-- ---- WHERE (WHERE filters records,Show only rows that satisfy a condition.)

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


----- ORDERBY 

----- Ascending(normally it should be ascending  )

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


-- 6. JOINS (Joins combine data from two or more tables using a common column.)

       -- 1. INNER JOIN  (Returns only matching rows./ The INNER JOIN clause returns only rows that have matching values in both tables.)


SELECT e.emp_name,
d.dept_name
FROM Employees e
INNER JOIN Department1 d
ON e.dept_id = d.dept_id;
       


-- 2. LEFT JOIN ( All rows from LEFT table .Matching rows from RIGHT table)















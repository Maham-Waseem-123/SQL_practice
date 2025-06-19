show databases;
use practice_sql;
show tables;

-- Write a query to find the department where the highest salary is paid.

select * from employees;
select dept from employees where salary = (select Max(salary) from employees);

-- How can you find the name of the employee who earns the maximum salary?
Select * from employees;
select emp_name from employees where salary = (select max(salary)from employees);

-- Write a query to display the employees who earn less than the average salary.
select * from employees;
select emp_name from employees where salary > (select round(avg(salary),1) from employees);

-- How can you insert records 
-- from the products table to the orders table where the selling price is greater than 1000?
Select * from orders;
insert into orders (product_id, p_name,sell_price) select * from products where sell_price > 1000; 

-- Write a query to increase the salary by 35% for employees whose age 
-- is greater than 27 (based on another table).
Select * from employees;
SET SQL_SAFE_UPDATES = 0;

update employees
set salary = 1.35 
where age in (select age from (select age from employees_b where age > 27)AS temp);


-- Delete

Delete from employees
where age in (Select age from employees_b where age> 27);
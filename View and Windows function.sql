-- Practice View and Windows function 

-- How can you create a view named cust_details that shows the customer_name, phone, and city from the customers table?

show tables;
select * from customers;
create view  cust_details_1
as select customer_name, phone, city from customers;

-- How do you display all data from the cust_details view?
Select * from cust_details_1;

-- How do you rename a table from old_name to new_name?

Rename table cust_details_1 to cust_details_2;

Select * from cust_details_2;

-- How can you list all tables that are views in your database?

SHOW FULL TABLES WHERE Table_type = 'VIEW';

-- Using Window Functions - SUM with PARTITION
-- How can you calculate the total salary per department using a window function?

Select * from employees;
Select emp_name, age, sum(salary) over ( partition by dept) as total_salary 
from employees;

-- Using ROW_NUMBER() for Ranking
-- Question: How do you assign a row number to employees based on their salary in ascending order?
Select * from employees;
Select row_number() over ( order by salary), emp_name, dept from employees order by Salary;

-- Detecting Duplicate Values Using ROW_NUMBER()
-- Question:
-- How can you detect duplicate entries in a demo table based on st_id and st_name?
select * from demo;
Select row_number () over ( Partition by st_id, st_name Order by st_id) as Dup_no , st_id, St_name from demo;

-- Using FIRST_VALUE() to Get Highest Salary Name
-- How do you retrieve the employee name with the highest salary 
-- in the entire employees table using a window function?
Select * from employees;
Select first_value(emp_name) over ( order by Salary desc) as highest_salary_name from employees;

-- How do you get the name of the highest-paid employee in each department?
Select First_value(emp_name) over (partition by dept order by salary desc) as highest_employees, dept from employees;
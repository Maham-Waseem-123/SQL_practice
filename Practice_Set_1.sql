-- Showing the structure of a table 
-- Q1: Use a command to display the structure of the employees table?
show databases;
use sql_intro;
show tables;
SELECT 
    *
FROM
    employee_details;
describe employee_details;
-- •	Q2: How can you find the datatype of the salary column in the staff table?
-- It is float as per the above screen shot. 
-- 2. Creating databases
-- •	Q1: Write a query to create a database named CompanyRecords.
Create database CompanyRecords;
-- •	Q2: Create a new database for a hospital management system named HospitalDB.
Create database HospitalDB;
-- 3. Creating tables
-- Write an SQL statement to create a table Students with columns ID, Name, and Age.
Create database Students;
Use Students;
Create table Students (ID varchar(25), Name Varchar(25), Age int);
-- •	Q2: Create a table Orders with OrderID (int), CustomerName (varchar), and OrderDate (date).
Create database Orders;
Create table Order_1 (OrderID int, CustomerName varchar (25), OrderDate date);

-- Inserting values in the table
-- •	Q1: Insert a record into the Employees table with values: ID = 101, Name = "John", Age = 35, Salary = 50000.

Create database Employee_pract;
Use Employee_Pract;
Create Table Employee_Practice( ID int, Name varchar(25), Age int, Salary float);
insert into Employee_Practice values (101, "John", 35, 50000);
select * from employee_Practice;

-- •	Q2: Insert a new customer with ID = 5, Name = "Alice", and City = "New York" into the Customers table.
Show databases;
Use Orders;
Create table new_customer( ID int, Name varchar(25), City varchar(25));
Insert into new_customer values(5, "Alice", "New York");
Select * from new_customer;

-- 5. Seeing unique values
-- •	Q1: Write a query to display all unique cities from the Employees table.

show databases;
Use sql_intro;
Show tables;
select * from employee_details;
Select distinct(city) as unique_city from employee_details;

-- Count the number of unique departments in the Employees table.
Select count(distinct(city)) as count_unique_employee from employee_details;

-- Selecting total and average salaries

-- Write a query to find the total salary of all employees.

select * from employee_details;
Select  sum( Salary) as Total_salary from employee_details;

-- Write a query to calculate the average salary of employees in the Finance department.

Select City, avg(salary) from employee_details group by City;

-- Seeing selected columns only
-- Retrieve the ID and Salary columns from the Employees table.

select * from employee_details;
Select name, Age, Sex from employee_details;

-- Using WHERE with conditions
-- Show all employees older than 30 years.

select * from employee_details where age> 30;

-- Display all female employees from the Staff table.

Select * from employee_details where sex = "F";

-- Using IN for multiple options
-- List all employees who live in either 'Chicago' or 'Austin'.

Select * from employee_details where city in ('Chicago', 'Pakistan');

-- Using BETWEEN
-- List employees whose salaries are between 40000 and 70000.

select * from employee_details where salary between '40000' and '70000';

-- Show orders placed between '2024-01-01' and '2024-12-31'.

Select * from employee_details where DOJ between '2024-01-01' and '2024-12-31';

-- Setting multiple conditions
-- Show employees with salary > 50000 AND age < 40.

Select * from employee_details where salary > 50000 and age<40;

-- ORDER BY command
-- List employees ordered by salary in descending order.

Select * from employee_details order by salary desc;

-- Basic SQL Operators
-- •	Q1: Find employees with salary != 60000.

Select * from employee_details where salary!= 60000;

-- In-built SQL functions:
-- . Length
-- •	Q1: Show the length of each employee's name.

Select name, length(name) from employee_details;

-- •	Q2: Retrieve names where the name length is greater than 5.

select name, length(name) from employee_details where length(name) > 5;

-- Repeat
-- •	Q1: Use REPEAT to repeat the word “Hello” 3 times.

Select repeat("hello", 3) as hello;

-- •	Q2: Repeat each employee’s name twice

Select name, repeat(name, 2) as repeat_name from employee_details;

-- UPPER
-- Convert all employee names to uppercase.

Select name, upper(name) from employee_details;

-- Convert all customer names to lowercase.

Select name, lcase(name) from employee_details;

-- Date and Time functions
-- : Show today’s date using SQL.

select curdate();

-- Insert the current date into an Orders table.

Select * from employee_details;
Alter Table employee_details
add  todays_date date;
Select * from employee_details;

insert into employee_details values('Horia', '55', 'F', '2002-05-12', 'Pakistan', 60000, curdate());
Select * from employee_details;

-- Display the current day name (like Monday).

Select dayname(curdate());

-- Show employees hired on the current day.

select name, DOJ from employee_details where DOJ = curdate();

-- Retrieve the current system time.
select now();

-- CONCAT
-- Concatenate first name and last name of employees

select name, DOJ, concat(name," ", DOJ) from employee_details ;

-- Add a prefix “Mr./Ms.” before each employee name.
Select name, concat(case when sex='M' then 'MR.' when sex ='F' then 'Ms.' else ' ' end, name) as prefixed_name from employee_details;

-- REPLACE
-- Replace all occurrences of "Manager" with "Lead" in the job titles.

alter table employee_details
Add job_title varchar(25);

INSERT INTO employee_details VALUES ('Horia', 55, 'F', '2002-05-12', 'Pakistan', 60000, CURDATE(), 'Manager');
INSERT INTO employee_details VALUES ('Ali', 30, 'M', '2015-08-10', 'Karachi', 45000, CURDATE(), 'Developer');
INSERT INTO employee_details VALUES ('Sara', 28, 'F', '2018-03-22', 'Lahore', 52000, CURDATE(), 'Analyst');
INSERT INTO employee_details VALUES ('Zaid', 40, 'M', '2010-11-01', 'Islamabad', 67000, CURDATE(), 'Team Lead');
INSERT INTO employee_details VALUES ('Noor', 25, 'F', '2020-07-15', 'Multan', 41000, CURDATE(), 'HR Executive');
INSERT INTO employee_details VALUES ('Imran', 35, 'M', '2012-12-01', 'Rawalpindi', 56000, CURDATE(), 'Project Manager');
INSERT INTO employee_details VALUES ('Maham', 29, 'F', '2016-09-05', 'Faisalabad', 49000, CURDATE(), 'Software Engineer');
INSERT INTO employee_details VALUES ('Bilal', 32, 'M', '2014-02-17', 'Hyderabad', 53000, CURDATE(), 'QA Engineer');
INSERT INTO employee_details VALUES ('Hina', 27, 'F', '2019-06-25', 'Sialkot', 47000, CURDATE(), 'Designer');
INSERT INTO employee_details VALUES ('Asad', 38, 'M', '2008-04-19', 'Quetta', 68000, CURDATE(), 'Operations Manager');

-- Replace all occurrences of "Manager" with "Lead" in the job titles.

select name, job_title, replace(job_title, 'Manager', 'Lead') as replaced_job_details from employee_details;

-- POSITION
-- Find the position of 'a' in each employee’s name.

SELECT 
    name, POSITION('a' IN name) AS position_name
FROM
    employee_details;




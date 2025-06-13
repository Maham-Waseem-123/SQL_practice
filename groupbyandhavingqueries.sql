-- 1. Create the database
CREATE DATABASE IF NOT EXISTS companyDB;
USE companyDB;

-- 2. Create the employee_Details_2 table
CREATE TABLE employee_Details_2 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(50),
    salary DECIMAL(10, 2),
    joining_date DATE,
    city VARCHAR(50)
);

-- 3. Insert 20 sample records
INSERT INTO employee_Details_2 (name, department, designation, salary, joining_date, city) VALUES
('Ali Khan', 'IT', 'Software Engineer', 85000.00, '2022-01-15', 'Lahore'),
('Sara Ahmed', 'HR', 'HR Manager', 92000.00, '2021-03-01', 'Karachi'),
('Zara Ali', 'Finance', 'Accountant', 60000.00, '2020-07-20', 'Islamabad'),
('Umer Shah', 'IT', 'System Analyst', 78000.00, '2022-05-10', 'Lahore'),
('Fahad Malik', 'IT', 'Network Engineer', 70000.00, '2023-02-18', 'Multan'),
('Hina Rizvi', 'Marketing', 'Marketing Manager', 95000.00, '2019-09-12', 'Karachi'),
('Osama Raza', 'Finance', 'Auditor', 65000.00, '2020-11-22', 'Islamabad'),
('Komal Fatima', 'IT', 'Web Developer', 72000.00, '2023-04-05', 'Lahore'),
('Bilal Saeed', 'HR', 'Recruiter', 58000.00, '2022-06-15', 'Rawalpindi'),
('Nida Shahid', 'Finance', 'Financial Analyst', 87000.00, '2021-12-01', 'Lahore'),
('Danish Khan', 'IT', 'Mobile App Developer', 80000.00, '2021-01-10', 'Faisalabad'),
('Maryam Noor', 'Marketing', 'Content Strategist', 67000.00, '2020-10-05', 'Lahore'),
('Imran Bashir', 'HR', 'Payroll Officer', 62000.00, '2022-08-11', 'Karachi'),
('Sana Javed', 'IT', 'UI/UX Designer', 76000.00, '2023-03-25', 'Islamabad'),
('Adeel Hassan', 'Marketing', 'SEO Specialist', 63000.00, '2021-11-09', 'Lahore'),
('Mehwish Iqbal', 'Finance', 'Tax Consultant', 69000.00, '2020-06-14', 'Rawalpindi'),
('Waleed Akhtar', 'IT', 'DevOps Engineer', 87000.00, '2023-01-01', 'Karachi'),
('Ayesha Tariq', 'HR', 'HR Executive', 61000.00, '2021-05-17', 'Lahore'),
('Raheel Aslam', 'Finance', 'Budget Analyst', 71000.00, '2020-09-30', 'Multan'),
('Farah Zubair', 'Marketing', 'Digital Marketer', 68000.00, '2022-07-21', 'Islamabad');

Select * from employee_Details_2;

-- Retrieve the average salary for each department from the employee_Details_2 table.
Select department, avg(salary) as average_salary from employee_Details_2 group by department;

create table employee(Emp_ID int primary key, name varchar(25), age int, dept varchar(25), DOJ date);

INSERT INTO employee (Emp_ID, name, age, dept, DOJ) VALUES
(1, 'Ali Khan', 28, 'IT', '2022-01-15'),
(2, 'Sara Ahmed', 35, 'HR', '2020-05-10'),
(3, 'Umer Shah', 30, 'Finance', '2021-08-01'),
(4, 'Zara Ali', 26, 'IT', '2023-03-20'),
(5, 'Osama Raza', 32, 'Marketing', '2019-11-05'),
(6, 'Komal Fatima', 27, 'Finance', '2022-07-14'),
(7, 'Fahad Malik', 29, 'IT', '2021-02-22'),
(8, 'Nida Shahid', 34, 'HR', '2020-12-19'),
(9, 'Waleed Akhtar', 31, 'Marketing', '2018-06-30'),
(10, 'Maryam Noor', 25, 'Finance', '2023-04-11'),
(11, 'Danish Khan', 33, 'IT', '2019-10-01'),
(12, 'Mehwish Iqbal', 30, 'HR', '2021-06-17'),
(13, 'Adeel Hassan', 28, 'Marketing', '2022-09-25'),
(14, 'Sana Javed', 27, 'IT', '2023-01-03'),
(15, 'Imran Bashir', 36, 'Finance', '2020-03-05'),
(16, 'Ayesha Tariq', 29, 'HR', '2022-08-20'),
(17, 'Raheel Aslam', 32, 'Marketing', '2021-05-29'),
(18, 'Farah Zubair', 26, 'IT', '2023-02-14'),
(19, 'Bilal Saeed', 34, 'Finance', '2019-12-08'),
(20, 'Hina Rizvi', 31, 'HR', '2020-07-23');

-- Average age of employee in each department with round variable 

Select * from employee;
Select dept, Round(avg(age),1) as avg_age from employee group by dept;


-- Find total employees in each department

Select * from employee;
Select dept, count(Emp_ID) from employee group by dept;

-- Order by employee_ID Descending order 
Select * from employee;
Select dept, count(Emp_ID) from employee group by dept order by count(Emp_ID) desc;

-- Find the number of employees joined the company each year we can use the year function
-- on the date of joining column count the employee_ID and then group result by each year

Select * from employee;

Select year(DOJ), count(Emp_ID) from employee group by year(DOJ) order by count(Emp_ID) desc;


--
Alter table employee
Add city Varchar(25);
Select * from employee;

INSERT INTO employee (Emp_ID, name, age, dept, DOJ, city) VALUES
(21, 'Zain Ul Abidin', 29, 'IT', '2022-06-01', 'Lahore'),
(22, 'Amna Tariq', 33, 'HR', '2020-03-11', 'Karachi'),
(23, 'Noman Iqbal', 31, 'Finance', '2021-10-21', 'Islamabad'),
(24, 'Emaan Shah', 26, 'Marketing', '2023-01-30', 'Lahore'),
(25, 'Haroon Rasheed', 35, 'IT', '2018-09-05', 'Multan'),
(26, 'Rubab Fatima', 27, 'HR', '2022-11-15', 'Rawalpindi'),
(27, 'Jawad Khan', 30, 'Finance', '2020-08-28', 'Peshawar'),
(28, 'Tania Malik', 29, 'IT', '2023-04-04', 'Karachi'),
(29, 'Shoaib Nasir', 34, 'Marketing', '2019-05-07', 'Lahore'),
(30, 'Irum Zahra', 28, 'Finance', '2021-02-02', 'Quetta'),
(31, 'Kamran Javed', 32, 'HR', '2020-10-10', 'Islamabad'),
(32, 'Lubna Noor', 25, 'Marketing', '2023-03-17', 'Multan'),
(33, 'Adil Ahmed', 31, 'Finance', '2021-07-14', 'Rawalpindi'),
(34, 'Areeba Sultan', 27, 'IT', '2022-01-09', 'Faisalabad'),
(35, 'Hassan Raza', 30, 'HR', '2020-05-27', 'Sialkot'),
(36, 'Sundas Zehra', 33, 'Marketing', '2019-12-12', 'Lahore'),
(37, 'Ibrahim Qureshi', 26, 'IT', '2023-02-25', 'Karachi'),
(38, 'Kiran Bano', 29, 'Finance', '2021-06-30', 'Hyderabad'),
(39, 'Wasiq Mehmood', 35, 'HR', '2018-03-14', 'Islamabad'),
(40, 'Naima Hussain', 28, 'Marketing', '2022-08-08', 'Bahawalpur');
Select * from employee;
Show databases;
use companydb;
show tables;

-- find cities where there are more than 2 employees?

select * from employee;
Select city, count(Emp_ID) from employee group by city having count(Emp_ID)>2;


-- Departments where average salaries is greater than 75000

Select * from employee;
Alter Table Employee
Add Salary float;

Select * from employee;

INSERT INTO employee VALUES
(41, 'Usman Rafiq', 28, 'IT', '2022-05-01', 'Lahore', 82000.00),
(42, 'Nashit Amin', 31, 'Finance', '2021-04-15', 'Islamabad', 79000.00),
(43, 'Zoya Abbas', 26, 'HR', '2023-03-10', 'Karachi', 73000.00),
(44, 'Hassan Iqbal', 34, 'Marketing', '2020-09-25', 'Rawalpindi', 71000.00),
(45, 'Saba Waheed', 29, 'IT', '2021-07-12', 'Lahore', 86000.00),
(46, 'Omar Khalid', 35, 'Finance', '2019-12-05', 'Multan', 81000.00),
(47, 'Aqsa Arif', 27, 'Marketing', '2022-06-08', 'Islamabad', 69000.00),
(48, 'Raza Malik', 30, 'HR', '2020-02-17', 'Karachi', 74000.00),
(49, 'Eman Tariq', 32, 'Finance', '2018-11-22', 'Faisalabad', 77000.00),
(50, 'Shayan Ali', 33, 'IT', '2023-01-06', 'Lahore', 88000.00),
(51, 'Misha Khan', 25, 'Marketing', '2022-04-04', 'Hyderabad', 66000.00),
(52, 'Junaid Aslam', 30, 'Finance', '2021-08-18', 'Peshawar', 80000.00),
(53, 'Sana Khalid', 28, 'HR', '2020-06-29', 'Sialkot', 72000.00),
(54, 'Rameez Ahmed', 34, 'IT', '2019-10-16', 'Islamabad', 87000.00),
(55, 'Iqra Javed', 27, 'Marketing', '2021-03-27', 'Karachi', 68000.00),
(56, 'Haider Zaman', 36, 'Finance', '2017-12-11', 'Lahore', 85000.00),
(57, 'Anum Fatima', 29, 'HR', '2023-05-03', 'Rawalpindi', 75000.00),
(58, 'Zainab Noor', 31, 'Marketing', '2022-07-20', 'Faisalabad', 71000.00),
(59, 'Haris Mehmood', 30, 'IT', '2021-09-14', 'Multan', 84000.00),
(60, 'Mahnoor Saeed', 26, 'Finance', '2023-02-01', 'Lahore', 79000.00);

-- Departments where average salaries is greater than 75000
Select * from employee;
Select dept, round(avg(Salary),1) as Avg_Salary from employee group by dept having round(avg(Salary),1) > 75000;

-- Find cities where total salaries is greater 75,000;

Select * from employee;
Select city, sum(Salary) from employee group by city having sum(Salary) > 75000;

-- Find departments where more than 2 employees?

Select * from employee;
Select dept, count(Emp_ID) from employee group by dept having count(Emp_ID)>2 order by count(Emp_ID) desc;

-- Find cities of more than 2 employees apart from Karachi

Select * from employee;
Select city, count(Emp_ID) from employee where city != 'Karachi' group by city having count(Emp_ID)>2 
order by count(Emp_ID) desc;



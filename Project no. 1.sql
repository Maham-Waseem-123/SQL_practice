-- Corporate Analytics

-- Create the database
CREATE DATABASE IF NOT EXISTS AdvancedSQLPractice;
USE AdvancedSQLPractice;

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

-- Create Managers table
CREATE TABLE Managers (
    manager_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(dept_id)
);

-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    age INT,
    doj DATE,
    city VARCHAR(50),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
);

-- Create Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    budget DECIMAL(12,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Create Employee_Project junction table
CREATE TABLE Employee_Project (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- Insert Departments
INSERT INTO Departments (dept_name) VALUES
('Human Resources'),
('Finance'),
('Engineering'),
('Marketing'),
('Sales');

-- Insert Managers
INSERT INTO Managers (first_name, last_name, email, department_id) VALUES
('Alice', 'Johnson', 'alice.johnson@company.com', 1),
('Bob', 'Smith', 'bob.smith@company.com', 2),
('Charlie', 'Brown', 'charlie.brown@company.com', 3),
('Diana', 'Clark', 'diana.clark@company.com', 4),
('Ethan', 'Wright', 'ethan.wright@company.com', 5);

-- Insert Employees
INSERT INTO Employees (first_name, last_name, email, salary, age, doj, city, dept_id, manager_id) VALUES
('John', 'Doe', 'john.doe@company.com', 55000, 28, '2021-04-15', 'Lahore', 1, 1),
('Sara', 'Lee', 'sara.lee@company.com', 62000, 32, '2020-09-10', 'Karachi', 2, 2),
('Mike', 'Davis', 'mike.davis@company.com', 70000, 35, '2019-07-20', 'Islamabad', 3, 3),
('Nina', 'Thomas', 'nina.thomas@company.com', 48000, 26, '2022-01-05', 'Lahore', 4, 4),
('Jake', 'Wilson', 'jake.wilson@company.com', 75000, 38, '2018-11-12', 'Multan', 5, 5),
('Lily', 'Evans', 'lily.evans@company.com', 67000, 30, '2021-03-25', 'Karachi', 3, 3),
('Tom', 'Walker', 'tom.walker@company.com', 59000, 29, '2022-06-01', 'Peshawar', 2, 2),
('Emma', 'Scott', 'emma.scott@company.com', 53000, 27, '2021-08-17', 'Quetta', 1, 1),
('Daniel', 'Kim', 'daniel.kim@company.com', 60000, 31, '2019-03-14', 'Lahore', 4, 4),
('Sophie', 'Turner', 'sophie.turner@company.com', 71000, 33, '2020-12-20', 'Islamabad', 5, 5);

-- Insert Projects
INSERT INTO Projects (project_name, budget, dept_id) VALUES
('HR System Upgrade', 100000.00, 1),
('Annual Budget Planning', 200000.00, 2),
('AI Automation', 500000.00, 3),
('Product Launch 2025', 150000.00, 4),
('Sales Analytics Tool', 120000.00, 5);

-- Assign Employees to Projects
INSERT INTO Employee_Project (emp_id, project_id, role) VALUES
(1, 1, 'Analyst'),
(2, 2, 'Accountant'),
(3, 3, 'Lead Engineer'),
(4, 4, 'Coordinator'),
(5, 5, 'Sales Head'),
(6, 3, 'Data Scientist'),
(7, 2, 'Finance Analyst'),
(8, 1, 'HR Associate'),
(9, 4, 'Marketing Analyst'),
(10, 5, 'Sales Executive');

-- What is the total number of employees, 
-- average salary, highest, and lowest salary in each department?

show tables;
select * from departments;
Select dept_name, sum(e.emp_id), round(avg(e.salary),1) as avg_salary,
 Max(e.salary) as max_salary,min(e.Salary) as min_salary
from employees as e inner join departments as d on e.dept_id = d.dept_id group by dept_name;

-- How many employees does each manager supervise?

select * from managers;
Select concat(m.first_name," ",m.last_name) as manager_name, COUNT(EMP_ID) AS NO_OF_EMP,
 group_concat(concat(e.first_name, " ", e.last_name) Separator',') as employee_name
 from employees as e inner join managers as m 
on e.manager_id = m.manager_id group by m.manager_id;

-- 3.	Which projects have been assigned to how many employees, 
-- and what is the budget per employee for each?

show tables;
select * from employees;
Select p.project_name, group_concat(concat(e.first_name," ",e.last_name) Separator',') as emp_name
,count(e.emp_id) as number_of_employees
from projects as p inner join employees as e on e.dept_id = p.dept_id 
group by project_name
order by count(e.emp_id);

-- Who are the top 3 most experienced employees in each department based on their joining date?
Select * from employees;
with ranked_employee as (
Select d.dept_name, concat(e.first_name," ",e.last_name) as emp_names,
timestampdiff(year, e.doj,curdate()) as year_experience, 
timestampdiff(month, e.doj, curdate())%12 as month_experience, 
 Rank() over (Partition by d.dept_name order by e.doj) as rnk
 from employees as e inner join departments as d 
 on e.dept_id = d.dept_id
)
Select * from ranked_employee
where rnk <= 3;


-- 6.	What is the total team salary budget managed by each manager along with their department name?
show tables;
select * from managers;

select 
concat(m.first_name,' ',m.last_name) as manager_name, d.dept_name,
count(emp_id) as no_of_team_members, 
sum(salary) as total_budget
from managers as m inner join employees as e on e.manager_id = m.manager_id
inner join departments as d on m.department_id = d.dept_id

Group by m.manager_id, d.dept_name;

-- What is the total number of employees and the average salary in each city?
select * from employees;

select 
city, count(emp_id) as total_employee, round(avg(salary),0) as avg_salary from employees 
group by city 
order by round(avg(salary),0);

-- 8.	Which employees are working on projects with a budget greater than 150,000?
select * from projects;

select 
concat(e.first_name,' ', e.last_name) as emp_name, 
p.project_name, p.budget
from employees as e inner join departments as d on e.dept_id = d.dept_id
inner join projects as p on d.dept_id = p.dept_id
where p.budget > 150000;

-- 12.	Which departments have an average salary greater than 70,000?
show tables;
select * from projects;

select d.dept_name, round(avg(e.salary),0) as avg_salary 
from departments as d inner join employees as e on d.dept_id = e.dept_id
group by d.dept_name
having round(avg(e.salary),0)> 70000;

-- 

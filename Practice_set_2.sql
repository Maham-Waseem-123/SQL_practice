-- PRACTICE PROBLEMS
-- 1.	Create a table called Student_Info with the following fields: 
-- student_id (INT, Primary Key), name (VARCHAR(50)), 
-- email (VARCHAR(100), must be unique), dob (DATE), city (VARCHAR(50)).

create database practice_2;
use practice_2;
create table Student_Info ( student_id int auto_increment primary key, name varchar(50), email varchar(100) unique, 
DOB date, 
city varchar(50));
select * from Student_Info;

-- 1.	Insert 3 records into the Student_Info table and write a query 
-- to display only name, email, and city of all students.

INSERT INTO Student_Info (name, email, DOB, city) VALUES
('Zayan', 'zayan1@zaa.com', '2005-03-13', 'Karachi'),
('Ali', 'ali@zaa.com', '2011-01-13', 'Lahore'),
('Soniya', 'soniya@zaa.com', '2025-03-13', 'Karachi');

-- 1.	Write a query to display all employees whose age 
-- is between 25 and 35 from the employee_details table.
show databases;
use companydb;
show tables;
select * from employee;
select * from employee where age between 25 and 35;
Select * from employee where age in (25,35);

-- 1.	From the employee_details table, find the average salary of each department only 
-- if the average salary is greater than 60,000.

select dept, round(avg(Salary),1) as avg_salary from employee group by dept 
having round(avg(Salary),1)>60000 order by round(avg(Salary),1) desc;

-- 1.	Write a query to get the customername, product_name, and orderdate 
-- for each customer who bought a product called 'Smartphone', using the Customers and Orders tables.
show databases;
use sql_joins;
show tables;

-- 1.	Write a query to get the customername, product_name, and orderdate 
-- for each customer who bought a product called 'Smartphone', using the Customers and Orders tables.

create table Customers (customer_id int auto_increment primary key, customer_name varchar(25), email varchar(50),
address varchar(50));

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Customers (customer_name, email, address) VALUES
('Ali Khan', 'ali.khan@example.com', 'Lahore'),
('Sara Ahmed', 'sara.ahmed@example.com', 'Karachi'),
('Omar Shah', 'omar.shah@example.com', 'Islamabad'),
('Nida Riaz', 'nida.riaz@example.com', 'Multan'),
('Usman Tariq', 'usman.tariq@example.com', 'Peshawar'),
('Hina Aslam', 'hina.aslam@example.com', 'Quetta'),
('Adeel Malik', 'adeel.malik@example.com', 'Faisalabad'),
('Mariam Khan', 'mariam.khan@example.com', 'Sialkot'),
('Junaid Ali', 'junaid.ali@example.com', 'Hyderabad'),
('Fariha Noor', 'fariha.noor@example.com', 'Rawalpindi'),
('Hamza Qureshi', 'hamza.q@example.com', 'Bahawalpur'),
('Zara Iqbal', 'zara.iqbal@example.com', 'Gujranwala'),
('Talha Yousaf', 'talha.y@example.com', 'Abbottabad'),
('Mehwish Rauf', 'mehwish.rauf@example.com', 'Sargodha'),
('Shahid Afridi', 'shahid.afridi@example.com', 'Swat'),
('Areeba Sami', 'areeba.sami@example.com', 'Sahiwal'),
('Bilal Nadeem', 'bilal.nadeem@example.com', 'Mardan'),
('Neha Nasir', 'neha.nasir@example.com', 'Jhelum'),
('Kashif Raza', 'kashif.raza@example.com', 'Kasur'),
('Anum Saeed', 'anum.saeed@example.com', 'Sheikhupura');


INSERT INTO Orders (customer_id, product_name, order_date) VALUES
(1, 'Smartphone', '2025-06-01'),
(2, 'Laptop', '2025-06-03'),
(3, 'Smartphone', '2025-06-04'),
(4, 'Tablet', '2025-06-05'),
(5, 'Smartwatch', '2025-06-06'),
(6, 'Smartphone', '2025-06-07'),
(7, 'Headphones', '2025-06-08'),
(8, 'Smartphone', '2025-06-09'),
(9, 'Charger', '2025-06-10'),
(10, 'Smartphone', '2025-06-11'),
(11, 'TV', '2025-06-12'),
(12, 'Laptop', '2025-06-13'),
(13, 'Smartphone', '2025-06-14'),
(14, 'Router', '2025-06-15'),
(15, 'Smartphone', '2025-06-16'),
(16, 'Monitor', '2025-06-17'),
(17, 'Keyboard', '2025-06-18'),
(18, 'Smartphone', '2025-06-19'),
(19, 'Tablet', '2025-06-20'),
(20, 'Smartphone', '2025-06-21');


-- 1.	Write a query to get the customername, product_name, and orderdate 
-- for each customer who bought a product called 'Smartphone', using the Customers and Orders tables.

select c.customer_name, o.product_name, o.order_date from Customers as c inner join Orders as o 
on c.customer_id=o.customer_id where o.product_name = 'Smartphone';

SELECT 
    c.customer_name,
    DATEDIFF(CURDATE(), MAX(o.order_date)) AS days_since_last_order
FROM 
    Customers c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.customer_name;


-- 1.	From the employee_details table, retrieve 
-- the name column in uppercase and also display the character length of each name.

show databases;use companydb;
show tables;
select upper(name), character_length(name) as c_lenght from employee;

-- 1.	Add a new column status (VARCHAR(10)) to the employee_details table.
-- Then update the status column to 'Active' for all employees whose salary is above 70,000.

ALTER TABLE employee
Add COLUMN status VARCHAR(10);


select * from employee;

SET SQL_SAFE_UPDATES = 0;

UPDATE employee
SET status = 'Active'
WHERE salary > 70000 AND Emp_ID IS NOT NULL;


-- 2.	Write an SQL query to perform an inner join
-- between cricket and football tables on the name column and display players who are in both sports.
show databases; 
use sql_joins;
show tables;
-- Step 1: Create the 'cricket' table
CREATE TABLE cricket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Step 2: Create the 'football' table
CREATE TABLE football (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

-- Step 3: Insert 20 players into the 'cricket' table
INSERT INTO cricket (name) VALUES
('Virat Kohli'),
('Babar Azam'),
('Joe Root'),
('Steve Smith'),
('Kane Williamson'),
('Ben Stokes'),
('Rohit Sharma'),
('David Warner'),
('Shakib Al Hasan'),
('Rashid Khan'),
('KL Rahul'),
('Hardik Pandya'),
('MS Dhoni'),
('Faf du Plessis'),
('Chris Gayle'),
('AB de Villiers'),
('Imran Tahir'),
('Mohammad Amir'),
('Jasprit Bumrah'),
('Neymar'); -- common with football

-- Step 4: Insert 20 players into the 'football' table
INSERT INTO football (name) VALUES
('Lionel Messi'),
('Cristiano Ronaldo'),
('Kylian Mbappe'),
('Neymar'),
('Mohamed Salah'),
('Kevin De Bruyne'),
('Virgil van Dijk'),
('Erling Haaland'),
('Harry Kane'),
('Robert Lewandowski'),
('Sadio Mane'),
('Luka Modric'),
('Karim Benzema'),
('Sergio Ramos'),
('Paul Pogba'),
('Eden Hazard'),
('Marcus Rashford'),
('Son Heung-min'),
('Zlatan Ibrahimovic'),
('Babar Azam'); -- common with cricket

select c.name as player_name from cricket as c inner join football as f on c.name=f.name;


-- 3.	Create a Users table with first_name, middle_name, and last_name columns. 
-- Write a query to concatenate them into one field as Full_Name and display it in Title Case format.

show databases;
use orders;
-- Show full name in Title Case
SELECT 
  CONCAT(
    UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2)), ' ',
    UPPER(LEFT(middlename, 1)), LOWER(SUBSTRING(middlename, 2)), ' ',
    UPPER(LEFT(last_name, 1)), LOWER(SUBSTRING(last_name, 2))
  ) AS Full_Name
FROM 
  user;
show databases;
use joins_practice;
show tables;

-- Get the order number, status, product name, and total revenue for each order.
-- (Use INNER JOIN on orders, orderdetails, and products.)

select * from orderdetails;


Select o.ordernumber,o.status,p.productname, sum(od.quantityordered*od.priceeach) as revenue
from orders as o inner join orderdetails as od on o.ordernumber = od.ordernumber inner join products as p 
on od.productcode = p.productcode group by o.ordernumber, o.status, p.productname;

-- Find the names of customers who have not placed any orders. 
-- (Use LEFT JOIN on customers and orders.)

select * from customers;

select c.customername from customers as c inner join orders as o on c.customernumber= o.customernumber where o.ordernumber is null;

-- List all employees and the customers they manage (if any).

select * from employees;

select e.firstname, c.customername from employees as e right join customers as c 
on e.employeenumber = c.salesrepemployeenumber;

-- Display each employee's name along with their manager's name.
-- Use a self join on the employees table
Select * from managers;

Select concat(e.firstname," ", e.lastname) as employee_name, 
concat(m.firstname," ",m.lastname) as manager_name from employees as e left join managers as m on e.reportsto = m.managernumber;

-- Get all customers and their order numbers, including unmatched entries from both sides.
-- (Simulate FULL OUTER JOIN using UNION in MySQL.)
select * from orders;
select c.customername, o.ordernumber from customers as c left join orders as o on c.customernumber = o.customernumber
union
select c.customername, o.ordernumber from customers as c right join orders as o on c.customernumber = o.customernumber;


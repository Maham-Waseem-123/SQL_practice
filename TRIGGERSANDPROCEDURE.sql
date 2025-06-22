-- TRIGGERS

-- Create database and use it
CREATE DATABASE IF NOT EXISTS SQL_Trigger_Procedure_DB;
USE SQL_Trigger_Procedure_DB;

-- ----------------------------
-- Table: customers
-- ----------------------------
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT
);

INSERT INTO customers (name, age) VALUES
('Ali', 25), ('Sara', -5), ('John', 30), ('Zara', 22), ('Mike', 28),
('Ayesha', -3), ('Tariq', 45), ('Hassan', 34), ('Amina', 18), ('Noor', 60),
('Usman', -7), ('Laila', 29), ('Fahad', 39), ('Iqra', 32), ('Danish', 27),
('Kiran', 24), ('Faraz', 50), ('Sana', 36), ('Bilal', 23), ('Maham', 19);

-- ----------------------------
-- Table: cust_1
-- ----------------------------
CREATE TABLE cust_1 (
    id INT,
    email VARCHAR(100),
    name VARCHAR(100),
    birthdate DATE
);

INSERT INTO cust_1 (id, email, name, birthdate) VALUES
(1, 'ali@email.com', 'Ali', '1995-02-15'),
(2, 'sara@email.com', 'Sara', NULL),
(3, 'john@email.com', 'John', '1990-06-10'),
(4, 'zara@email.com', 'Zara', NULL),
(5, 'mike@email.com', 'Mike', '1989-12-22'),
(6, 'ayesha@email.com', 'Ayesha', NULL),
(7, 'tariq@email.com', 'Tariq', '1980-07-01'),
(8, 'hassan@email.com', 'Hassan', NULL),
(9, 'amina@email.com', 'Amina', '1999-03-25'),
(10, 'noor@email.com', 'Noor', NULL),
(11, 'usman@email.com', 'Usman', '1993-11-11'),
(12, 'laila@email.com', 'Laila', NULL),
(13, 'fahad@email.com', 'Fahad', '1991-08-08'),
(14, 'iqra@email.com', 'Iqra', '1992-01-30'),
(15, 'danish@email.com', 'Danish', NULL),
(16, 'kiran@email.com', 'Kiran', '1998-05-19'),
(17, 'faraz@email.com', 'Faraz', NULL),
(18, 'sana@email.com', 'Sana', '1987-04-14'),
(19, 'bilal@email.com', 'Bilal', '2000-09-09'),
(20, 'maham@email.com', 'Maham', NULL);

-- ----------------------------
-- Table: message
-- ----------------------------
CREATE TABLE message (
    id INT,
    msgID INT,
    msg TEXT,
    PRIMARY KEY(id, msgID)
);

-- ----------------------------
-- Table: employees
-- ----------------------------
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary FLOAT
);

INSERT INTO employees (name, age, salary) VALUES
('Ali', 29, 10000), ('Sara', 28, 9500), ('John', 35, 12000), ('Zara', 30, 9000),
('Ayesha', 26, 8700), ('Hassan', 33, 7600), ('Tariq', 40, 8200), ('Noor', 31, 9200),
('Fahad', 36, 11500), ('Laila', 29, 9400), ('Usman', 45, 9900), ('Maham', 24, 10500),
('Sana', 38, 8800), ('Faraz', 27, 10000), ('Kiran', 25, 9700), ('Bilal', 30, 9500),
('Iqra', 28, 8500), ('Danish', 32, 7000), ('Amina', 29, 9200), ('Faisal', 34, 8900);

-- ----------------------------
-- Table: salary
-- ----------------------------
CREATE TABLE salary (
    eid INT,
    valid_from DATE,
    amount FLOAT
);

INSERT INTO salary VALUES
(1, '2023-01-01', 50000), (2, '2023-02-01', 55000), (3, '2023-03-01', 60000),
(4, '2023-04-01', 58000), (5, '2023-05-01', 62000), (6, '2023-06-01', 59000),
(7, '2023-07-01', 57000), (8, '2023-08-01', 63000), (9, '2023-09-01', 61000),
(10, '2023-10-01', 65000), (11, '2023-11-01', 54000), (12, '2023-12-01', 67000),
(13, '2024-01-01', 56000), (14, '2024-02-01', 64000), (15, '2024-03-01', 60000),
(16, '2024-04-01', 59000), (17, '2024-05-01', 63000), (18, '2024-06-01', 66000),
(19, '2024-07-01', 61000), (20, '2024-08-01', 58000);

-- ----------------------------
-- Table: salary_del
-- ----------------------------
CREATE TABLE salary_del (
    eid INT,
    valid_from DATE,
    amount FLOAT,
    deleted_at TIMESTAMP DEFAULT NOW()
);

-- ----------------------------
-- Table: player
-- ----------------------------
CREATE TABLE player (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    goals INT
);

INSERT INTO player (name, country, goals) VALUES
('Messi', 'Argentina', 9),
('Ronaldo', 'Portugal', 8),
('Neymar', 'Brazil', 5),
('Mbappe', 'France', 7),
('Salah', 'Egypt', 4),
('Kane', 'England', 6),
('Benzema', 'France', 7),
('Lewandowski', 'Poland', 8),
('Haaland', 'Norway', 10),
('Son', 'South Korea', 3);

-- ----------------------------
-- Table: emp_details
-- ----------------------------
CREATE TABLE emp_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary FLOAT,
    sex CHAR(1)
);

INSERT INTO emp_details (name, age, salary, sex) VALUES
('Ali', 29, 8000, 'M'),
('Sara', 25, 7000, 'F'),
('Zara', 33, 8500, 'F'),
('Tom', 40, 9000, 'M'),
('Laila', 28, 7500, 'F'),
('Fahad', 35, 8800, 'M'),
('Ayesha', 26, 9300, 'F'),
('Bilal', 27, 7900, 'M'),
('Sana', 24, 8600, 'F'),
('Danish', 32, 9100, 'M'),
('Noor', 29, 9200, 'F'),
('Usman', 30, 8900, 'M'),
('Kiran', 31, 9400, 'F'),
('Faisal', 36, 9600, 'M'),
('Iqra', 28, 9700, 'F'),
('Faraz', 33, 9800, 'M'),
('Maham', 22, 7700, 'F'),
('Tariq', 37, 8300, 'M'),
('Hassan', 34, 8500, 'M'),
('Amina', 23, 8100, 'F');

-- Q1. Write a BEFORE INSERT trigger on the customers table that ensures no customer 
-- can be inserted with a negative age. 
-- If a negative value is given, set the age to 0.

DELIMITER //
create trigger age_verify1
before insert on customers for each  row
Begin 
	If new.age < 0 THEN
		set new.age = 0;
	END IF;
End;
//
 
 DELIMITER ;
 -- TESTING THE AGE_VERIFY1 TRIGGER 
 
 SELECT * FROM CUSTOMERS;
 
 -- Create an AFTER INSERT trigger on cust_1 that inserts a message if birthdate is NULL.
 SHOW TABLES;
 DELIMITER //
 CREATE TRIGGER CHECK_NULL_DOB
 AFTER INSERT ON cust_1 FOR EACH ROW
 BEGIN 
 IF NEW.BIRTHDATE IS NULL THEN
 INSERT INTO MESSAGE( ID, MSGID, MSG)
 VALUES (NEW.ID, 1, CONCAT('HI', NEW.NAME, 'BIRTH DATE IS MISSING'));
 END IF;
 END
 //
  DELIMITER ;
 
 SELECT * FROM MESSAGE;
 INSERT INTO CUST_1  VALUES (21, 'MAHAM@MAHA.COM', 'MAHAM', NULL);
 
 -- Create a BEFORE UPDATE trigger on the employees table. If:
 -- •	salary = 10000, update it to 85000
-- salary < 10000, update it to 72000
 
DELIMITER //
CREATE TRIGGER upd_trigger
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary = 10000 THEN
        SET NEW.salary = 85000;
    ELSEIF NEW.salary < 10000 THEN
        SET NEW.salary = 72000;
    END IF;
END;
//
DELIMITER ;

SELECT * FROM EMPLOYEES;

SET SQL_SAFE_UPDATES = 0;
UPDATE EMPLOYEES 
SET SALARY = 10000;


-- Create a BEFORE DELETE trigger that copies data from salary to salary_del.
DELIMITER // 
CREATE TRIGGER SALARY_DELETE
BEFORE DELETE ON SALARY
FOR EACH ROW 
BEGIN
INSERT INTO SALARY_DEL(EID, VALID_FROM, AMOUNT)
VALUES (OLD.EID, OLD.VALID_FROM, OLD.AMOUNT);
END //
 DELIMITER ;

SHOW TABLES;
SELECT * FROM SALARY_DEL;
DELETE FROM SALARY WHERE EID = 1;



-- STORED PROCEDURES
-- Write a stored procedure top_player() that returns players with goals > 6.
 
 DELIMITER //
 CREATE PROCEDURE TOP_PLAYER()
 BEGIN 
SELECT NAME, COUNTRY, GOALS FROM PLAYER WHERE GOALS > 6;
END //
DELIMITER ;

CALL TOP_PLAYER;

-- Create a stored procedure that accepts an integer input and returns the top N employees by salary.
DELIMITER //
CREATE PROCEDURE SP(IN VAR INT)
BEGIN 
SELECT NAME, AGE, SALARY FROM EMP_DETAILS ORDER BY SALARY DESC LIMIT VAR;
END;
// 
DELIMITER ;

CALL SP(5);

-- Write a procedure that updates salary based on employee name.
DELIMITER //
CREATE PROCEDURE UPDATE_SALAR(
IN TEMP_NAME VARCHAR(20), 
IN NEW_SALARY FLOAT)
BEGIN
UPDATE EMP_DETAILS 
SET SALARY = NEW_SALARY
WHERE NAME = TEMP_NAME;
END;
//
DELIMITER ;

SELECT * FROM EMP_DETAILS;
CALL UPDATE_SALAR( 'ALI' , 10000);

-- . Write a procedure to count female employees using OUT parameter and display result.
DELIMITER // 
CREATE PROCEDURE SP_COUNTEMPLOYEES(OUT TOTAL_EMPS INT)
BEGIN
SELECT COUNT(NAME) INTO TOTAL_EMPS FROM EMP_DETAILS WHERE SEX = 'F';
END;
//
DELIMITER ;



-- Call it and get result:
CALL sp_countemployees(@F_emp);
SELECT @F_emp AS fem_emps;


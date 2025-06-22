-- Triggers & Procedure Railhailing App Questions 

-- Create and use database
CREATE DATABASE IF NOT EXISTS RideHailingDB;
USE RideHailingDB;

-- ----------------------------
-- Table: riders
-- ----------------------------
CREATE TABLE riders (
    rider_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    rating FLOAT
);

INSERT INTO riders (name, phone, rating) VALUES
('Ali', '03001234567', 4.8),
('Sara', '03019876543', 4.7),
('John', '03005678901', 4.5),
('Zara', '03006543210', 4.9),
('Mike', '03007777777', 4.2),
('Ayesha', '03002223333', 4.6),
('Tariq', '03004445555', 4.1),
('Hassan', '03008889999', 4.3),
('Amina', '03001112222', 4.5),
('Noor', '03003334444', 4.0),
('Usman', '03006661111', 3.8),
('Laila', '03009990000', 4.6),
('Fahad', '03001239876', 4.4),
('Iqra', '03009871234', 4.9),
('Danish', '03002345678', 3.9),
('Kiran', '03003456789', 4.3),
('Faraz', '03004567891', 4.7),
('Sana', '03007894561', 4.8),
('Bilal', '03009001234', 4.1),
('Maham', '03001001001', 4.2);

-- ----------------------------
-- Table: drivers
-- ----------------------------
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    vehicle_number VARCHAR(20),
    is_active BOOLEAN,
    rating FLOAT
);

INSERT INTO drivers (name, vehicle_number, is_active, rating) VALUES
('Imran', 'ABC-123', TRUE, 4.9),
('Kamran', 'XYZ-456', TRUE, 4.7),
('Shahid', 'DEF-789', FALSE, 4.3),
('Hamza', 'JKL-321', TRUE, 4.5),
('Rehan', 'GHI-654', TRUE, 4.6),
('Babar', 'MNO-987', FALSE, 4.0),
('Omer', 'PQR-111', TRUE, 4.2),
('Salman', 'STU-222', TRUE, 4.4),
('Adnan', 'VWX-333', FALSE, 4.1),
('Talha', 'YZA-444', TRUE, 4.8);

-- ----------------------------
-- Table: rides
-- ----------------------------
CREATE TABLE rides (
    ride_id INT PRIMARY KEY AUTO_INCREMENT,
    rider_id INT,
    driver_id INT,
    origin VARCHAR(100),
    destination VARCHAR(100),
    fare DECIMAL(8,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

INSERT INTO rides (rider_id, driver_id, origin, destination, fare, status) VALUES
(1, 1, 'Gulshan', 'Saddar', 550.00, 'completed'),
(2, 2, 'DHA', 'Clifton', 400.00, 'completed'),
(3, 4, 'Nazimabad', 'Bahadurabad', 300.00, 'cancelled'),
(4, 1, 'Malir', 'Airport', 650.00, 'completed'),
(5, 5, 'Korangi', 'Defence', 500.00, 'ongoing'),
(6, 6, 'North Karachi', 'Tariq Road', 450.00, 'completed'),
(7, 3, 'FB Area', 'Gulshan', 420.00, 'cancelled'),
(8, 2, 'Saddar', 'PECHS', 310.00, 'completed'),
(9, 7, 'Gulshan', 'Johar', 250.00, 'completed'),
(10, 8, 'Airport', 'DHA', 700.00, 'completed'),
(11, 9, 'University Road', 'Seaview', 530.00, 'completed'),
(12, 10, 'Model Colony', 'Hyderi', 600.00, 'completed'),
(13, 1, 'Nazimabad', 'North Nazimabad', 270.00, 'ongoing'),
(14, 4, 'Cantt', 'Gulshan', 390.00, 'completed'),
(15, 2, 'Johar', 'Saddar', 330.00, 'cancelled'),
(16, 6, 'Korangi', 'DHA Phase 5', 480.00, 'completed'),
(17, 7, 'Defence', 'Gulberg', 370.00, 'completed'),
(18, 8, 'Garden', 'City Station', 290.00, 'completed'),
(19, 9, 'Tariq Road', 'Hill Park', 310.00, 'ongoing'),
(20, 10, 'Bahadurabad', 'Boat Basin', 440.00, 'completed');

-- Create a BEFORE INSERT trigger on the riders table to ensure that the 
-- rating cannot be greater than 5. If it is, set it to 5

show tables;
select * from riders;

Delimiter //
create trigger rating_adjustment
before insert
on riders for each row
Begin 
if new.rating > 5 then
	set new.rating = 0;
end if ;
end;
//
DElimiter ;

-- Testing trigger

insert into riders (name, phone, rating) values ('maham', 0000000, 6);

Select * from rides;

CREATE TABLE notification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(100)
);

-- Create an AFTER INSERT trigger on the rides table that inserts a welcome message into a 
-- new notifications table, like:
-- "Thanks [rider_name] for booking a ride from [origin] to [destination]."
Drop trigger book_ride;
Delimiter //
create trigger book_ride
After insert
on rides for each row 
Begin
declare rider_name varchar (50);
-- selecting rider name 
select name into rider_name from riders where rider_id = new.rider_id;

-- inserting into the notification table. 
insert into notification (message) values (concat('Thanks ',  rider_name, ' for booking a ride for', new.destination));

end;
//
Delimiter ;

SHOW CREATE TABLE rides;


INSERT INTO rides (rider_id, driver_id, origin, destination, fare, status, created_at)
VALUES (2, 1, 'Karachi', 'Lahore', 660, 'Ongoing', NOW());

Select * from notification;

-- Write a BEFORE DELETE trigger on the rides table that copies the ride record into a
--  new table rides_archive before deletion.

CREATE TABLE rides_archive (
    ride_id INT,
    rider_id INT,
    driver_id INT,
    origin VARCHAR(100),
    destination VARCHAR(100),
    fare DECIMAL(8,2),
    status VARCHAR(20),
    created_at TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Write a BEFORE DELETE trigger on the rides table that copies the ride record into a
--  new table rides_archive before deletion.

Delimiter //
create trigger del_ride
before delete
on rides for each row 
Begin 
insert into rides_archive ( ride_id,
    rider_id,
    driver_id,
    origin,
    destination,
    fare,
    status,
    created_at
) values ( old.ride_id,
    old.rider_id,
    old.driver_id,
    old.origin,
    old.destination,
    old.fare,
    old.status,
    old.created_at);
    End ; 
    // 
    Delimiter ;
    
    select * from rides;
    delete from rides where ride_id = 1;
    
 
 
 -- Create a BEFORE UPDATE trigger on the rides table that prevents fare reduction — 
-- i.e., new fare cannot be less than old fare.

Delimiter //
create trigger Fare_adjustment
before update 
on rides for each row
begin
if new.fare < old.fare then 
set new.fare = 0; 
end if;
end;
//
Delimiter ;

UPDATE rides SET fare = 300.00 WHERE ride_id = 2;

-- Stored Procedure 

-- Write a procedure get_top_riders(IN min_rating FLOAT) 
-- that returns all riders whose rating is greater than or equal to the provided input.
select * from riders;

Drop procedure get_top_riders;
Delimiter //
create procedure get_top_riders( in min_rating float)
Begin
select name, rating from riders where rating >= min_rating order by rating desc;
end;
//
Delimiter ;

call get_top_riders (3);

-- Create a procedure count_completed_rides(OUT total_completed INT) 
-- that returns the total number of rides with the status 'completed'.
select * from rides;

Delimiter //
create procedure count_completed_rides( out total_complated int)
begin
select count(ride_id) into total_complated from rides where status = 'completed' ;
end;
//
Delimiter ;

call count_completed_rides(@total_complated);
select @total_complated;

-- Write a procedure assign_driver(IN ride_id_input INT, IN driver_id_input INT) 
-- that updates the driver of a given ride.
show tables;
select * from rides;

Delimiter // 
create procedure assign_driver (in ride_id_input int, in driver_id_input int)
BEGIN
    UPDATE rides
    SET driver_id = driver_id_input
    WHERE ride_id = ride_id_input;
END;
//

DELIMITER ;

CALL assign_driver(5, 3);


-- Table structures
CREATE TABLE IF NOT EXISTS `book_categories` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `author` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(5) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `book_issue` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `available_status` tinyint(1) NOT NULL DEFAULT 1,
  `added_by` int(11) NOT NULL,
  `added_at_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`issue_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `book_issue_log` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `book_issue_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `issue_by` int(11) NOT NULL,
  `issued_at` varchar(50) NOT NULL,
  `return_time` varchar(50) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_issue_id` (`book_issue_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `student_categories` (
  `cat_id` int(2) NOT NULL AUTO_INCREMENT,
  `category` varchar(512) NOT NULL,
  `max_allowed` int(1) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(512) NOT NULL,
  `last_name` varchar(512) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT 0,
  `rejected` int(1) NOT NULL DEFAULT 0,
  `category` int(1) NOT NULL,
  `roll_num` varchar(15) NOT NULL,
  `branch` int(1) NOT NULL DEFAULT 0,
  `year` int(5) NOT NULL,
  `books_issued` int(1) NOT NULL DEFAULT 0,
  `email_id` varchar(512) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `category` (`category`),
  KEY `branch` (`branch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(512) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verification_status` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign key constraints
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `book_categories` (`id`);

ALTER TABLE `book_issue`
  ADD CONSTRAINT `book_issue_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

ALTER TABLE `book_issue_log`
  ADD CONSTRAINT `book_issue_log_ibfk_1` FOREIGN KEY (`book_issue_id`) REFERENCES `book_issue` (`issue_id`),
  ADD CONSTRAINT `book_issue_log_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`category`) REFERENCES `student_categories` (`cat_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`branch`) REFERENCES `branches` (`id`);
  
  Show tables;
  
  -- inserting values;
  INSERT INTO book_categories (category) VALUES 
('Science Fiction'), 
('History'), 
('Mathematics'), 
('Literature'), 
('Technology');

INSERT INTO branches (branch) VALUES 
('Computer Science'), 
('Electrical Engineering'), 
('Mechanical Engineering'), 
('Civil Engineering'), 
('Business Administration');


INSERT INTO student_categories (category, max_allowed) VALUES 
('Undergraduate', 3), 
('Postgraduate', 4), 
('PhD', 5), 
('Diploma', 2), 
('Certificate', 1);


INSERT INTO users (name, username, password, verification_status, remember_token) VALUES 
('Admin One', 'admin1', 'pass123', 1, 'token1'), 
('Admin Two', 'admin2', 'pass456', 1, 'token2'), 
('Librarian A', 'librarian1', 'libpass1', 1, 'token3'), 
('Librarian B', 'librarian2', 'libpass2', 1, 'token4'), 
('Assistant', 'assistant1', 'assistpass', 1, 'token5');


INSERT INTO students (first_name, last_name, approved, rejected, category, roll_num, branch, year, books_issued, email_id) VALUES
('Ali', 'Khan', 1, 0, 1, 'CS101', 1, 2022, 1, 'ali.khan@example.com'),
('Sara', 'Ahmed', 1, 0, 2, 'EE202', 2, 2021, 2, 'sara.ahmed@example.com'),
('Zain', 'Malik', 1, 0, 3, 'ME303', 3, 2020, 0, 'zain.malik@example.com'),
('Fatima', 'Noor', 1, 0, 4, 'CE404', 4, 2023, 3, 'fatima.noor@example.com'),
('Usman', 'Riaz', 1, 0, 5, 'BA505', 5, 2024, 1, 'usman.riaz@example.com');


INSERT INTO books (title, author, description, category_id, added_by) VALUES
('Dune', 'Frank Herbert', 'Science fiction epic set on the desert planet Arrakis.', 1, 1),
('Sapiens', 'Yuval Noah Harari', 'A brief history of humankind.', 2, 2),
('Linear Algebra Done Right', 'Sheldon Axler', 'Mathematics textbook focused on vector spaces.', 3, 3),
('Hamlet', 'William Shakespeare', 'Tragedy about the Prince of Denmark.', 4, 4),
('Clean Code', 'Robert C. Martin', 'A handbook of agile software craftsmanship.', 5, 5);


INSERT INTO book_issue (book_id, available_status, added_by) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 0, 3),
(4, 0, 4),
(5, 1, 5);


INSERT INTO book_issue_log (book_issue_id, student_id, issue_by, issued_at, return_time) VALUES
(1, 1, 1, '2025-06-01 10:00:00', '2025-06-15 10:00:00'),
(2, 2, 2, '2025-06-03 11:30:00', '2025-06-17 11:30:00'),
(3, 3, 3, '2025-06-05 09:45:00', '2025-06-19 09:45:00'),
(4, 4, 4, '2025-06-07 14:20:00', '2025-06-21 14:20:00'),
(5, 5, 5, '2025-06-10 16:00:00', '2025-06-24 16:00:00');

-- ----------------------------
-- book_categories (IDs 16–25)
-- ----------------------------
INSERT INTO book_categories (category) VALUES
('Science & Nature'),
('Drama'),
('Anthropology'),
('Poetry'),
('Engineering'),
('Political Science'),
('Medical Science'),
('Computer Graphics'),
('Astronomy'),
('Economics');

-- ----------------------------
-- branches (IDs 16–25)
-- ----------------------------
INSERT INTO branches (branch) VALUES
('Data Science'),
('Public Health'),
('Media Studies'),
('Robotics'),
('Genetics'),
('Philosophy'),
('International Relations'),
('Environmental Science'),
('Journalism'),
('Game Design');

-- ----------------------------
-- student_categories (IDs 16–25)
-- ----------------------------
INSERT INTO student_categories (category, max_allowed) VALUES
('BS Data Science', 3),
('MPH', 2),
('MCS', 3),
('BSc Robotics', 2),
('MSc Genetics', 3),
('BA Philosophy', 2),
('BS IR', 3),
('MSc Environmental', 2),
('BA Journalism', 2),
('BS Game Design', 3);

-- ----------------------------
-- users (IDs 16–25)
-- ----------------------------
INSERT INTO users (name, username, password, verification_status, remember_token) VALUES
('Helper C', 'helper3', 'helperpass3', 1, 'token16'),
('Helper D', 'helper4', 'helperpass4', 1, 'token17'),
('Admin Five', 'admin5', 'adminpass5', 1, 'token18'),
('Admin Six', 'admin6', 'adminpass6', 1, 'token19'),
('Librarian E', 'librarian5', 'libpass5', 1, 'token20'),
('Librarian F', 'librarian6', 'libpass6', 1, 'token21'),
('Staff A', 'staff1', 'staffpass1', 1, 'token22'),
('Staff B', 'staff2', 'staffpass2', 1, 'token23'),
('Support Two', 'support2', 'supportpass2', 1, 'token24'),
('Manager C', 'manager3', 'managerpass3', 1, 'token25');

-- ----------------------------
-- students (IDs 16–25)
-- ----------------------------
INSERT INTO students (first_name, last_name, approved, rejected, category, roll_num, branch, year, books_issued, email_id) VALUES
('Iqra', 'Zahid', 1, 0, 16, 'DS001', 16, 2022, 1, 'iqra.zahid@example.com'),
('Raza', 'Butt', 1, 0, 17, 'PH002', 17, 2023, 2, 'raza.butt@example.com'),
('Nimra', 'Ali', 1, 0, 18, 'MCS003', 18, 2021, 1, 'nimra.ali@example.com'),
('Ahmed', 'Waqas', 1, 0, 19, 'ROB004', 19, 2024, 0, 'ahmed.waqas@example.com'),
('Laiba', 'Jamil', 1, 0, 20, 'GEN005', 20, 2021, 2, 'laiba.jamil@example.com'),
('Saad', 'Naseer', 1, 0, 21, 'PHL006', 21, 2022, 3, 'saad.naseer@example.com'),
('Hania', 'Rauf', 1, 0, 22, 'IR007', 22, 2023, 1, 'hania.rauf@example.com'),
('Rehan', 'Qureshi', 1, 0, 23, 'ENV008', 23, 2024, 2, 'rehan.qureshi@example.com'),
('Sadia', 'Ilyas', 1, 0, 24, 'JRN009', 24, 2022, 1, 'sadia.ilyas@example.com'),
('Taimoor', 'Aziz', 1, 0, 25, 'GDS010', 25, 2021, 0, 'taimoor.aziz@example.com');

-- ----------------------------
-- books (IDs 16–25)
-- ----------------------------
INSERT INTO books (title, author, description, category_id, added_by) VALUES
('The Selfish Gene', 'Richard Dawkins', 'Explains evolutionary biology and genes.', 16, 16),
('Othello', 'William Shakespeare', 'Classic Shakespearean drama.', 17, 17),
('Guns, Germs, and Steel', 'Jared Diamond', 'Exploration of human societies.', 18, 18),
('Milk and Honey', 'Rupi Kaur', 'Poetry collection on love and loss.', 19, 19),
('Mechanics of Materials', 'Ferdinand Beer', 'Core textbook in engineering.', 20, 20),
('The Prince', 'Niccolò Machiavelli', 'Treatise on political power.', 21, 21),
('Gray’s Anatomy', 'Henry Gray', 'Detailed anatomical reference.', 22, 22),
('Real-Time Rendering', 'Tomas Akenine-Möller', 'Computer graphics bible.', 23, 23),
('Cosmos', 'Carl Sagan', 'Explores the universe and science.', 24, 24),
('Capital', 'Thomas Piketty', 'Analysis of wealth inequality.', 25, 25);

-- ----------------------------
-- book_issue (IDs 16–25)
-- ----------------------------
INSERT INTO book_issue (book_id, available_status, added_by) VALUES
(16, 1, 16),
(17, 0, 17),
(18, 1, 18),
(19, 0, 19),
(20, 1, 20),
(21, 0, 21),
(22, 1, 22),
(23, 0, 23),
(24, 1, 24),
(25, 1, 25);

-- ----------------------------
-- book_issue_log (IDs 16–25)
-- ----------------------------
INSERT INTO book_issue_log (book_issue_id, student_id, issue_by, issued_at, return_time) VALUES
(16, 16, 16, '2025-06-21 10:00:00', '2025-07-05 10:00:00'),
(17, 17, 17, '2025-06-22 11:00:00', '2025-07-06 11:00:00'),
(18, 18, 18, '2025-06-23 12:00:00', '2025-07-07 12:00:00'),
(19, 19, 19, '2025-06-24 13:00:00', '2025-07-08 13:00:00'),
(20, 20, 20, '2025-06-25 14:00:00', '2025-07-09 14:00:00'),
(21, 21, 21, '2025-06-26 15:00:00', '2025-07-10 15:00:00'),
(22, 22, 22, '2025-06-27 16:00:00', '2025-07-11 16:00:00'),
(23, 23, 23, '2025-06-28 17:00:00', '2025-07-12 17:00:00'),
(24, 24, 24, '2025-06-29 18:00:00', '2025-07-13 18:00:00'),
(25, 25, 25, '2025-06-30 19:00:00', '2025-07-14 19:00:00');
show databases;
use library;

-- Book Management & Availability

-- How can you find the titles of books that are currently available and 
-- the number of available copies for each?
show tables;
select * from book_issue;

select  b.title, (case when bi.available_status = 1 then 'Yes_available' else 'Not_available' End) as availablity_status, count(bi.issue_id) as no_of_avaible_copies
from books as b join book_issue as bi on b.book_id = bi.book_id
group by b.title, availablity_status;

-- Student Management
-- How can you display each student’s full name along with 
-- their current approval status (Approved, Rejected, or Pending)?

Show tables;
select * from students;

select roll_num, concat(first_name, ' ', last_name) as Full_name,
(case when approved = '1' then 'Approved' 
when rejected = '1' then 'Rejected' else 'Pending' End) as Approval_status from students;

-- 3.	Which books are overdue, and which students have not returned them? 
show tables;
select * from students;

SELECT b.title, s.roll_num, 
       CONCAT(s.first_name, ' ', s.last_name) AS student_name,
       DATEDIFF(CURDATE(), STR_TO_DATE(log.return_time, '%Y-%m-%d %H:%i:%s')) AS days_overdue
FROM book_issue_log log
JOIN book_issue bi ON log.book_issue_id = bi.issue_id
JOIN books b ON bi.book_id = b.book_id
JOIN students s ON log.student_id = s.student_id
WHERE STR_TO_DATE(log.return_time, '%Y-%m-%d %H:%i:%s') < CURDATE()
  AND bi.available_status = 0;

show databases;
use library;

-- What are the top 5 most issued book categories in your library system?
show tables;
select * from book_issue;

Select bc.category, count(bi.issue_id) as Number_of_issues from books as b join book_categories as bc on b.category_id = bc.id
join book_issue as bi on b.book_id = bi.book_id
join book_issue_log as bl on bi.issue_id = bl.book_issue_id
group by bc.category
order by Number_of_issues desc limit 5;

-- Borrowing Limits
-- 5.	Which students have reached or exceeded their borrowing limit 
-- based on their category (e.g., undergraduate, graduate)?
Show tables;
select * from branches;

Select sc.category, count(s.books_issued) as total_issued, sc.max_allowed,
(case when count(s.books_issued)>= sc.max_allowed then 'limit_exceeded' else 'Limit_remaining' end) as Total_remaining_limit
from students as s join student_categories as sc on s.category = sc.cat_id
group by sc.category,  sc.max_allowed;

-- Librarian Performance
-- 6.	How many books has each librarian issued, and how many of those are still currently borrowed 
use library;
show tables;
select * from book_issue_log;

select u.name, count(bl.book_issue_id) as Total_books_issued,
(case when bl.return_time is null then 'Not_Returned' else 'Returned' end) as Returned_status 
from users as u join book_issue_log as bl on u.id = bl.issue_by
group by u.name, Returned_status;

-- Search and Filtering
-- 7.	How can you search for books related to a 
-- specific keyword like ‘Atomic’ in the title or a specific author’s name such as ‘Rupi’?
Show tables;
Select * from books;
select book_id, title, author from books 
where title like '%Atomic%' or author like '%Rupi%';

-- Branch-Level Insights
-- 8.	How many unique book titles and total book copies are issued per branch?
show tables;
select * from books;

select b.branch, group_concat(distinct(bo.title) separator ',') as Title,
count(bl.book_issue_id) as Total_issued_copies
from 
branches as b join students as s on b.id = s.branch join 
book_issue_log as bl on bl.student_id = s.student_id join 
book_issue as bi on bi.issue_id = bl.book_issue_id join 
books as bo on bo.book_id = bi.book_id
group by b.branch;

-- Book and Student Entries
-- 9.	How can you add a new book titled Atomic Habits by James Clear under the 'Literature' category added 
-- by 'librarian1'?
show tables;
select * from books;
insert into books (title, author, description, category_id, added_by) 
values ('Atomic Habit', 'James Clear', 'Good book', (select id from book_categories where category = 'Literature'), 
(select id from users where name = 'Librarian A'));

-- 10.	How would you perform a full book issuance transaction for a student: marking the book as unavailable, 
-- logging the issue, and updating the student’s borrowed count?
show tables;
START TRANSACTION;

-- Mark book as unavailable
UPDATE book_issue 
SET available_status = 0 
WHERE issue_id = 16;

-- Add to issue log
INSERT INTO book_issue_log (book_issue_id, student_id, issue_by, issued_at, return_time)
VALUES (16, 16, 3, NOW(), DATE_ADD(NOW(), INTERVAL 14 DAY));

-- Update student's book count
UPDATE students 
SET books_issued = books_issued + 1 
WHERE student_id = 16;

COMMIT;

Select * from book_issue;

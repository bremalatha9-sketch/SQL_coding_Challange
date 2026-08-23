-- SESSION 28 – DDL (CREATE, ALTER, DROP, RENAME, TRUNCATE)
--  Challenge 1 — Create Database

CREATE DATABASE Socialmediadb  ;
--  Challenge 2 — Create Table  --
USE Socialmediadb  ;
CREATE TABLE users (
user_id INT PRIMARY KEY,
username VARCHAR(50),
full_name VARCHAR(100),
email     VARCHAR(100),
created_at  DATETIME
);
--  Challenge 3 — Alter Table
ALTER TABLE users 
ADD bio VARCHAR(255)  ;

--  Challenge 4 — Rename & Drop
RENAME TABLE users to app_users ;
RENAME TABLE app_users to users ;
DROP TABLE IF EXISTS temp_Table ;

--  SESSION 29 – KEYS, CONSTRAINTS, INSERT/UPDATE/DELETE
--  Challenge 1 — Posts Table with Constraints
		
    
        
   CREATE TABLE posts     (
   post_id INT AUTO_INCREMENT PRIMARY KEY,
   user_id INT,
   FOREIGN KEY(user_id) REFERENCES users
   (user_id),
   
   CAPTION TEXT,
   Posted_at DATETIME DEFAULT CURRENT_TIMESTAMP
   );
   -- Challenge 2 – Followers Table
CREATE TABLE followers(
follower_id  INT,
following_id INT,
follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(follower_id)  REFERENCES users
   (user_id),
   FOREIGN KEY(following_id) REFERENCES users
   (user_id)
   );
   --  Challenge 3 – Insert Sample Data
  
   INSERT INTO  users ( user_id,username,Full_name,email,created_at,bio) 
   VALUES
   (1,'Priya001','Sri Priya','priya@gmail.com',NOW(),'Business Analyst'),
   (2,'viji002','Viayalakshmi','viji@gmail.com',NOW(),'Financial Analyst'),
   (3,'kalai003','Kalaimagal','kalai@gmail.com',Now(),'Data Analyst'),
   (4,'jai004','Jaikumar','jai@gmail.com',NOW(),'Healthcare Analyst'),
   (5,'prem005','Premalatha','prem@gmail.com',NOW(),'Operations Analyst') ;
   INSERT INTO posts (user_id, caption)
VALUES
(1, 'Hello everyone!'),
(2, 'Good morning!'),
(3, 'Having a great day!'),
(4, 'Learning SQL today.'),
(5, 'Welcome to my profile!');
   
   --  Challenge 4 — Update / Delete
--  1. Update a user's bio
UPDATE users
SET bio='You tube analyser'
WHERE user_id = 1;

SELECT user_id, username, bio
FROM users;

   DELETE FROM posts
WHERE post_id = 3;
   
   
   SELECT user_id,caption
   FROM posts;

TRUNCATE TABLE posts;
INSERT INTO posts (user_id, caption)
VALUES
(1, 'Hello everyone!'),
(2, 'Good morning!'),
(3, 'Having a great day!'),
(4, 'Learning SQL today.'),
(5, 'Welcome to my profile!');

/* TRUNCATE- Removes all the posts and keeps the posts table
DROP-Removes entire the table
DELETE--Selected rows*/

   
   






	
        




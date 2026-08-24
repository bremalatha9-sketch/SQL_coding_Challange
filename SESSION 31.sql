--  SESSION 31 – ORDER BY, GROUP BY, LIMIT, HAVING

USE Socialmediadb  ;
 INSERT INTO  users ( user_id,username,Full_name,email,created_at,bio) 
   VALUES (6,'subbu006','subramani','subbu@gmail.com',NOW(),'Developer'),
   (7,'viay007','Viayakumar','vijay@gmail.com',NOW(),'Financial Analyst'),
   (8,'janani008','Janani','janani@gmail.com',Now(),'Data Analyst'),
   (9,'ryan009','Ryan D','ryan@gmail.com',NOW(),'Healthcare Analyst'),
   (10,'aditya010','Aditya D','adi@gmail.com',NOW(),'Operations Analyst'),
   (11,'Darwin011','Darwin','darwin@gmail.com',NOW(),'Operations Analyst');
    INSERT INTO posts (user_id, caption)
VALUES
(6, 'Hello everyone!'),
(7, 'Good morning!'),
(8, 'Having a great day!'),
(9, 'Learning SQL today.'),
(10, 'Welcome to my profile!');

   SELECT* FROM posts;
   
    --  Challenge 1 — Top Active Users
   
   SELECT * FROM users ORDER BY username limit 5; ## show the first 5 users in username in ascending order
   Challenge 2 — Group by Posts Per Day
   --  
   SELECT DATE(posted_at) AS posted,
   COUNT(*) AS total_posts ## count is used count the rows
   FROM posts
   GROUP BY DATE(posted_at) ## groups the posted_data
   HAVING COUNT(*)>10;## having is used filtered grouped data
   
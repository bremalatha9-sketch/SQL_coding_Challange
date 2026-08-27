--  SESSION 32 – JOINS, UNION, BUILT-IN FUNCTIONS

 
USE socialmediadb;
--  Challenge 1 — Comments Table

CREATE TABLE Comments( 
 
             comment_id INT PRIMARY KEY,
             post_id INT,
             user_id INT,
             comment_text VARCHAR(100),
             commented_at DATETIME,
 
  FOREIGN KEY (user_id) REFERENCES users(user_id), 
  FOREIGN KEY (post_id) REFERENCES posts(user_id) 
  );
  CREATE TABLE likes(
			     like_id INT PRIMARY KEY,
                 post_id INT,
                 user_id INT,
                 liked_at DATETIME,
  
  FOREIGN KEY (user_id) REFERENCES users(user_id), 
  FOREIGN KEY (post_id) REFERENCES posts(post_id)  
  );
	
    --  Challenge 2 — JOIN Report
    INSERT INTO Comments(comment_id,post_id,user_id,comment_text,commented_at)
    VALUES
    (1,2,3,'wow!',NOW()),
    (2,1,3,'nice!',NOW()),
    (3,2,4,'sweet!',NOW()),
    (4,3,5,'wonderful!',NOW()),
    (5,4,2,'keep it up!',NOW());
    INSERT INTO likes(like_id ,post_id,user_id,liked_at)
    VALUES
    (1,2,3,NOW()),
	(2,1,4,NOW()),
	(3,4,3,NOW()),
	(4,2,2,NOW()),
    (5,3,1,NOW()); 
    
    SELECT u.user_id,u.username,p.caption,
    COUNT(DISTINCT likes.like_id) as Total_like,
	COUNT(DISTINCT Comments.comment_id) as Total_comment
    FROM posts p
    JOIN users u
    ON p.user_id=u.user_id
    LEFT JOIN likes
    ON p.post_id=likes.post_id
    LEFT JOIN comments
    ON p.post_id=comments.post_id
    GROUP BY u.user_id,u.username,p.caption,p.post_id;
    -- Challenge 3 — Built-in Functions using join 
    
    SELECT username,UPPER(username) AS UpperUsername,length(caption) AS CaptionLength ,monthname(posted_at) AS MonthName
    FROM users
    JOIN posts
    ON posts.user_id=users.user_id;
    --  simple
    SELECT username,UPPER(username) AS UpperUsername
    FROM users;
     SELECT length(caption) AS CaptionLength
    FROM posts;
     SELECT monthname(posted_at) AS MonthName
    FROM posts;
    
    
    --  Challenge 4 — UNION
    
    SELECT user_id
    FROM likes
    UNION
    SELECT user_id
    FROM comments;
    --  if you want users name
    SELECT u.username
    FROM users u
    JOIN likes l
    On l.user_id=u.user_id
    UNION
    SELECT username
    FROM users u
    JOIN Comments c
    ON c.user_id=u.user_id;
    

             

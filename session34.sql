USE socialmediadb;
--  SESSION 34 – VIEWS & TRIGGERS
/*Challenge 1 — View
Create a view post_summary showing:
· post_id
· username
· caption
· total likes
· total comments*/
 DROP VIEW IF EXISTS post_summary; 
CREATE VIEW post_summary AS
SELECT p.post_id ,
       u.username,
       p.caption,
       COUNT(DISTINCT l.like_id)AS total_likes,
       COUNT(DISTINCT c.comment_id)AS total_comments
FROM posts p
JOIN users u 
    ON p.user_id=u.user_id
LEFT JOIN likes l 
    ON p.post_id=l.post_id
LEFT JOIN comments c 
    ON p.post_id=c.post_id
 GROUP BY
 p.post_id,
 u.username,p.caption;
       
SELECT * FROM post_summary;
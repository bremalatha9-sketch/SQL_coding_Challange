
--  SESSION 33 – FUNCTIONS, SUBQUERIES, STORED PROCEDURES
--  Challenge 1 — User Defined Function
USE socialmediadb;

DELIMITER $$ 
CREATE FUNCTION GetUserEngagement(uid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_likes INT;
    DECLARE total_comments INT;
    
    SELECT COUNT(*) INTO total_likes
	FROM likes
    WHERE user_id=uid;
    SELECT COUNT(*) INTO total_comments
	FROM comments
    WHERE user_id=uid;
    RETURN total_likes + total_comments; 
END$$
DELIMITER ;
SELECT GetUserEngagement(3);
--  Challenge 2 — Subquery
--  Find users who have more followers than the average follower count

INSERT INTO followers(follower_id,following_id)
VALUES (1,4),(3,1),(2,1),(4,2),(4,1);
SELECT follower_id,following_id FROM followers;
SELECT 
    u.user_id,u.username,
    COUNT(f.follower_id) AS follower_count
FROM users u
LEFT
  JOIN followers f
    ON u.user_id = f.following_id
GROUP BY u.user_id, u.username
HAVING COUNT(f.follower_id) > (
    SELECT AVG(follower_count)
    FROM (
        SELECT COUNT(follower_id) AS follower_count
        FROM followers
        GROUP BY following_id
    ) AS follower_counts
); 

DELIMITER //
--  Challenge 3 — Stored Procedure
--  Stored procedure to retrieve all posts for a given username.

CREATE PROCEDURE GetUserPosts(IN uname VARCHAR(50))
BEGIN
    SELECT 
        p.post_id,
        p.caption,
        p.posted_at
    FROM posts p
    JOIN users u
        ON p.user_id = u.user_id
    WHERE u.username = uname;
END //

DELIMITER ;
CALL GetUserPosts('viji002');
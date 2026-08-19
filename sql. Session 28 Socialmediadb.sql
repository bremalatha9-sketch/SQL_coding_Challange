-- SESSION 28 – DDL (CREATE, ALTER, DROP, RENAME, TRUNCATE)
--  Challenge 1 — Create Database

CREATE DATABASE Socialmediadb  ;
--  Challenge 2 — Create Table  --
USE Socialmediadb  ;
CREATE TABLE users (
user_id INT,
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









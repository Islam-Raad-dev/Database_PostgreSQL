-- DML - Data Manipulation Language



-- Insert Into Statement
INSERT INTO users ("username", "email", "age") 
VALUES ('ali_99', 'ali@example.com', 22);


-- Update Statement
UPDATE users 
SET email = 'ali.new@example.com'
WHERE id = 1;


-- Delete Statement
DELETE FROM users 
WHERE id = 1;


-- Select Into Statement
CREATE TABLE users_backup AS 
SELECT id, username, email 
FROM users 
WHERE status = 'active';


-- Insert Into ..Select From Statement
INSERT INTO archive_users (user_id, username, archived_at)
SELECT id, username, NOW()
FROM users
WHERE status = 'deleted';

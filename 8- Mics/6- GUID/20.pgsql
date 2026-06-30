-- UUID (Universally Unique Identifier)


CREATE TABLE users (
    user_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username) VALUES ('Ali_Mosul');
INSERT INTO users (username) VALUES ('Omar_Dev');

SELECT * FROM users;

SELECT * FROM Employees 
ORDER BY random() 
LIMIT 10;
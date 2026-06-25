--   Identity Field (Auto Increment)
 
CREATE TABLE users (                       
    user_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,     
    username VARCHAR(50) NOT NULL                         
);                   
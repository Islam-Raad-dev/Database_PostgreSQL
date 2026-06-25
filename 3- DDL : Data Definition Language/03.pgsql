-- DDL - Alter Table Statement
       

-- Add Column

ALTER TABLE Users 
ADD COLUMN PhoneNumber VARCHAR(15);


-- Rename Column

ALTER TABLE Users 
RENAME COLUMN Email TO UserEmail;


-- Rename a table

ALTER TABLE Users 
RENAME TO AppUsers;


-- Modify a column

ALTER TABLE Users 
ALTER COLUMN Age TYPE BIGINT;


-- Delete a column

ALTER TABLE Users 
DROP COLUMN IsActive;
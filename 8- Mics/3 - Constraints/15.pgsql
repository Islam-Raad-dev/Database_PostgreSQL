--   UNIGUE Constraint

CREATE TABLE Employees (
    id INT NOT NULL UNIGUE,
    name VARCHAR(100) NOT NULL,
    hiredate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id)
);

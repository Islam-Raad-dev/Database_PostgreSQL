--   UNIQUE Constraint

CREATE TABLE Employees (
    id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    hiredate DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id)
);

-- INDEX Constraint

CREATE INDEX idx_users_email ON users(email);

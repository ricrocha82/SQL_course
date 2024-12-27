-- primary key (PK) and foreign key (FK)

-- PK needs to be unique and non NULL
-- payment_id is the PK
SELECT *
FROM payment

-- FK = referencing table or child table


-- CREATE a table
-- CREATE TABLE table_name (
--     column_name TYPE column_constraint,
--     column_name TYPE column_constraint,
--     table_constraint table_constraint
-- ) INHERITS existing_table_name; -- just in case you have another table that you want to inherit from (all the columns of its parent table) 

-- CREATE TABLE players (
--     player_id SERIAL PRIMARY KEY,
--     player_name VARCHAR(50) NOT NULL,
--     player_age SMALLINT NOT NULL, -- you cannot leave this column NULL
--     player_team VARCHAR(50) NOT NULL
-- );


-- you cannot overwrite a table that already exists
CREATE TABLE account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
)

-- let's create other tables and link them to the account table
CREATE TABLE job (
    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(200) UNIQUE NOT NULL
)

CREATE TABLE account_job (
    user_id INTEGER REFERENCES account(user_id), -- it's gonna be a FK, this is why we ae putting it as an integer
    job_id INTEGER REFERENCES job(job_id),
    hired_date TIMESTAMP
)

-- ====================
-- ====================
-- INSERT
-- to insert rows into a table
SELECT * FROM account;

INSERT INTO account (username, password, email, created_on)
VALUES 
('Jose', '1234','j.myname@meme.com', CURRENT_TIMESTAMP);

SELECT * FROM account;


SELECT * FROM job;

INSERT INTO job (job_name)
VALUES
('analyst');

SELECT * FROM job;

INSERT INTO job (job_name)
VALUES
('manager');

SELECT * FROM job;


SELECT * FROM account_job;

INSERT INTO account_job(user_id, job_id, hired_date)
VALUES
(1, 1, CURRENT_TIMESTAMP);

SELECT * FROM account_job;

-- let's try to add user_id and job_id that do not exist in other tables
INSERT INTO account_job(user_id, job_id, hired_date)
VALUES
(10, 20, CURRENT_TIMESTAMP); -- it needs to have a user_id and job_id that already exist in the account and job tables

-- ====================
-- ====================
-- UPDATE
-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP
-- WHERE last_login IS NULL; -- you can run without WHERE clause (update all the rows)

-- -- UPDATE JOIN
-- UPDATE TableA
-- SET original_col = TableB.new_col
-- FROM TableB
-- WHERE tabkeA.id = TableB.id; -- this will update the original_col in TableA with the new_col in TableB where the id is the same

SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on; -- copy the created_on value to the last_login column


SELECT * FROM account_job;

UPDATE account_job
SET hired_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login; -- like of a SELECT statement

-- ====================
-- ====================
-- DELETE
-- remove rows from a table
-- DELETE FROM account_job
-- WHERE user_id = 1;

-- using columns from another table
-- DELETE FROM TableA
-- USING TableB
-- WHERe TableA.id = TableB.id;
-- can add RETURNING clause

INSERT INTO job(job_name)
VALUES
('developer');

SELECT * FROM job;

DELETE FROM job
WHERE job_name = 'developer' -- if WHERE is not used, it will remove all the rows
RETURNING job_name;

-- ====================
-- ====================
-- ALTER
-- allows changes to an existing table

-- ADD COLUMN
-- ALTER TABLE table_name
-- ADD COLUMN new_col TYPE;

-- -- REMOVE column
-- ALTER TABLE table_name
-- DROP COLUMN new_col;

-- -- Alter constraint
-- ALTER TABLE table_name
-- ALTER COLUMN new_col 
-- -- you can add different things, like:
-- SET DEFAULT value;
-- DROP DEFAULt value;
-- SET NOT NULL
-- ADD CONSTRAINT contraint_name;

CREATE TABLE information (
    info_id SERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    person VARCHAR(50) NOT NULL UNIQUE
)

SELECT * FROM information;

-- let's rename the table
ALTER TABLE information
RENAME TO new_info;

SELECT * FROM new_info;

-- RENAME column
ALTER TABLE new_info
RENAME COLUMN person TO people;

SELECT * FROM new_info;

-- returns an error because I need to insert  values in the people column
INSERT INTO new_info (title)
VALUES
('some new title');

-- need to remove the constraint
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info (title)
VALUES
('some new title');

SELECT * FROM new_info;

-- ====================
-- ====================
-- DROP
-- it allows for the complete removal of a column in a table
-- ALTER TABLE table_name
-- DROP COLUMN col_name;

-- remove all dependencies (CASCADE clause)
-- ALTER TABLE table_name
-- DROP COLUMN col_name CASCADE;

-- if the column does not exisits, it will return an errors
-- so you can use the IF EXISTS clause
-- ALTER TABLE table_name
-- DROP COLUMN IF EXISTS col_name;

-- remove multiple row
-- ALTER TABLE table_name
-- DROP COLUMN col_name
-- DROP COLUMN col_name;

SELECT * FROM new_info;

ALTER TABLE new_info
DROP COLUMN people;

SELECT * FROM new_info;

-- ====================
-- ====================
-- CHECK 
-- it allows for the definition of a condition that must be met before data can be inserted or updated

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATe CHECK (birthdate > '1900-01-01'),
    hire_date DATE CHECK (hire_date > birthdate),
    salary INTEGER CHECK (salary > 0)
)

-- an error will appear because of CHECK
INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
('Jose', 'Silva', '1890-01-01', '2020-01-01', 1000);
-- try again
INSERT INTO employees (first_name, last_name, birthdate, hire_date, salary)
VALUES
('Jose', 'Silva', '1990-01-01', '2020-01-01', 1000);
-- the serial account for the failed attempets
SELECT * FROM employees;
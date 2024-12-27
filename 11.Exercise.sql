-- Create a new database called 
-- "School" this database should have two tables: teachers and students.

-- The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL, 
    homeroom_number INTEGER NOT NULL, 
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(250) UNIQUE,
    graduation_year INTEGER NOT NULL
);

-- The teachers table should have columns for teacher_id, first_name, last_name,
CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    homeroom_number INTEGER NOT NULL, 
    department VARCHAR(150) NOT NULL, 
    email VARCHAR(250) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE
);


INSERT INTO students (first_name, last_name, homeroom_number, phone, graduation_year)
VALUES
('Mark', 'Watney', '5', '777-555-1234', 2035)

SELECT * FROM students;

INSERT INTO teachers (first_name, last_name, homeroom_number, department, email, phone)
VALUES
('Jonas', 'Salk', '5', 'Biology','jsalk@school.org', '777-555-4321')

SELECT * FROM teachers;
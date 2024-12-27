-- shortcut to run a code line (select and press 2x ctrl+e)
-- to see the strucutre of the database:
-- go to the connections and click on the database
-- then go databse -> Schemas -> public -> Tables

-- 1) SELECT Statement
-- SELECT column_name FROM tabel_name
-- SELECT column1, column2 FROM table_x
-- SELECT * = all the table (only if you want all the table bc it will increase time processing)
-- a) first practice (all the table actor)
SELECT * FROM actor;
-- b) select two columns
SELECT first_name, last_name FROM actor;
-- c) Challenge
-- translate business Q into a Query
-- get the first and last name of every customer and their email address
SELECT first_name, last_name , email FROM customer;

--4) DISTINCT
-- SELECT DISTINCT (unique values)
-- SELECT DISTINCT (column) FROM table -- can use () or not
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT rental_rate FROM film;
--a) Challenge
-- what unique types of ratings we have in our database?

-- 6) COUNT: returns the number of rows that matches a specified criterion.
-- COUNT is a function, so it needs a paranthese
-- SELECT COUNT(name) FROM table;
-- get the number of distinc names
-- SELECT COUNT(DISTINCT name)
-- FROM table;
SELECT * FROM payment;
-- number of rows in the payment dataset
SELECT COUNT(*) FROM payment;
-- or just get one column to calculate the nrow
SELECT COUNT(amount) FROM payment;
-- number of disting payment types
SELECT COUNT (DISTINCT amount)  
FROM payment;

-- 7) SELECT WHERE: select specific condition to the rows to be returned
-- there many type of operators (e.g., greater than, equal to, etc)
-- logical operator (AND, OR, NOT)
-- SELECT name, choice
-- FROM table
-- WHERE name = 'David';
-- or
-- SELECT name, choice
-- FROM table
-- WHERE name = 'David' AND choice = 'Red'
SELECT * FROM customer;

SELECT * 
FROM customer
WHERE first_name = 'Jared';

SELECT *
FROM film
WHERE rental_rate > 4;

SELECT *
FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT title
FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT COUNT(title)
FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'
-- or
SELECT COUNT(*)
FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R'

SELECT COUNT(*)
FROM film
WHERE rating = 'R' OR rating = 'PG-13';

SELECT COUNT(*)
FROM film
WHERE rating != 'R';

-- a) Challenge
-- Q1: track down the email of the customer called Nacy Thomas
SELECT first_name, last_name, email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';
-- Q2: What is the film 'Outlaw Hanky' is about? 
-- give the descrition of the movie
SELECT description 
FROM film 
WHERE title = 'Outlaw Hanky';
-- Q3: Get the phone number of the customer who lives at '259 Ipoh Drive'
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive';

-- 8) ORDER BY
-- it is allways the last command in a query
-- can order multiple columns

-- SELECT colum1, column2
-- FROM table
-- ORDER BY column1 ASC / DESC;

-- SELECT colum1, column2, column3
-- FROM table
-- ORDER BY column2, column1 ASC / DESC;

SELECT *
FROM customer
ORDER BY first_name;

SELECT *
FROM customer
ORDER BY first_name DESC;

SELECT store_id, first_name,last_name
FROM customer
ORDER BY store_id, first_name;
-- we can order by columns that we haven't selected
SELECT first_name,last_name
FROM customer
ORDER BY store_id DESC, first_name ASC;

-- 9) LIMIT = head()
-- it goes at the very end of the query request
-- is the last command to be executed
SELECT * 
FROM payment
ORDER BY payment_date
LIMIT 10; -- number of rows

SELECT *
FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

-- a) Challenge Tasks
-- what are the customer ids of the first 10
-- customers who created a payment
SELECT customer_id
FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- what ae the titles
-- of the 5 shortest (in length and runtime) movies?
SELECT title,length
FROM film
ORDER BY length ASC
LIMIT 5;

-- if the previous customer can watch any movie 
-- that is 50 minutes or less in run time,
-- how many option does she have?
SELECT COUNT(title)
FROM film
WHERE length <= 50;

-- 10) BETWEEN and NOT BETWEEN
-- the BETWEEN operator is the same asÇ
-- value >= low AND value <= high 
-- can be used with dates (YYYY-MM-DD)

-- let's check the payment table
SELECT *
FROM payment
LIMIT 2;
-- use between in the amount column
SELECT *
FROM payment
-- amount between 8 and 9
WHERE amount BETWEEN 8 AND 9;
-- counting
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 8 AND 9;
-- counitng the amount not between 8 and 9 
SELECT COUNT(*)
FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

-- date
-- be careful with the hours (until 00:00:00)
SELECT *
FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
-- the output just get the day until the 14th.
-- it didn't include the 15th
-- if you run 
SELECT *
FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14';
-- the outpu is empty

-- 11) IN and NOT IN
-- check for multiple possible value option
-- it is like the %in% c()
-- SELECT *
-- FROM table
-- WHERE color IN ('red', 'blue',...)
-- check the table
SELECT DISTINCT amount
FROM payment
ORDER BY amount;
-- 
SELECT *
FROM payment
WHERE amount IN (0.99, 1.98, 1.99);
-- how many payments
SELECT COUNT(*)
FROM payment
WHERE amount IN (0.99, 1.98, 1.99);
-- how many payments not
SELECT COUNT(*)
FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);
-- check names
SELECT *
FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');

-- 12) LIKE and ILIKE
-- LIKE = case sensitive
-- ILIKE - case insensitive

-- it allows us to match against string data 
-- using WILDCARDS (e.g. % and _, or other REGEX)

-- % = matches any sequence of characters
-- ALL names that begin with A
-- WHERE name LIKE 'A%'

-- All names that end with an 'a'
-- WHERE name LIKE '%a'

-- _ = matches any single character (just a single character)
-- get all Mission Impossible films
-- WHERE title LIKE 'Mission Impossible _'
-- can use more than one _
-- WHERE value LIKE 'VERSION_____'

-- we can combine both
-- WHERE name LIKE '_her%'
-- Cheryl
-- Theresa
-- Sherri

-- check the customers that the first name start with J
SELECT * 
FROM customer
WHERE first_name LIKE 'J%';
-- and the last name with S
SELECT * 
FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * 
FROM customer
WHERE first_name LIKE '%er%';

SELECT * 
FROM customer
WHERE first_name LIKE '_her%';

SELECT * 
FROM customer
WHERE first_name NOT LIKE '%er%';

SELECT * 
FROM customer
WHERE first_name LIKE 'A%'
ORDER BY last_name;

SELECT * 
FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

-- A) GENERAL CHALLENGE 1
-- How many payment traansactions where greater then $5.00
SELECT COUNT(*)
FROM payment
WHERE amount > 5;

-- how many actors have a first name that starts with the letter 'P'
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';

-- how many unique districts are our custmers from?
SELECT COUNT(DISTINCT(district))
FROM address;
-- retrieve the list of names for those
-- distinct districts from the previous Q
SELECT DISTINCT(district)
FROM address;

-- How many films have a ration of R
-- and a replacement cost between 5 and 15 dollars?
SELECT COUNT(*)
FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15;

-- how many films have the word Truman
-- somewhere in the title
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';
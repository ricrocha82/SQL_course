-- 1. MATHEMATICAL OPERATORS

-- https://www.postgresql.org/docs/current/functions-math.html

-- return a column divided by another column
SELECT rental_rate/replacement_cost 
FROM film;

SELECT ROUND(rental_rate/replacement_cost)*100 AS percent_cost
FROM film;

SELECT 0.1 * replacement_cost AS deposit
FROM film;


--  2. STRING OPERATORS
-- https://www.postgresql.org/docs/current/functions-string.html

-- return the length of a string
SELECT LENGTH(first_name)
FROM customer;

-- concatenate two strings (here there is no space between columns)
SELECT first_name || last_name
FROM customer;

-- concatenate two strings
SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT UPPER(first_name) || '_' || UPPER(last_name) AS full_name
FROM customer;

-- create an email column
-- use LEFT to get the first letter of the first name
SELECT LOWER(LEFT(first_name, 1)) || '.' || LOWER(last_name) || '@gmail.com' AS email
FROM customer;
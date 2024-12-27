-- 1) Aggregate functions (https://www.postgresql.org/docs/current/functions-aggregate.html)

-- The most commonly used SQL aggregate functions are:

-- MIN() - returns the smallest value within the selected column
-- MAX() - returns the largest value within the selected column
-- COUNT() - returns the number of rows in a set
-- SUM() - returns the total sum of a numerical column
-- AVG() - returns the average value of a numerical column

-- Aggregate functions ignore null values (except for COUNT()).

-- minimum and maximum replacement cost
-- return only one value
SELECT MIN(replacement_cost) 
FROM film;

SELECT MAX(replacement_cost) 
FROM film;

SELECT MIN(replacement_cost), MAX(replacement_cost)
FROM film;

SELECT COUNT(film_id) 
FROM film;

-- it return 10 decimals places
SELECT AVG(replacement_cost)
FROM film;
-- use ROUND to reduce decimal places
SELECT ROUND(AVG(replacement_cost),2)
FROM film;

SELECT SUM(replacement_cost)
FROM film;


-- 1) GROUP BY
-- same as tidyverse

-- GROUP BY must appear rigth after FROM or WHERE:

-- SELECT column1, AGG(data_col)
-- FROM table
-- GROUP BY column1

-- SELECT column1, AGG(data_col)
-- FROM table
-- WHERE column1 = 'C'
-- GROUP BY column1;

-- in the SELECT statement, columns must either
-- have an aggregate function or be in the GROUP BY call

-- SELECT company,division, SUM(sales)
-- FROM finance_table
-- GROUP BY company, division;

-- SELECT COUNT(CustomerID), Country
-- FROM Customers
-- GROUP BY Country
-- ORDER BY COUNT(CustomerID) DESC
-- LIMIT 10;

-- like running SELECT DISTINCT
SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- what customer spending the must money
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;
-- how many transactions per customer
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

-- spending per staff_if per customer
SELECT customer_id,staff_id , SUM(amount)
FROM payment
GROUP BY staff_id,customer_id
ORDER BY customer_id;

-- group by date
-- it needs a special function
-- it removes the minutes
SELECT customer_id,DATE(payment_date)
FROM payment;

SELECT DATE(payment_date), SUM(amount)
FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

-- a) CHALLENGES
-- how many payments did each staff member handle and 
-- who gets the bonus?
SELECT * FROM payment;

SELECT staff_id,COUNT(amount)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC;

-- what is the AVG replacement cost per MPAA rating
SELECT * FROM film
LIMIT 5;

SELECT rating,ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

-- top 5 customers by total spend
SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- 3) HAVING
-- filtering after aggregations

-- SELECT company, SUM(sales)
-- FROM finance_table
-- WHERE company !='GOOGLE'
-- GROUP BY company
-- HAVING SUM(sales) > 1000;

SELECT customer_id, SUM(amount)
FROM payment
-- WHERE customer_id NOT IN (184, 87, 477)
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- a) CHALLENGES
-- what customer_ids are aligible for platinum status
-- transactions >=40
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

-- what are the customer ids of customers who have spent
-- more than $100 in oayment transactions
-- with our staff_if member 2
SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;
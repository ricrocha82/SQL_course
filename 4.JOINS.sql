-- REFs:
-- https://en.wikipedia.org/wiki/Join_(SQL)
-- https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/

-- types of joins:
-- INNER
-- OUTER
-- FULL
-- UNIONS

-- 1) AS clause
-- it is kind of alias
SELECT amount AS rental_price
FROM payment;

SELECT SUM(amount) AS total_sum
FROM payment;

SELECT COUNT(amount) AS num_transactions
FROM payment;

-- AS only works at the very end of the query
-- it means that total_spent wil be created when all the query is executed
-- so, to filter you need to pass the name of the old column
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
-- HAVING total_spent > 100 # can't do it
HAVING SUM(amount) > 100;

SELECT customer_id, amount AS new_name
FROM payment
-- WHERE new_name > 2;
WHERE amount > 2;


-- 2) INNER JOIN
-- SELECT * 
-- FROM tableA
-- INNER JOIN TableB
-- ON TableA.col_match = TableB.col_match

SELECT *
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

-- if the column is unique in one datset
-- it is not necessary to specify the datset name before the column
SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;




-- 3) FULL JOINs
-- 3.1) FULL OUTER JOIN
-- if there is no matching, it will produce 'null'
-- SELECT *
-- FROM Registrations
-- FULL OUTER JOIN Logins
-- ON Registrations.name = Logins.name

-- if you want to get only null values
-- the opposite of INNER JOIN
-- SELECT *
-- FROM Registrations
-- FULL OUTER JOIN Logins
-- ON Registrations.name = Logins.name
-- WHERE Registrations.reg_id IS null OR Logins.log_id IS null

SELECT *
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null OR payment.payment_id IS null;


-- 3.2) LEFT OUTER JOIN
-- Order matters !!!
-- it removes the unique values of the rigth dataset

-- find films that don';'t have inventory
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null


-- 3.3) RIGhT OUTER JOIN
-- the opposite of LEFT JOIN
-- just switch the table order
-- avoid using RIGHT JOIN
SELECT film.film_id, title, inventory_id, store_id
FROM inventory
RIGHT JOIN film
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null

-- 3.4) UNION
-- combine the result-set of two or more SELECT statements.
-- SELECT column_name(s) FROM table1
-- UNION
-- SELECT column_name(s) FROM table2;

-- SELECT City FROM Customers
-- UNION
-- SELECT City FROM Suppliers
-- ORDER BY City;


-- a) CHALLENGES
-- What are the emails of the customers who live in California?
SELECT district, email
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

-- Get a list of all the movies "Nick Wahlberg" has been in.
-- actor, film_actor, film
SELECT title, first_name, last_name FROM actor
LEFT JOIN film_actor ON (actor.actor_id = film_actor.actor_id)
LEFT JOIN film ON (film_actor.film_id = film.film_id)
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';
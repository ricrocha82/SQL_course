-- it is a join of two copies of the same table
-- it is necessary to use an ALIS

-- SELECT tableA.col, tableB.col
-- FROM table AS tableA
-- JOIN table AS table B ON
-- tableA.some_col = tableB.other_col;

-- find the length of the films and group them by length
SELECT title, length
FROM film
WHERE length = 117;

-- so, I need two copies of the same table
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 
ON f1.film_id != f2.film_id AND f1.length = f2.length;
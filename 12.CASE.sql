-- CASE (like case_when in R)

-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ELSE result3
-- END

-- SELECT a,
--     CASE 
--         WHEN a = 1 THEN 'one'
--         WHEN a = 2 THEN 'two'
--     ELSE 'other' 
--     END
-- FROM test;


-- - CASE expression 
-- CASE expression
--     WHEN value1 THEN result1
--     WHEN value2 THEN result2
--     ELSE some_result_different
-- END

-- SELECT a,
--     CASE a (I added a here)
--         WHEN 1 THEN 'one' (and removed a from here)
--         WHEN 2 THEN 'two' (and removed a from here)
--     ELSE 'other' AS label (named the new column)
--     END
-- FROM test;

SELECT * 
FROM customer;

-- customer preference
SELECT customer_id,
    CASE
        WHEN (customer_id <= 100) THEN 'Premium'
        WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
        ELSE 'Regular'
    END AS customer_preference
FROM customer

-- using expression (when looking for equallity)
SELECT customer_id,
    CASE customer_id
        WHEN 2 THEN 'Winner'
        WHEN 5 THEN '2n place'
        ELSE 'Loser'
    END AS raffle_results
FROM customer


SELECT * 
FROM film;

-- making categories based on the rental_rate
SELECT 
    CASE rental_rate
        WHEN 0.99 THEN 1
        ELSE 0
    END
FROM film

-- how many 0.99 cents films I have?
SELECT 
SUM(CASE rental_rate
        WHEN 0.99 THEN 1
        ELSE 0
    END) As number_of_bargains,
SUM(CASE rental_rate
        WHEN 2.99 THEN 1
        ELSE 0
    END) As number_of_regulars,
SUM(CASE rental_rate
        WHEN 4.99 THEN 1
        ELSE 0
    END) As number_of_premiums
FROM film;


-- CHALLENGE
SELECT 
SUM(CASE rating
        WHEN 'R' THEN 1
        ELSE 0
    END) As R,
SUM(CASE rating
        WHEN 'PG' THEN 1
        ELSE 0
    END) As PG,
SUM(CASE rating
        WHEN 'PG-13' THEN 1
        ELSE 0
    END) As PG13
FROM film;

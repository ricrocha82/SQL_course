-- 1) Timestamps and extract
-- REF: https://www.postgresql.org/docs/current/functions-formatting.html
-- time
-- date
-- timestamp - date + time
-- timestamptz - date + time + timezone

-- 1.a) Functions
-- they are useful to create databases or do some automatic queries
-- SHOW
SHOW ALL
-- TIMEZONE
SHOW TIMEZONE
-- NOW
SELECT NOW()
-- TIMEOFDAY
SELECT TIMEOFDAY()
-- CURRENT_TIME
SELECT CURRENT_TIME
-- CURRENT_DATE
SELECT CURRENT_DATE

-- EXTRACT()
-- year, month, day, week, quarter, dayofweek
-- EXTRACT(YEAR FROM column1)
SELECT EXTRACT(YEAR FROM payment_date) AS my_year
FROM payment;

SELECT EXTRACT(MONTH FROM payment_date) AS my_month
FROM payment;

-- AGE()
-- AGE(column1)
SELECT AGE(payment_date)
FROM payment;

-- TO_CHAR()
-- convert time into character
-- TO_CHAR(column1, 'mm-dd-yyyy')
SELECT TO_CHAR(payment_date, 'dd-mm-yyyy')
FROM payment;

SELECT TO_CHAR(payment_date, 'MONTH / yyyy')
FROM payment;

SELECT TO_CHAR(payment_date, 'mon/yyyy')
FROM payment;

SELECT TO_CHAR(payment_date, 'mm-dd-yyyy')
FROM payment;

-- a) CHALLENGES
-- During which months did payment occur?
-- format your answer to return back the full month name
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- How many payments occured on a Monday?
-- PostgreSQL consider sunday as 0
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;




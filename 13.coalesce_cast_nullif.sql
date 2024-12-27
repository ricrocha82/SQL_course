-- COALLESCE (for null values)
-- it returns the first non-null value in a list
-- SELECT COALESCE (1,2)
-- SELECT COALESCE (NULL, 1,2)

-- it replaces NULL values with a specific value
-- if discount is NULL, then it will be replaced by 0
SELECT item, (price - COALESCE(discount,0)) AS final
FROM tableA;


-- =============================================
-- =============================================

-- CAST
-- it converts a value from one data type to another
-- SELECT CAST('2019-01-01' AS DATE)
-- SELECT CAST('5' AS INTEGER)
-- SELECT '5'::INTEGER -- only for PostgresSQL
SELECT CAST('5' AS INTEGER) AS new_int
SELECT '5'::INTEGER



SELECT * FROM rental;

-- how many digits within inventory_id (char_length)
SELECT inventory_id, CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) AS digits
FROM rental
ORDER BY digits 



-- =============================================
-- =============================================

-- NULLIF
CREATE TABLE depts (
    first_name VARCHAR(50),
    department VARCHAR(50)
)

INSERT INTO depts (
    first_name,
    department
) 
VALUES
('Mario', 'a'),
('Ana', 'b'),
('Vik', 'a');

SELECT *
FROM depts;

-- calculate the ratio between departments
SELECT (
        SUM(CASE WHEN department = 'a' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN department = 'b' THEN 1 ELSE 0 END)
        ) AS dept_ratio
FROM depts

-- the person from B left he company
DELETE FROM depts
WHERE department = 'b';

-- an error will be thrown because we are dividing by 0
SELECT (
        SUM(CASE WHEN department = 'a' THEN 1 ELSE 0 END) /
        SUM(CASE WHEN department = 'b' THEN 1 ELSE 0 END)
        ) AS dept_ratio
FROM depts

-- we can use NULLIF to avoid the error
SELECT (
        SUM(CASE WHEN department = 'a' THEN 1 ELSE 0 END) /
        NULLIF(SUM(CASE WHEN department = 'b' THEN 1 ELSE 0 END),0) -- if it euqals to 0 then it will return NULL
        ) AS dept_ratio
FROM depts



-- =============================================
-- =============================================


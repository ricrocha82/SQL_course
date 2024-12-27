-- Views
-- view is a DB object that is of a stored query
-- it useful to use queries that you use very often
-- it like creating a function

CREATE VIEW customer_info AS
SELECT first_name, last_name, address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;


SELECT * FROM customer_info;


-- modify view
CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;


SELECT * FROM customer_info;


-- drop view
DROP VIEW IF EXISTS customer_info;

-- rename view
ALTER VIEW customer_info RENAME to c_info;

SELECT * FROM c_info;
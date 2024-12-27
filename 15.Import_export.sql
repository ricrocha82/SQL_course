-- https://stackoverflow.com/questions/2987433/how-to-import-csv-file-data-into-a-postgresql-table
-- https://www.enterprisedb.com/postgres-tutorials/how-import-and-export-data-using-csv-files-postgresql
-- https://stackoverflow.com/questions/21018256/can-i-automatically-create-a-table-in-postgresql-from-a-csv-file-with-headers

-- it not creates a table for you, you have to create it first

-- create a very simple csv table and save it in Doenloads folder

CREATE TABLE simple_table (
    a INTEGER,
    b INTEGER,
    c INTEGER
)


SELECT * FROM simple_table

-- do the thing in the pgAdmin

-- to export you can just click in the export button in the pgAdmin or Vscode
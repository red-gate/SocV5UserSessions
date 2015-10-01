ALTER TABLE customers ADD first_name VARCHAR(25) NULL, last_name VARCHAR(25) NULL
GO

UPDATE customers SET first_name = SUBSTRING(name, 1, CHARINDEX(' ', name) - 1),
                     last_name  = SUBSTRING(name,    CHARINDEX(' ', name) + 1, LEN(name))
GO

ALTER TABLE customers ALTER COLUMN first_name VARCHAR(25) NOT NULL
ALTER TABLE customers ALTER COLUMN last_name  VARCHAR(25) NOT NULL
ALTER TABLE customers DROP COLUMN name
GO

INSERT INTO countries VALUES ('SC', 'Scotland')
GO

INSERT INTO states VALUES ('SC', '', '')
GO

UPDATE customers SET state_code = '', country_code = 'SC' WHERE state_code = 'SCT' AND country_code = 'UK'
GO

DELETE FROM states WHERE state_code = 'SCT' AND country_code = 'UK'
GO

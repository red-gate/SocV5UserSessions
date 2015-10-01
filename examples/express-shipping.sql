UPDATE customers SET express_shipping = 'TRUE' WHERE express_shipping IS NULL
GO

ALTER TABLE customers ALTER COLUMN express_shipping BIT NOT NULL
GO

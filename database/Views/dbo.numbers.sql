SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[numbers] WITH SCHEMABINDING AS
    SELECT     n AS mobile_number,
               customer_id
    FROM       dbo.EnumerableRange(07700900110, 890)
    LEFT JOIN  dbo.customers ON mobile_number = n
GO

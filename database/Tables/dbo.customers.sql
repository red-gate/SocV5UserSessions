CREATE TABLE [dbo].[customers]
(
[customer_id] [int] NOT NULL IDENTITY(1, 1),
[title] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[address_line1] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[address_line2] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[postcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[state_code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[country_code] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[express_shipping] [bit] NULL,
[mobile_number] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK__customer__CD65CB85F8E1663E] PRIMARY KEY CLUSTERED  ([customer_id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [UQ__customer__30462B0F725B335D] UNIQUE NONCLUSTERED  ([mobile_number]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK__customers__182C9B23] FOREIGN KEY ([country_code], [state_code]) REFERENCES [dbo].[states] ([country_code], [state_code])
GO

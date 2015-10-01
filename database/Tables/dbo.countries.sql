CREATE TABLE [dbo].[countries]
(
[country_code] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[country_name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [PK__countrie__3436E9A4146C6359] PRIMARY KEY CLUSTERED  ([country_code]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [UQ__countrie__F70188944E12984B] UNIQUE NONCLUSTERED  ([country_name]) ON [PRIMARY]
GO

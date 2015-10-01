CREATE TABLE [dbo].[states]
(
[country_code] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[state_code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[state_name] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [PK__states__0C51C004A9D33AA2] PRIMARY KEY CLUSTERED  ([country_code], [state_code]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [UQ__states__9CE427BC9EBA9628] UNIQUE NONCLUSTERED  ([country_code], [state_name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [FK__states__country___145C0A3F] FOREIGN KEY ([country_code]) REFERENCES [dbo].[countries] ([country_code])
GO

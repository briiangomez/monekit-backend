USE [MonekitRead]
GO
/****** Object:  User [test]    Script Date: 19/10/2021 21:34:33 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[ColorA] [tinyint] NOT NULL,
	[ColorR] [tinyint] NOT NULL,
	[ColorG] [tinyint] NOT NULL,
	[ColorB] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[UserId] [nvarchar](36) NOT NULL,
	[UniqueCode] [nvarchar](128) NOT NULL,
	[Symbol] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UniqueCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[TargetCurrency] [nvarchar](max) NULL,
	[SourceCurrency] [nvarchar](max) NULL,
	[Rate] [float] NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExchangeRates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseTemplates]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseTemplates](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Currency] [nvarchar](max) NULL,
	[When] [datetime2](7) NULL,
	[CategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ExpenseTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incomes]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incomes](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](max) NULL,
	[When] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Incomes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutcomeCategories]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeCategories](
	[OutcomeId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OutcomeCategories] PRIMARY KEY CLUSTERED 
(
	[OutcomeId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outcomes]    Script Date: 19/10/2021 21:34:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outcomes](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](max) NULL,
	[When] [datetime2](7) NOT NULL,
	[IsFixed] [int] NOT NULL,
 CONSTRAINT [PK_Outcomes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200828082839_Initial', N'6.0.0-rc.1.21452.10')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210513132828_FixedExpenses', N'6.0.0-rc.1.21452.10')
GO
ALTER TABLE [dbo].[Outcomes] ADD  DEFAULT (CONVERT([int],(0))) FOR [IsFixed]
GO
ALTER TABLE [dbo].[OutcomeCategories]  WITH CHECK ADD  CONSTRAINT [FK_OutcomeCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutcomeCategories] CHECK CONSTRAINT [FK_OutcomeCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[OutcomeCategories]  WITH CHECK ADD  CONSTRAINT [FK_OutcomeCategories_Outcomes_OutcomeId] FOREIGN KEY([OutcomeId])
REFERENCES [dbo].[Outcomes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutcomeCategories] CHECK CONSTRAINT [FK_OutcomeCategories_Outcomes_OutcomeId]
GO

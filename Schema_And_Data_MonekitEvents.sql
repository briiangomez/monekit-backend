USE [MonekitEvents]
GO
/****** Object:  User [test]    Script Date: 19/10/2021 21:34:09 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/10/2021 21:34:09 ******/
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
/****** Object:  Table [dbo].[Command]    Script Date: 19/10/2021 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Command](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommandID] [uniqueidentifier] NOT NULL,
	[CommandType] [nvarchar](max) NULL,
	[Payload] [nvarchar](max) NULL,
	[RaisedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Command] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 19/10/2021 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [uniqueidentifier] NOT NULL,
	[EventType] [nvarchar](max) NULL,
	[AggregateID] [uniqueidentifier] NOT NULL,
	[AggregateType] [nvarchar](max) NULL,
	[Payload] [nvarchar](max) NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPublishedToHandler]    Script Date: 19/10/2021 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPublishedToHandler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[HandlerIdentifier] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventPublishedToHandler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnPublishedCommand]    Script Date: 19/10/2021 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnPublishedCommand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommandID] [int] NOT NULL,
	[IsHandled] [bit] NOT NULL,
 CONSTRAINT [PK_UnPublishedCommand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnPublishedEvent]    Script Date: 19/10/2021 21:34:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnPublishedEvent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
 CONSTRAINT [PK_UnPublishedEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200828082525_Initial', N'6.0.0-rc.1.21452.10')
GO
ALTER TABLE [dbo].[EventPublishedToHandler]  WITH CHECK ADD  CONSTRAINT [FK_EventPublishedToHandler_UnPublishedEvent_EventID] FOREIGN KEY([EventID])
REFERENCES [dbo].[UnPublishedEvent] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventPublishedToHandler] CHECK CONSTRAINT [FK_EventPublishedToHandler_UnPublishedEvent_EventID]
GO
ALTER TABLE [dbo].[UnPublishedCommand]  WITH CHECK ADD  CONSTRAINT [FK_UnPublishedCommand_Command_CommandID] FOREIGN KEY([CommandID])
REFERENCES [dbo].[Command] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UnPublishedCommand] CHECK CONSTRAINT [FK_UnPublishedCommand_Command_CommandID]
GO
ALTER TABLE [dbo].[UnPublishedEvent]  WITH CHECK ADD  CONSTRAINT [FK_UnPublishedEvent_Event_EventID] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UnPublishedEvent] CHECK CONSTRAINT [FK_UnPublishedEvent_Event_EventID]
GO

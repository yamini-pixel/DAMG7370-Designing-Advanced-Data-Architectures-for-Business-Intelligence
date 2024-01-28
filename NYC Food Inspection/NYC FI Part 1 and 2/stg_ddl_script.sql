USE [nyc_food_inspection]
GO

/****** Object:  Table [dbo].[stg_nyc_food_inspection]    Script Date: 18-06-2023 11:54:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_nyc_food_inspection](
	[RecordID] [int] NULL,
	[CAMIS] [int] NULL,
	[DBA] [nvarchar](95) NULL,
	[BORO] [varchar](13) NULL,
	[BUILDING] [varchar](10) NULL,
	[STREET] [varchar](40) NULL,
	[ZIPCODE] [char](5) NULL,
	[PHONE] [char](12) NULL,
	[CUISINE DESCRIPTION] [varchar](30) NULL,
	[INSPECTION DATE] [char](10) NULL,
	[ACTION] [varchar](130) NULL,
	[VIOLATION CODE] [char](5) NULL,
	[VIOLATION DESCRIPTION] [nvarchar](254) NULL,
	[CRITICAL FLAG] [char](14) NULL,
	[SCORE] [tinyint] NULL,
	[GRADE] [char](1) NULL,
	[GRADE DATE] [char](10) NULL,
	[RECORD DATE] [char](10) NULL,
	[INSPECTION TYPE] [varchar](254) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Community Board] [smallint] NULL,
	[Council District] [char](2) NULL,
	[Census Tract] [char](6) NULL,
	[BIN] [int] NULL,
	[BBL] [bigint] NULL,
	[NTA] [char](4) NULL,
	[Location Point1] [bit] NULL,
	[GradeDate_new] [date] NULL,
	[RecordDate_new] [date] NULL,
	[InspectionDate_new] [date] NULL,
	[DI_CreatedDate] [nvarchar](max) NULL,
	[DI_WorkflowFilename] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


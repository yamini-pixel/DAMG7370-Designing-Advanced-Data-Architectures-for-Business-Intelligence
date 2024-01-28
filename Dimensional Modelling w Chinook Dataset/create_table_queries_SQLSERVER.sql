USE [chinook2023]
GO

/****** Object:  Table [dbo].[Album]    Script Date: 14-06-2023 11:01:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Album](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[ArtistId] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, 
OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_AlbumArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([ArtistId])
GO

ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_AlbumArtistId]
GO


USE [chinook2023]
GO

/****** Object:  Table [dbo].[Artist]    Script Date: 14-06-2023 11:02:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Artist](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 14-06-2023 11:02:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Company] [nvarchar](80) NULL,
	[Address] [nvarchar](70) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[Email] [nvarchar](60) NOT NULL,
	[SupportRepId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, 
OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_CustomerSupportRepId] FOREIGN KEY([SupportRepId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_CustomerSupportRepId]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 14-06-2023 11:03:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[ReportsTo] [int] NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](70) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[Email] [nvarchar](60) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeReportsTo] FOREIGN KEY([ReportsTo])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EmployeeReportsTo]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Genre]    Script Date: 14-06-2023 11:03:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Invoice]    Script Date: 14-06-2023 11:03:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[BillingAddress] [nvarchar](70) NULL,
	[BillingCity] [nvarchar](40) NULL,
	[BillingState] [nvarchar](40) NULL,
	[BillingCountry] [nvarchar](40) NULL,
	[BillingPostalCode] [nvarchar](10) NULL,
	[Total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceCustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_InvoiceCustomerId]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[InvoiceLine]    Script Date: 14-06-2023 11:04:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InvoiceLine](
	[InvoiceLineId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceLine] PRIMARY KEY CLUSTERED 
(
	[InvoiceLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, 
OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLineInvoiceId] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO

ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLineInvoiceId]
GO

ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLineTrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Track] ([TrackId])
GO

ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLineTrackId]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[MediaType]    Script Date: 14-06-2023 11:04:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MediaType](
	[MediaTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK_MediaType] PRIMARY KEY CLUSTERED 
(
	[MediaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Playlist]    Script Date: 14-06-2023 11:04:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Playlist](
	[PlaylistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
 CONSTRAINT [PK_Playlist] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[PlaylistTrack]    Script Date: 14-06-2023 11:04:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PlaylistTrack](
	[PlaylistId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY NONCLUSTERED 
(
	[PlaylistId] ASC,
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistTrackPlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlist] ([PlaylistId])
GO

ALTER TABLE [dbo].[PlaylistTrack] CHECK CONSTRAINT [FK_PlaylistTrackPlaylistId]
GO

ALTER TABLE [dbo].[PlaylistTrack]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistTrackTrackId] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Track] ([TrackId])
GO

ALTER TABLE [dbo].[PlaylistTrack] CHECK CONSTRAINT [FK_PlaylistTrackTrackId]
GO

USE [chinook2023]
GO

/****** Object:  Table [dbo].[Track]    Script Date: 14-06-2023 11:04:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Track](
	[TrackId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[AlbumId] [int] NULL,
	[MediaTypeId] [int] NOT NULL,
	[GenreId] [int] NULL,
	[Composer] [nvarchar](220) NULL,
	[Milliseconds] [int] NOT NULL,
	[Bytes] [int] NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_TrackAlbumId] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([AlbumId])
GO

ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_TrackAlbumId]
GO

ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_TrackGenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO

ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_TrackGenreId]
GO

ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_TrackMediaTypeId] FOREIGN KEY([MediaTypeId])
REFERENCES [dbo].[MediaType] ([MediaTypeId])
GO

ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_TrackMediaTypeId]
GO


CREATE TABLE `artist` (
  `ArtistId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ArtistId`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `album` (
  `AlbumId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(160) NOT NULL,
  `ArtistId` int NOT NULL,
  PRIMARY KEY (`AlbumId`),
  KEY `IFK_AlbumArtistId` (`ArtistId`),
  CONSTRAINT `FK_AlbumArtistId` FOREIGN KEY (`ArtistId`) REFERENCES `artist` (`ArtistId`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select g.Name, sum(il.UnitPrice * il.Quantity) AS 'Total Sales'
from track as t, genre as g, invoiceline as il
where t.GenreId = g.GenreId and t.TrackId = il.TrackId
group by g.Name
order by sum(il.UnitPrice * il.Quantity) desc;

CREATE TABLE `customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Company` varchar(80) DEFAULT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Email` varchar(60) NOT NULL,
  `SupportRepId` int DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `IFK_CustomerSupportRepId` (`SupportRepId`),
  CONSTRAINT `FK_CustomerSupportRepId` FOREIGN KEY (`SupportRepId`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
  `EmployeeId` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `ReportsTo` int DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `HireDate` datetime DEFAULT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `IFK_EmployeeReportsTo` (`ReportsTo`),
  CONSTRAINT `FK_EmployeeReportsTo` FOREIGN KEY (`ReportsTo`) REFERENCES `employee` (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `genre` (
  `GenreId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`GenreId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoice` (
  `InvoiceId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `BillingAddress` varchar(70) DEFAULT NULL,
  `BillingCity` varchar(40) DEFAULT NULL,
  `BillingState` varchar(40) DEFAULT NULL,
  `BillingCountry` varchar(40) DEFAULT NULL,
  `BillingPostalCode` varchar(10) DEFAULT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `IFK_InvoiceCustomerId` (`CustomerId`),
  CONSTRAINT `FK_InvoiceCustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoiceline` (
  `InvoiceLineId` int NOT NULL AUTO_INCREMENT,
  `InvoiceId` int NOT NULL,
  `TrackId` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`InvoiceLineId`),
  KEY `IFK_InvoiceLineInvoiceId` (`InvoiceId`),
  KEY `IFK_InvoiceLineTrackId` (`TrackId`),
  CONSTRAINT `FK_InvoiceLineInvoiceId` FOREIGN KEY (`InvoiceId`) REFERENCES `invoice` (`InvoiceId`),
  CONSTRAINT `FK_InvoiceLineTrackId` FOREIGN KEY (`TrackId`) REFERENCES `track` (`TrackId`)
) ENGINE=InnoDB AUTO_INCREMENT=2241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mediatype` (
  `MediaTypeId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`MediaTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `playlist` (
  `PlaylistId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`PlaylistId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `playlisttrack` (
  `PlaylistId` int NOT NULL,
  `TrackId` int NOT NULL,
  PRIMARY KEY (`PlaylistId`,`TrackId`),
  KEY `IFK_PlaylistTrackTrackId` (`TrackId`),
  CONSTRAINT `FK_PlaylistTrackPlaylistId` FOREIGN KEY (`PlaylistId`) REFERENCES `playlist` (`PlaylistId`),
  CONSTRAINT `FK_PlaylistTrackTrackId` FOREIGN KEY (`TrackId`) REFERENCES `track` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `track` (
  `TrackId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `AlbumId` int DEFAULT NULL,
  `MediaTypeId` int NOT NULL,
  `GenreId` int DEFAULT NULL,
  `Composer` varchar(220) DEFAULT NULL,
  `Milliseconds` int NOT NULL,
  `Bytes` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TrackId`),
  KEY `IFK_TrackAlbumId` (`AlbumId`),
  KEY `IFK_TrackGenreId` (`GenreId`),
  KEY `IFK_TrackMediaTypeId` (`MediaTypeId`),
  CONSTRAINT `FK_TrackAlbumId` FOREIGN KEY (`AlbumId`) REFERENCES `album` (`AlbumId`),
  CONSTRAINT `FK_TrackGenreId` FOREIGN KEY (`GenreId`) REFERENCES `genre` (`GenreId`),
  CONSTRAINT `FK_TrackMediaTypeId` FOREIGN KEY (`MediaTypeId`) REFERENCES `mediatype` (`MediaTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



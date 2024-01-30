/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Dallas_Final_Logical.DM1
 *
 * Date Created : Thursday, July 27, 2023 17:49:40
 * Target DBMS : Microsoft SQL Server 2019
 */

USE dallas_FI
go
/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK                 int              NOT NULL,
    InspectionDate         date         NULL,
    InspectionMonth        nvarchar(100)    NULL,
    InspectionYear         nvarchar(100)    NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(500)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geo 
 */

CREATE TABLE Dim_Geo(
    GeoSK                  int              NOT NULL,
    StreetNumber           int    NULL,
    StreetUnit             nvarchar(100)    NULL,
    StreetName             varchar(500)     NULL,
    StreetDirection        nvarchar(500)    NULL,
    StreetType             nvarchar(100)    NULL,
    StreetAddress          nvarchar(500)    NULL,
    ZipCode                nvarchar(100)    NULL,
    LatLongLocation        nvarchar(500)    NULL,
    Latitude               nvarchar(100)    NULL,
    Longitude              nvarchar(100)    NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(500)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (GeoSK)
)

go


IF OBJECT_ID('Dim_Geo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geo >>>'
go

/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    InspectionSK           int     NOT NULL,
    Test                   nvarchar(1000)    NULL,
    InspectionType         nvarchar(50)      NULL,
    InspectionScore        int     NULL,
    DI_CreateDate          datetime          NULL,
    DI_WorkflowFileName    nvarchar(500)     NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('Dim_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Inspection >>>'
go

/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE Dim_Violation(
    ViolationSK             int              NOT NULL,
    ViolationDescription    nvarchar(max)    NULL,
    ViolationPoints         int    NULL,
    ViolationDetail         nvarchar(max)    NULL,
    ViolationMemo           nvarchar(max)    NULL,
    DI_CreateDate           datetime         NULL,
    DI_WorkflowFileName     nvarchar(500)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ViolationSK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

CREATE TABLE Fact_Inspection(
    FactInspectionSK       int         NOT NULL,
    InspectionSK           int    NOT NULL,
    ViolationSK            int              NOT NULL,
    GeoSK                  int              NOT NULL,
    DateSK                 int              NOT NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(500)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (FactInspectionSK, InspectionSK, ViolationSK, GeoSK, DateSK)
)

go


IF OBJECT_ID('Fact_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Inspection >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Inspection1 
    FOREIGN KEY (InspectionSK)
    REFERENCES Dim_Inspection(InspectionSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Violation2 
    FOREIGN KEY (ViolationSK)
    REFERENCES Dim_Violation(ViolationSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Geo3 
    FOREIGN KEY (GeoSK)
    REFERENCES Dim_Geo(GeoSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date4 
    FOREIGN KEY (DateSK)
    REFERENCES Dim_Date(DateSK)
go



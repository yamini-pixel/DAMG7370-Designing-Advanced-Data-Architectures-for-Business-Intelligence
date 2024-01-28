/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC_dim_model.DM1
 *
 * Date Created : Sunday, June 18, 2023 23:37:35
 * Target DBMS : Microsoft SQL Server 2019
 */

USE nyc_ddl
go
/* 
 * TABLE: Dim_Company 
 */

CREATE TABLE Dim_Company(
    [Dim_Company SK]       int              NOT NULL,
    DBA                    nvarchar(100)    NULL,
    Facility_Type          nvarchar(10)     NULL,
    AKA                    nvarchar(100)    NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(10)     NULL,
    CONSTRAINT PK22 PRIMARY KEY NONCLUSTERED ([Dim_Company SK])
)

go


IF OBJECT_ID('Dim_Company') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Company >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Company >>>'
go

/* 
 * TABLE: Dim_Contact 
 */

CREATE TABLE Dim_Contact(
    Dim_Contact_SK         int              NOT NULL,
    Phone                  nvarchar(100)    NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(10)     NULL,
    CONSTRAINT PK22_1_1 PRIMARY KEY NONCLUSTERED (Dim_Contact_SK)
)

go


IF OBJECT_ID('Dim_Contact') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Contact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Contact >>>'
go

/* 
 * TABLE: Dim_Cuisine 
 */

CREATE TABLE Dim_Cuisine(
    Dim_Cuisine_SK         int              NOT NULL,
    Cuisine_Description    nvarchar(100)    NULL,
    DI_CreateDate          datetime         NULL,
    DI_WorkflowFileName    nvarchar(10)     NULL,
    CONSTRAINT PK22_1 PRIMARY KEY NONCLUSTERED (Dim_Cuisine_SK)
)

go


IF OBJECT_ID('Dim_Cuisine') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Cuisine >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Cuisine >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Dim_Date_SK            int             NOT NULL,
    Inspection_Date        datetime        NULL,
    Grade_Date             date            NULL,
    Record_Date            date            NULL,
    DI_CreateDate          datetime        NULL,
    DI_WorkflowFileName    nvarchar(10)    NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED (Dim_Date_SK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    Dim_Geography_SK       int               NOT NULL,
    Boro                   nvarchar(100)     NULL,
    Building               nvarchar(10)      NULL,
    Street                 char(100)         NULL,
    Community_Board        char(100)         NULL,
    Council_District       int               NULL,
    Census_Tract           int               NULL,
    ZipCode                numeric(10, 0)    NULL,
    Latitude               float             NULL,
    Longitude              float             NULL,
    DI_CreateDate          datetime          NULL,
    DI_WorkflowFileName    nvarchar(10)      NULL,
    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED (Dim_Geography_SK)
)

go


IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    Dim_Inspection_SK      int               NOT NULL,
    InspectionID           numeric(10, 0)    NULL,
    Inspection_Type        nvarchar(10)      NULL,
    Action                 nvarchar(100)     NULL,
    Score                  int               NULL,
    Grade                  char(10)          NULL,
    DI_CreateDate          datetime          NULL,
    DI_WorkflowFileName    nvarchar(10)      NULL,
    CONSTRAINT PK24 PRIMARY KEY NONCLUSTERED (Dim_Inspection_SK)
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
    Dim_Violation_SK         int              NOT NULL,
    Violation_Code           nvarchar(10)     NULL,
    Violation_Description    nvarchar(100)    NULL,
    Critical_Flag            char(10)         NULL,
    DI_CreateDate            datetime         NULL,
    DI_WorkflowFileName      nvarchar(10)     NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED (Dim_Violation_SK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: Fact_Food_Inspection 
 */

CREATE TABLE Fact_Food_Inspection(
    FoodInspectionSK       int              NOT NULL,
    [Dim_Company SK]       int              NOT NULL,
    Dim_Inspection_SK      int              NOT NULL,
    Dim_Violation_SK       int              NOT NULL,
    Dim_Date_SK            int              NOT NULL,
    Dim_Geography_SK       int              NOT NULL,
    Dim_Cuisine_SK         int              NOT NULL,
    Dim_Contact_SK         int              NOT NULL,
    CAMIS                  int              NULL,
    BIN                    nvarchar(30)     NULL,
    BBL                    nvarchar(30)     NULL,
    NTA                    nvarchar(30)     NULL,
    DI_CreatedDate         datetime         NULL,
    DI_WorkflowFilename    nvarchar(120)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (FoodInspectionSK, [Dim_Company SK], Dim_Inspection_SK, Dim_Violation_SK, Dim_Date_SK, Dim_Geography_SK, Dim_Cuisine_SK, Dim_Contact_SK)
)

go


IF OBJECT_ID('Fact_Food_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Food_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Food_Inspection >>>'
go

/* 
 * TABLE: Fact_Food_Inspection 
 */

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Company10 
    FOREIGN KEY ([Dim_Company SK])
    REFERENCES Dim_Company([Dim_Company SK])
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Inspection11 
    FOREIGN KEY (Dim_Inspection_SK)
    REFERENCES Dim_Inspection(Dim_Inspection_SK)
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Violation12 
    FOREIGN KEY (Dim_Violation_SK)
    REFERENCES Dim_Violation(Dim_Violation_SK)
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Date13 
    FOREIGN KEY (Dim_Date_SK)
    REFERENCES Dim_Date(Dim_Date_SK)
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Geography14 
    FOREIGN KEY (Dim_Geography_SK)
    REFERENCES Dim_Geography(Dim_Geography_SK)
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Cuisine15 
    FOREIGN KEY (Dim_Cuisine_SK)
    REFERENCES Dim_Cuisine(Dim_Cuisine_SK)
go

ALTER TABLE Fact_Food_Inspection ADD CONSTRAINT RefDim_Contact16 
    FOREIGN KEY (Dim_Contact_SK)
    REFERENCES Dim_Contact(Dim_Contact_SK)
go



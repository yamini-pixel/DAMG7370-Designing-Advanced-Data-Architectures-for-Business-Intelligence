/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      ERModel.DM1
 *
 * Date Created : Sunday, August 06, 2023 15:29:39
 * Target DBMS : Microsoft SQL Server 2019
 */

USE NYC_Collisions
go
/* 
 * TABLE: Dim_Contributing_Factor 
 */

CREATE TABLE Dim_Contributing_Factor(
    Dim_Contributing_Factor    int              NOT NULL,
    Contributing_Factor_1      nvarchar(250)    NULL,
    Contributing_Factor_2      nvarchar(250)    NULL,
    DI_CreateDate              datetime         NULL,
    DI_JobID                   int              NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (Dim_Contributing_Factor)
)

go


IF OBJECT_ID('Dim_Contributing_Factor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Contributing_Factor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Contributing_Factor >>>'
go

/* 
 * TABLE: Dim_Damage 
 */

CREATE TABLE Dim_Damage(
    Dim_Damage_SK                  int              NOT NULL,
    Point_of_Impact                varchar(250)     NULL,
    Vehicle_Damage                 nvarchar(250)    NULL,
    Vehicle_Damage_1               nvarchar(250)    NULL,
    Vehicle_Damage_2               nvarchar(250)    NULL,
    Vehicle_Damage_3               char(250)        NULL,
    Public_Property_Damage         char(10)         NULL,
    Public_Property_Damage_Type    varchar(250)     NULL,
    DI_CreateDate                  datetime         NULL,
    DI_JobID                       int              NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (Dim_Damage_SK)
)

go


IF OBJECT_ID('Dim_Damage') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Damage >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Damage >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK             int            NOT NULL,
    Date               datetime       NULL,
    Day                date           NULL,
    Time               time(7)        NULL,
    Hour               int            NULL,
    Day_of_the_Week    int            NULL,
    DI_CreateDate      datetime       NULL,
    DI_JobID           varchar(10)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DateSK)
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
    Geo_SK               int              NOT NULL,
    Borough              nvarchar(500)    NULL,
    Latitude             nvarchar(50)     NULL,
    Longitude            nvarchar(50)     NULL,
    Location             nvarchar(100)    NULL,
    Cross_Street_Name    nvarchar(500)    NULL,
    Off_Street_Name      nvarchar(500)    NULL,
    On_Street_Name       nvarchar(500)    NULL,
    Zipcode              nvarchar(50)     NULL,
    DI_CreateDate        datetime         NULL,
    DI_JobID             varchar(10)      NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Geo_SK)
)

go


IF OBJECT_ID('Dim_Geo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geo >>>'
go

/* 
 * TABLE: Dim_Pedestrian 
 */

CREATE TABLE Dim_Pedestrian(
    Dim_Pedestrain_SK    int              NOT NULL,
    Ped_Role             nvarchar(500)    NULL,
    Ped_Location         nvarchar(250)    NULL,
    Ped_Action           nvarchar(500)    NULL,
    Complaint            nvarchar(500)    NULL,
    DI_CreateDate        datetime         NULL,
    DI_JobID             int              NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Dim_Pedestrain_SK)
)

go


IF OBJECT_ID('Dim_Pedestrian') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Pedestrian >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Pedestrian >>>'
go

/* 
 * TABLE: Dim_Person_Details 
 */

CREATE TABLE Dim_Person_Details(
    Dim_Person_Details_SK    int          NOT NULL,
    Person_Type              char(100)    NULL,
    Person_Injury            char(100)    NULL,
    Bodily_Injury            char(100)    NULL,
    Ejection                 char(100)    NULL,
    Emotional_Status         char(200)    NULL,
    Position_In_Vehicle      char(100)    NULL,
    Safety_Equipment         char(200)    NULL,
    DI_CreateDate            datetime     NULL,
    DI_JobID                 int          NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (Dim_Person_Details_SK)
)

go


IF OBJECT_ID('Dim_Person_Details') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Person_Details >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Person_Details >>>'
go

/* 
 * TABLE: Dim_Vehicle_Details 
 */

CREATE TABLE Dim_Vehicle_Details(
    Dim_Vehicle_Details_SK    int              NOT NULL,
    State_Registration        nvarchar(100)    NULL,
    Vehicle_Type              nvarchar(100)    NULL,
    Vehicle_Make              nvarchar(100)    NULL,
    Vehicle_Model             nvarchar(100)    NULL,
    Vehicle_Year              nvarchar(100)    NULL,
    Travel_Direction          nvarchar(100)    NULL,
    Vehicle_Occupants         int              NULL,
    Pre_Crash                 nvarchar(250)    NULL,
    DI_CreateDate             datetime         NULL,
    DI_JobID                  int              NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (Dim_Vehicle_Details_SK)
)

go


IF OBJECT_ID('Dim_Vehicle_Details') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Vehicle_Details >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Vehicle_Details >>>'
go

/* 
 * TABLE: Fact_Crashes_BigQuery 
 */

CREATE TABLE Fact_Crashes_BigQuery(
    Crash_SK                         char(10)         NOT NULL,
    Geo_SK                           int              NOT NULL,
    UniqueKey                        int              NULL,
    Contributing_Factor_Vehicle_1    nvarchar(500)    NULL,
    Contributing_Factor_Vehicle_2    nvarchar(500)    NULL,
    Contributing_Factor_Vehicle_3    nvarchar(500)    NULL,
    Contributing_Factor_Vehicle_4    nvarchar(500)    NULL,
    Contributing_Factor_Vehicle_5    nvarchar(500)    NULL,
    Number_of_Cyclist_Injured        int              NULL,
    Number_of_Cyclist_Killed         int              NULL,
    Number_of_Motorists_Injured      int              NULL,
    Number_of_Pedestrians_Injured    int              NULL,
    Number_of_Pedestrians_Killed     int              NULL,
    Number_of_Persons_Injured        int              NULL,
    Number_of_Persons_Killed         int              NULL,
    Vehicle_Type_Code1               nvarchar(500)    NULL,
    Vehicle_Type_Code2               nvarchar(500)    NULL,
    Vehicle_Type_Code3               nvarchar(500)    NULL,
    Vehicle_Type_Code4               nvarchar(500)    NULL,
    Vehicle_Type_Code5               nvarchar(500)    NULL,
    DI_CreateDate                    datetime         NULL,
    DI_JobID                         varchar(10)      NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Crash_SK, Geo_SK)
)

go


IF OBJECT_ID('Fact_Crashes_BigQuery') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Crashes_BigQuery >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Crashes_BigQuery >>>'
go

/* 
 * TABLE: Fact_Person 
 */

CREATE TABLE Fact_Person(
    PersonSK                   int         NOT NULL,
    Dim_Person_Details_SK      int         NOT NULL,
    Dim_Pedestrain_SK          int         NOT NULL,
    Dim_Contributing_Factor    int         NOT NULL,
    DateSK                     int         NOT NULL,
    Crash_SK                   char(10)    NOT NULL,
    Geo_SK                     int         NOT NULL,
    UniqueKey_ID               int         NULL,
    Collision_ID               int         NULL,
    Person_ID                  int         NULL,
    Vehicle_ID                 int         NULL,
    Person_Age                 int         NULL,
    Person_Sex                 char(10)    NULL,
    DI_CreateDate              datetime    NULL,
    DI_JobID                   int         NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (PersonSK, Dim_Person_Details_SK, Dim_Pedestrain_SK, Dim_Contributing_Factor, DateSK, Crash_SK, Geo_SK)
)

go


IF OBJECT_ID('Fact_Person') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Person >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Person >>>'
go

/* 
 * TABLE: Fact_Vehicles 
 */

CREATE TABLE Fact_Vehicles(
    VehicleSK                      int             NOT NULL,
    Dim_Contributing_Factor        int             NOT NULL,
    DateSK                         int             NOT NULL,
    Dim_Vehicle_Details_SK         int             NOT NULL,
    Dim_Damage_SK                  int             NOT NULL,
    PersonSK                       int             NOT NULL,
    Dim_Person_Details_SK          int             NOT NULL,
    Dim_Pedestrain_SK              int             NOT NULL,
    Crash_SK                       char(10)        NOT NULL,
    Geo_SK                         int             NOT NULL,
    Unique_ID                      int             NULL,
    Collision_ID                   int             NULL,
    Vehicle_ID                     int             NULL,
    Driver_Sex                     char(10)        NULL,
    Driver_License_Status          varchar(100)    NULL,
    Driver_License_Jurisdiction    varchar(200)    NULL,
    DI_CreateDate                  datetime        NULL,
    DI_JobID                       int             NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (VehicleSK, Dim_Contributing_Factor, DateSK, Dim_Vehicle_Details_SK, Dim_Damage_SK, PersonSK, Dim_Person_Details_SK, Dim_Pedestrain_SK, Crash_SK, Geo_SK)
)

go


IF OBJECT_ID('Fact_Vehicles') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Vehicles >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Vehicles >>>'
go

/* 
 * TABLE: Fact_Crashes_BigQuery 
 */

ALTER TABLE Fact_Crashes_BigQuery ADD CONSTRAINT RefDim_Geo9 
    FOREIGN KEY (Geo_SK)
    REFERENCES Dim_Geo(Geo_SK)
go


/* 
 * TABLE: Fact_Person 
 */

ALTER TABLE Fact_Person ADD CONSTRAINT RefDim_Date14 
    FOREIGN KEY (DateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Person ADD CONSTRAINT RefFact_Crashes_BigQuery22 
    FOREIGN KEY (Crash_SK, Geo_SK)
    REFERENCES Fact_Crashes_BigQuery(Crash_SK, Geo_SK)
go

ALTER TABLE Fact_Person ADD CONSTRAINT RefDim_Person_Details10 
    FOREIGN KEY (Dim_Person_Details_SK)
    REFERENCES Dim_Person_Details(Dim_Person_Details_SK)
go

ALTER TABLE Fact_Person ADD CONSTRAINT RefDim_Pedestrian11 
    FOREIGN KEY (Dim_Pedestrain_SK)
    REFERENCES Dim_Pedestrian(Dim_Pedestrain_SK)
go

ALTER TABLE Fact_Person ADD CONSTRAINT RefDim_Contributing_Factor12 
    FOREIGN KEY (Dim_Contributing_Factor)
    REFERENCES Dim_Contributing_Factor(Dim_Contributing_Factor)
go


/* 
 * TABLE: Fact_Vehicles 
 */

ALTER TABLE Fact_Vehicles ADD CONSTRAINT RefDim_Contributing_Factor13 
    FOREIGN KEY (Dim_Contributing_Factor)
    REFERENCES Dim_Contributing_Factor(Dim_Contributing_Factor)
go

ALTER TABLE Fact_Vehicles ADD CONSTRAINT RefDim_Date15 
    FOREIGN KEY (DateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Vehicles ADD CONSTRAINT RefDim_Vehicle_Details17 
    FOREIGN KEY (Dim_Vehicle_Details_SK)
    REFERENCES Dim_Vehicle_Details(Dim_Vehicle_Details_SK)
go

ALTER TABLE Fact_Vehicles ADD CONSTRAINT RefDim_Damage18 
    FOREIGN KEY (Dim_Damage_SK)
    REFERENCES Dim_Damage(Dim_Damage_SK)
go

ALTER TABLE Fact_Vehicles ADD CONSTRAINT RefFact_Person23 
    FOREIGN KEY (PersonSK, Dim_Person_Details_SK, Dim_Pedestrain_SK, Dim_Contributing_Factor, DateSK, Crash_SK, Geo_SK)
    REFERENCES Fact_Person(PersonSK, Dim_Person_Details_SK, Dim_Pedestrain_SK, Dim_Contributing_Factor, DateSK, Crash_SK, Geo_SK)
go



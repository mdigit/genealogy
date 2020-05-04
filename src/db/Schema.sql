-- Table DbVersions
CREATE TABLE dbo.DbVersions (
    DbVersionId int NOT NULL IDENTITY(1,1),
    Version int NOT NULL,
    DateTime datetime NOT NULL
);
ALTER TABLE dbo.DbVersions
    ADD CONSTRAINT PK_DbVersion PRIMARY KEY (PersonId);
    
-- Table Persons
CREATE TABLE dbo.Persons (
    PersonId int NOT NULL IDENTITY(1,1),
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Sex varchar(255) NOT NULL,
    DateOfBirth datetime NOT NULL,
    DateOfDeath datetime NULL,
    Hometown varchar(256) NULL,
    PlaceOfBirth varchar(1024) NULL,
    PlaceOfResidence varchar(1024) NULL,
    Profession varchar(256) NULL
);
ALTER TABLE dbo.Persons
    ADD CONSTRAINT PK_Person PRIMARY KEY (PersonId);

-- Table Parents
CREATE TABLE dbo.Parents (
    ParentId int NOT NULL IDENTITY(1,1),
    PersonId int NOT NULL,
    PartnerPersonId int NOT NULL
);
ALTER TABLE dbo.Parents
    ADD CONSTRAINT PK_Parent PRIMARY KEY (ParentId);
ALTER TABLE dbo.Parents
    ADD CONSTRAINT FK_ParentPerson_PersonId
    FOREIGN KEY (PersonId) REFERENCES dbo.Persons(PersonID);
ALTER TABLE dbo.Parents
    ADD CONSTRAINT FK_ParentPerson_PartnerPersonId
    FOREIGN KEY (PartnerPersonId) REFERENCES dbo.Persons(PersonID);

-- Table Children
CREATE TABLE dbo.Children (
    ChildId int NOT NULL IDENTITY(1,1),
    PersonId int NOT NULL,
    ParentId int NOT NULL
);
ALTER TABLE dbo.Children
    ADD CONSTRAINT PK_Child PRIMARY KEY (ChildId);
ALTER TABLE dbo.Children
    ADD CONSTRAINT FK_ChildPerson_PersonId
    FOREIGN KEY (PersonId) REFERENCES dbo.Persons(PersonId);
ALTER TABLE dbo.Children
    ADD CONSTRAINT FK_ChildParent_ParentId
    FOREIGN KEY (ParentId) REFERENCES dbo.Parents(ParentId);

DECLARE @dbVersion int = 1;
INSERT INTO dbo.Verson
    (Version, DateTime)
    VALUES (dbVersion, GETDATE());

PRINT CONCAT('!Info Database version set to ', @dbVersion)

USE test;
DROP TABLE IF EXISTS DbVersions;
DROP TABLE IF EXISTS Children;
DROP TABLE IF EXISTS Parents;
DROP TABLE IF EXISTS Persons;

-- Table DbVersions
CREATE TABLE DbVersions (
    DbVersionId INT(6) AUTO_INCREMENT PRIMARY KEY,
    DbVersion INT(6) NOT NULL,
    DbDateTime DATETIME NOT NULL
);
    
-- Table Persons
CREATE TABLE Persons (
    PersonId INT(6) AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    MiddleNames VARCHAR(1024) NULL,
    FirstName VARCHAR(255) NOT NULL,
    Sex VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    DateOfDeath DATE NULL,
    Hometown VARCHAR(256) NULL,
    PlaceOfBirth VARCHAR(1024) NULL,
    PlaceOfResidence VARCHAR(1024) NULL,
    Profession VARCHAR(256) NULL
);

-- Table Parents
CREATE TABLE Parents (
    ParentId INT(6) AUTO_INCREMENT PRIMARY KEY,
    PersonId INT(6) NOT NULL,
    PartnerPersonId INT(6) NOT NULL
);
ALTER TABLE Parents
    ADD CONSTRAINT FK_ParentPerson_PersonId
    FOREIGN KEY (PersonId) REFERENCES Persons(PersonId);
ALTER TABLE Parents
    ADD CONSTRAINT FK_ParentPerson_PartnerPersonId
    FOREIGN KEY (PartnerPersonId) REFERENCES Persons(PersonId);

-- Table Children
CREATE TABLE Children (
    ChildId INT(6) AUTO_INCREMENT PRIMARY KEY,
    ParentId INT(6) NOT NULL,
    PersonId INT(6) NOT NULL
);
ALTER TABLE Children
    ADD CONSTRAINT FK_ChildPerson_PersonId
    FOREIGN KEY (PersonId) REFERENCES Persons(PersonId);
ALTER TABLE Children
    ADD CONSTRAINT FK_ChildParent_ParentId
    FOREIGN KEY (ParentId) REFERENCES Parents(ParentId);

SELECT @dbVersion;
SET @dbVersion = 1;
INSERT INTO DbVersions
    (DbVersion, DbDateTime)
    VALUES (@dbVersion, NOW());

SELECT CONCAT('!Info Database version set to ', @dbVersion)

-- Delete table data in reverse order
--------------------
DELETE dbo.Children;
DELETE dbo.Parents;
DELETE dbo.Persons;

-- Populate 'dbo.Persons'
--------------------
SET IDENTITY_INSERT dbo.Persons ON;
INSERT INTO dbo.Persons (PersonId,LastName,FirstName,MiddleNames,Sex,DateOfBirth,DateOfDeath,Hometown,PlaceOfBirth,PlaceOfResidence,Profession) VALUES
	(1,'Durscher','Jakob',null,'male','1964-10-02',null,'Glarus Nord','Burgdorf BE','Oberstammheim','Metzger'),
	(2,'Durscher Haussener','Hanni',null,'female','1964-10-02',null,'Glarus Nord','Burgdorf BE','Oberstammheim','Verkäuferin'),
	(3,'Durscher','Markus',null,'male','1964-10-02',null,'Glarus Nord','Burgdorf BE','8050 Zürich Oerlikon','Wirtschaftsinformatiker'),
	(4,'Durscher Leupp','Corinne',null,'female','1975-12-25',null,'Uster','Uster','8050 Zürich Oerlikon','Sportlehrerin'),
	(5,'Durscher','Nils','Cedric','male','2005-11-28',null,'Glarus Nord','Zürich','8050 Zürich Oerlikon','Schüler'),
	(6,'Durscher','Jasmin','Nora','female','2008-08-15',null,'Glarus Nord','Zürich','8050 Zürich Oerlikon','Schülerin'),
	(7,'Durscher','Thomas',null,'male','1965-11-17',null,'Glarus Nord','Burgdorf BE','Appenzell','Informatiker'),
	(8,'Durscher Kuhn','Ingrid',null,'female','1965-11-17',null,'Glarus Nord','Burgdorf BE','Aargau','KV'),
	(9,'Durscher','René',null,'male','1969-09-15',null,'Glarus Nord','Burgdorf BE','Oberengstringen ZH','Postangestellter'),
	(10,'Steiger','Tanja',null,'female','1965-11-17',null,'Glarus Nord','Burgdorf BE','Aargau','Gastronomin'),
	(11,'Suh','Lei',null,'female','1965-11-17',null,'Shanghai','Shanhai','Oberengstringen ZH','Postangestellte'),
	(12,'Durscher','David',null,'male','1990-06-01',null,'Glarus Nord','Frauenfeld','Winterthur','Gastronom'),
	(13,'Suh','Anqi',null,'female','1990-01-01',null,'Shanghai','Shanghai','Oberengstringen ZH','Studentin'),
	(14,'Durscher','Renato',null,'male','1990-11-07',null,'Glarus Nord','Zürich','Aargau','Fahrradmechaniker'),
	(15,'Durscher','Romano',null,'male','1990-11-07',null,'Glarus Nord','Zürich','Aargau','Automechaniker'),
	(16,'Durscher' ,'Niklaus',null,'male','1990-11-07','1955-11-02' ,'Glarus Nord','???' ,'Schönenberg' ,'Landwirt'),
	(17,'Wälte' ,'Maria' ,null,'female' ,'1877-11-13' ,'1935-03-27' ,'???' ,'???' ,'Schönenberg' ,'Landwirtin'),
	(18,'Brunner' ,'Anna' ,null,'female' ,'1879-07-09' ,'1964-04-09' ,'???' ,'???' ,'Schönenberg' ,'Landwirtin'),
	(19,'Durscher' ,'Johann' ,null,'male' ,'1907-03-13' ,'1955-05-23' ,'Glarus Nord','???' ,'Schönenberg/Würzen ab ca. 1935' ,'Landwirt'),
	(20,'Brägger' ,'Lydia' ,null,'female' ,'1913-05-24' ,'1997-06-22' ,'???' ,'Hummiswald' ,'Wattwil' ,'Landwirtin')
SET IDENTITY_INSERT dbo.Persons OFF;

-- Populate 'dbo.Parents'
--------------------
SET IDENTITY_INSERT dbo.Parents ON;
INSERT INTO dbo.Parents (ParentId,PersonId,PartnerPersonId) VALUES
	(1,1,2),
	(2,3,4),
	(3,7,8),
	(4,9,10),
	(5,9,11)
SET IDENTITY_INSERT dbo.Parents OFF;

-- Populate 'dbo.Children'
--------------------
SET IDENTITY_INSERT dbo.Children ON;
INSERT INTO dbo.Children (ChildId,ParentId,PersonId) VALUES
	(1,1,3),
	(2,1,7),
	(3,1,9),
	(4,2,5),
	(5,2,6),
	(6,3,14),
	(7,3,15),
	(8,4,12),
	(9,5,13)
SET IDENTITY_INSERT dbo.Children OFF;



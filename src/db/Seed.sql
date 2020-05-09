DELETE dbo.Persons;
SET IDENTITY_INSERT dbo.Persons ON;
INSERT INTO dbo.Persons (PersonId,LastName,FirstName,Sex,DateOfBirth,DateOfDeath,Hometown,PlaceOfBirth,PlaceOfResidence,Profession) VALUES
	(1,'Durscher','Jakob','male','1964-10-02',null,'Glarus Süd','Burgdorf BE','Oberstammheim','Metzger'),
	(2,'Durscher Haussener','Hanni','female','1964-10-02',null,'Glarus Süd','Burgdorf BE','Oberstammheim','Verkäuferin'),
	(3,'Durscher','Markus','male','1964-10-02',null,'Glarus Süd','Burgdorf BE','8050 Zürich Oerlikon','Wirtschaftsinformatiker'),
	(4,'Durscher Leupp','Corinne','female','1975-12-25',null,'Uster','Uster','8050 Zürich Oerlikon','Sportlehrerin'),
	(5,'Durscher','Nils','male','2005-11-28',null,'Glarus Süd','Zürich','8050 Zürich Oerlikon','Schüler'),
	(6,'Durscher','Jasmin','female','2008-08-15',null,'Glarus Süd','Zürich','8050 Zürich Oerlikon','Schülerin'),
	(7,'Durscher','Thomas','male','1965-11-17',null,'Glarus Süd','Burgdorf BE','Appenzell','Informatiker'),
	(8,'Durscher Kuhn','Ingrid','female','1965-11-17',null,'Glarus Süd','Burgdorf BE','Aargau','KV'),
	(9,'Durscher','René','male','1969-09-15',null,'Glarus Süd','Burgdorf BE','Oberengstringen ZH','Postangestellter'),
	(10,'Steiger','Tanja','female','1965-11-17',null,'Glarus Süd','Burgdorf BE','Aargau','Gastronomin'),
	(11,'Suh','Lei','female','1965-11-17',null,'Shanghai','Shanhai','Oberengstringen ZH','Postangestellte'),
	(12,'Durscher','David','male','1990-06-01',null,'Glarus Süd','Frauenfeld','Winterthur','Gastronom'),
	(13,'Suh','Anqi','female','1990-01-01',null,'Shanghai','Shanghai','Oberengstringen ZH','Studentin'),
	(14,'Durscher','Renato','male','1990-11-07',null,'Glarus Süd','Zürich','Aargau','Fahrradmechaniker'),
	(15,'Durscher','Romano','male','1990-11-07',null,'Glarus Süd','Zürich','Aargau','Automechaniker')
SET IDENTITY_INSERT dbo.Persons OFF;


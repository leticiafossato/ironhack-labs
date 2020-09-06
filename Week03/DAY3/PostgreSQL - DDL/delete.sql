-- Challenge 2 - Create the Database and Tables:
CREATE TABLE Cars (ID smallint, VIN char(17), manufacturer varchar(10), model varchar(6), year smallint, color varchar(6))
SELECT * FROM Cars;

CREATE TABLE Customers (ID smallint, "Customer ID" smallint , Name varchar(50), Phone varchar(16), Email varchar(50), Address varchar(50), Country varchar(20), Postal smallint);
SELECT * FROM Customers;

CREATE TABLE Salespersons (ID smallint, "Staff ID" smallint , Name varchar(50), Store varchar(20));
SELECT * FROM Salespersons;

CREATE TABLE Invoices (ID smallint, "Invoice Number" smallint, Date char(10), Car smallint, Custumer smallint, "Sales Person" smallint);
SELECT * FROM Invoices;

-- Challenge 3 - Seeding the Database
-- Seeding Cars:
DROP TABLE IF EXISTS Cars; -- Drop because I need to expand the limit of model varchar
CREATE TABLE Cars (ID smallint, VIN varchar(17), manufacturer varchar(10), model varchar(20), year smallint, color varchar(6));
INSERT INTO Cars (ID, VIN, manufacturer, model, year, color) VALUES (0,'3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
																	(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
																	(2,'RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
																	(3,'HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver'),
																	(4,'DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),																	
																	(5,'DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');	
SELECT * FROM Cars;

-- Seeding Customers:
DROP TABLE IF EXISTS Customers;-- Drop because I need to add two others columns
CREATE TABLE Customers (ID smallint, "Customer ID" smallint, Name varchar(50), Phone varchar(17), Email varchar(50), Address varchar(50), City varchar(10), "State/Province" varchar(20) ,Country varchar(15), Postal integer);
INSERT INTO Customers (ID, "Customer ID" , Name, Phone, Email, Address, City, "State/Province", Country, Postal) VALUES (0,10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14', 'Madrid','Madrid', 'Spain', 28045),
																	                            (1,20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States', 33130),
																		                        (2,30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);																							 
SELECT * FROM Customers;

-- Seeding Salespersons:	
INSERT INTO Salespersons (ID,"Staff ID",Name,Store) VALUES (0,00001,'Petey Cruiser','Madrid'),
															(1,00002,'Anna Sthesia','Barcelona'),
															(2,00003,'Paul Molive','Berlin'),
															(3 ,00004 ,'Gail Forcewind','Paris'),
															(4 ,00005 ,'Paige Turner','Mimia'),
															(5 ,00006 ,'Bob Frapples','Mexico City'),
															(6 ,00007 ,'Walter Melon','Amsterdam'),
															(7 ,00008 ,'Shonda Leer','São Paulo');
SELECT * FROM Salespersons;

-- Seeding Invoices:
DROP TABLE IF EXISTS Invoices; --to change the type of invoice number (invoice>35.000)
CREATE TABLE Invoices (ID smallint, "Invoice Number" integer, Date varchar(10), Car smallint, Custumer smallint, "Sales Person" smallint);
INSERT INTO Invoices (ID, "Invoice Number", Date, Car, Custumer, "Sales Person") VALUES (0,852399038, '22-08-2018',0,1,3),
																						(1,731166526, '31-12-2018',3,0,5),
																						(2,271135104, '22-01-2019',2,2,7);
SELECT * FROM Invoices;

--  Bonus Challenge:
UPDATE Salespersons SET store='Miami' WHERE Store='Mimia';
SELECT * FROM Salespersons;

UPDATE Customers SET email='ppicasso@gmail.com' WHERE Name='Pablo Picasso';
UPDATE Customers SET email='lincoln@us.gov' WHERE Name='Abraham Lincoln';
UPDATE Customers SET email='hello@napoleon.me' WHERE Name='Napoléon Bonaparte';
SELECT * FROM Customers;

--  Bonus Challenge2:
DELETE FROM Cars WHERE ID=4;

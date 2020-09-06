-- Challenge 2 - Create the Database and Tables:
CREATE TABLE Cars (ID smallint, VIN char(17), manufacturer varchar(10), model varchar(6), year smallint, color varchar(6))
SELECT * FROM Cars;

CREATE TABLE Customers (ID smallint, "Customer ID" smallint , Name varchar(50), Phone varchar(16), Email varchar(50), Address varchar(50), Country varchar(20), Postal smallint);
SELECT * FROM Customers;

CREATE TABLE Salespersons (ID smallint, "Staff ID" smallint , Name varchar(50), Store varchar(20));
SELECT * FROM Salespersons;

CREATE TABLE Invoices (ID smallint, "Invoice Number" smallint, Date char(10), Car smallint, Custumer smallint, "Sales Person" smallint);
SELECT * FROM Invoices;

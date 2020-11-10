-- Create

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
	                car_id smallserial PRIMARY KEY,
	                vin varchar(30) NOT NULL,
	                manuf text NOT NULL,
	                model text NOT NULL,
	                "year" smallint NOT NULL,
	                color text NOT NULL
					);


--

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
						cust_id bigint PRIMARY KEY,
						cust_name text NOT NULL,
						cust_phone text,
						cust_email text,
						cust_adress text NOT NULL,
						cust_city text NOT NULL,
						cust_state text NOT NULL,
						cust_country text NOT NULL,
						cust_zipcode integer NOT NULL
						);

--

DROP TABLE IF EXISTS salesperson;

CREATE TABLE salesperson (
							empl_id smallserial PRIMARY KEY,
							staff_id varchar(15),
							empl_name text NOT NULL,
							empl_store text NOT NULL
							);

--

DROP TABLE IF EXISTS invoices;

CREATE TABLE invoices (
						inv_number integer,
						inv_date date NOT NULL,
						car_id integer,
						cust_id integer,
						empl_id integer
						);

-- Seeding


INSERT INTO cars (vin, manuf, model, "year", color)
     VALUES ('3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue'),
	        ('ZM8G7BEUQZ97IH46V','Peugeot',	'Rifter',2019,'Red'),
			('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
			('HKNDGS7CU31E9Z7JW',	'Toyota',	'RAV4',	2018,	'Silver'),
			('DAM41UDN3CHU2WVF6',	'Volvo',	'V60',	2019,	'Gray'),
			('DAM41UDN3CHU2WVF',	'Volvo','V60 Cross Country',	2019, 'Gray');

--


INSERT INTO customers (cust_id, cust_name, cust_phone,  cust_adress, cust_city, cust_state, cust_country, cust_zipcode)
     VALUES (10001,'Pablo Picasso','+34 636 17 63 82','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045),
            (20001,'Abraham Lincoln','+1 305 907 7086','120 SW 8th St','Miami','Florida','United States',33130),
            (30001,'Napoléon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée','Paris','Île-de-France','France',75008);
--

INSERT INTO salesperson (staff_id,empl_name,empl_store)
     VALUES ('00001','Petey Cruiser','Madrid'),
            ('00002','Anna Sthesia','Barcelona'),
            ('00003','Paul Molive','Berlin'),
            ('00004','Gail Forcewind','Paris'),
            ('00005','Paige Turner','Mimia'),
            ('00006','Bob Frapples','Mexico City'),
            ('00007','Walter Melon','Amsterdam'),
            ('00008','Shonda Leer','São Paulo');
--

INSERT INTO invoices (inv_number,inv_date, car_id, cust_id, empl_id)
     VALUES (852399038,'2018-08-22',0,	1,	3),
            (731166526,	'2018-12-31',	3,	0,	5),
            (271135104,	'2019-01-22',	2,	2,	7);
			
-- Updating

UPDATE salesperson
   SET empl_store = 'Miami'
 WHERE empl_id = 5;
 
 ---

UPDATE customers
   SET cust_email = 'ppicasso@gmail.com' WHERE cust_id = 10001;
UPDATE customers
   SET cust_email = 'lincoln@us.gov' WHERE cust_id = 20001;
UPDATE customers
   SET cust_email = 'hello@napoleon.me' WHERE cust_id = 30001;


--- or

UPDATE customers
   SET cust_email = CASE WHEN cust_id = 10001 THEN 'ppicasso@gmail.com'
					     WHEN cust_id = 20001 THEN 'lincoln@us.gov'
					     WHEN cust_id = 30001 THEN 'hello@napoleon.me'
					     END
 WHERE cust_id IN (10001, 20001, 30001);
 
 
-- Delete

DELETE FROM cars
      WHERE vin = 'DAM41UDN3CHU2WVF6' AND model = 'V60'; 
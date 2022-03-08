create table sales_team (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sales_team_lead VARCHAR(40),
pay_grade VARCHAR(3),
region VARCHAR(2),
emp_id VARCHAR(7),
is_found boolean
);

create table sales_week_calendar (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
week0 INTEGER,
week1 INTEGER,
sales_date date,
sales_period INTEGER,
sales_year INTEGER,
sales_quarter INTEGER
);

create table products(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prod_code VARCHAR(8),
prod_name VARCHAR(50),
url VARCHAR(200),
manufacturer VARCHAR(50),
q1_2019_price INTEGER,
q2_2019_price INTEGER,
q3_2019_price INTEGER,
q4_2019_price INTEGER,
q1_2020_price INTEGER,
q2_2020_price INTEGER,
q3_2020_price INTEGER,
q4_2020_price INTEGER
);

create table esp(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
esp_code VARCHAR(7),
warranty_price INTEGER,
prod_id INTEGER,
FOREIGN KEY (prod_id) REFERENCES products(id)
);

#DATA
INSERT INTO sales_team(sales_team_lead,pay_grade,region,emp_id,is_found) values('Evans, Gina',	'C12',	'NW', 	'EMP244',	TRUE);
INSERT INTO sales_team(sales_team_lead,pay_grade,region,emp_id,is_found) values( 'Lawson, Harry',	'C11', 'NW',	'EMP256',	TRUE);
INSERT INTO sales_team(sales_team_lead,pay_grade,region,emp_id,is_found) values( 'Bachmann, Jane',	'C13', 'NW',	'EMP234',	TRUE);
INSERT INTO sales_team(sales_team_lead,pay_grade,region,emp_id,is_found) values( 'Clement, Beverly',	'C14', 'SW',	'EMP267',	TRUE);
INSERT INTO sales_team(sales_team_lead,pay_grade,region,emp_id,is_found) values( 'Allen, Maude',	'C12', 'SW',	'EMP290',	TRUE);

#=CONCAT("INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (", H4,",", I4,",","'",TEXT(J4, "yyyy/mm/dd"),"'",",",K4,",",L4,",",M4,");")
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (0,1,'2018/12/30',1,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (1,2,'2019/01/06',1,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (2,3,'2019/01/13',1,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (3,4,'2019/01/20',1,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (4,5,'2019/01/27',2,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (5,6,'2019/02/03',2,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (6,7,'2019/02/10',2,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (7,8,'2019/02/17',2,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (8,9,'2019/02/24',3,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (9,10,'2019/03/03',3,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (10,11,'2019/03/10',3,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (11,12,'2019/03/17',3,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (12,13,'2019/03/24',4,2019,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (13,14,'2019/03/31',4,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (14,15,'2019/04/07',4,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (15,16,'2019/04/14',4,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (16,17,'2019/04/21',5,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (17,18,'2019/04/28',5,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (18,19,'2019/05/05',5,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (19,20,'2019/05/12',5,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (20,21,'2019/05/19',6,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (21,22,'2019/05/26',6,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (22,23,'2019/06/02',6,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (23,24,'2019/06/09',6,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (24,25,'2019/06/16',7,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (25,26,'2019/06/23',7,2019,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (26,27,'2019/06/30',7,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (27,28,'2019/07/07',7,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (28,29,'2019/07/14',8,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (29,30,'2019/07/21',8,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (30,31,'2019/07/28',8,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (31,32,'2019/08/04',8,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (32,33,'2019/08/11',9,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (33,34,'2019/08/18',9,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (34,35,'2019/08/25',9,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (35,36,'2019/09/01',9,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (36,37,'2019/09/08',10,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (37,38,'2019/09/15',10,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (38,39,'2019/09/22',10,2019,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (39,40,'2019/09/29',10,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (40,41,'2019/10/06',11,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (41,42,'2019/10/13',11,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (42,43,'2019/10/20',11,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (43,44,'2019/10/27',11,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (44,45,'2019/11/03',12,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (45,46,'2019/11/10',12,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (46,47,'2019/11/17',12,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (47,48,'2019/11/24',12,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (48,49,'2019/12/01',13,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (49,50,'2019/12/08',13,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (50,51,'2019/12/15',13,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (51,52,'2019/12/22',13,2019,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (0,1,'2019/12/29',1,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (1,2,'2020/01/05',1,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (2,3,'2020/01/12',1,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (3,4,'2020/01/19',1,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (4,5,'2020/01/26',2,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (5,6,'2020/02/02',2,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (6,7,'2020/02/09',2,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (7,8,'2020/02/16',2,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (8,9,'2020/02/23',3,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (9,10,'2020/03/01',3,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (10,11,'2020/03/08',3,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (11,12,'2020/03/15',3,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (12,13,'2020/03/22',4,2020,1);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (13,14,'2020/03/29',4,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (14,15,'2020/04/05',4,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (15,16,'2020/04/12',4,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (16,17,'2020/04/19',5,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (17,18,'2020/04/26',5,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (18,19,'2020/05/03',5,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (19,20,'2020/05/10',5,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (20,21,'2020/05/17',6,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (21,22,'2020/05/24',6,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (22,23,'2020/05/31',6,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (23,24,'2020/06/07',6,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (24,25,'2020/06/14',7,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (25,26,'2020/06/21',7,2020,2);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (26,27,'2020/06/28',7,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (27,28,'2020/07/05',7,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (28,29,'2020/07/12',8,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (29,30,'2020/07/19',8,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (30,31,'2020/07/26',8,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (31,32,'2020/08/02',8,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (32,33,'2020/08/09',9,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (33,34,'2020/08/16',9,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (34,35,'2020/08/23',9,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (35,36,'2020/08/30',9,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (36,37,'2020/09/06',10,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (37,38,'2020/09/13',10,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (38,39,'2020/09/20',10,2020,3);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (39,40,'2020/09/27',10,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (40,41,'2020/10/04',11,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (41,42,'2020/10/11',11,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (42,43,'2020/10/18',11,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (43,44,'2020/10/25',11,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (44,45,'2020/11/01',12,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (45,46,'2020/11/08',12,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (46,47,'2020/11/15',12,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (47,48,'2020/11/22',12,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (48,49,'2020/11/29',13,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (49,50,'2020/12/06',13,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (50,51,'2020/12/13',13,2020,4);
INSERT into sales_week_calendar (week0, week1, sales_date, sales_period, sales_year, sales_quarter)  values (51,52,'2020/12/20',13,2020,4);

#=CONCAT("INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values (","'",A2,"'",",","'",B2,"','",C2,"','",D2,"',",G2,",",H2,",",I2,",",J2,",",K2,",",L2,",",M2,",",N2,");")
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_006','ZT2000 Zero Turn Mower','https://www.bobcat.com/mowers/zero-turn-mowers/zt2000','Bobcat',4575,4575,4575,4575,4649,4649,4649,4649);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_005','UV34 Gas ','https://www.bobcat.com/utility-products/utv/UV34/UV34-gas-utv','Bobcat',13995,13995,13995,13995,14225,14225,14225,14225);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_004','CT1021 Sub-Compact Tractor','https://www.bobcat.com/tractors/models/ct1021/features','Bobcat',11385,11385,11385,11385,11527,11527,11527,11527);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_007','S70 Skid Steer Loader','https://www.bobcat.com/loaders/skid-steer-loaders/models/s70/features','Bobcat',22987,22987,22987,22987,23120,23120,23120,23120);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_002','CUV82','https://www.cat.com/en_US/products/new/equipment/utility-vehicles/utility-vehicles/1000034280.html','Cat',14786,14786,14786,14786,14998,14998,14998,14998);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_001','Gator XUV 590M','https://e-marketing.deere.com/store/landpro-equipmentalexander-ny/ViewAllProducts.do','John Deere',12449,12449,12449,12449,12499,12499,12499,12499);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_008','Z930M Ztrack','https://e-marketing.deere.com/store/landpro-equipmentalexander-ny/ViewAllProducts.do','John Deere',11589,11589,11589,11589,11689,11689,11689,11689);
INSERT INTO products (prod_code, prod_name, url, manufacturer,q1_2019_price,q2_2019_price,q3_2019_price,q4_2019_price,q1_2020_price,q2_2020_price,q3_2020_price,q4_2020_price) values ('PROD_003','1025R Sub-Compact Tractor','https://e-marketing.deere.com/store/landpro-equipmentalexander-ny/ViewAllProducts.do','John Deere',14999,14999,14999,14999,15066,15066,15066,15066);

#=CONCAT("INSERT INTO ESP(esp_code, warranty_price, prod_id) values (", "'",A2,"'",",",B2,",",C2,");")
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_006',372,9);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_005',843,10);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_004',843,11);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_007',1027,12);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_002',843,13);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_001',843,14);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_008',843,15);
INSERT INTO ESP(esp_code, warranty_price, prod_id) values ('ESP_003',978,16);

create table sales (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
item_code VARCHAR(8),
emp_id INTEGER,
FOREIGN KEY (emp_id) REFERENCES sales_team(id),
year_week INTEGER,
FOREIGN KEY (year_week) REFERENCES sales_week_calendar(id),
sold_count INTEGER,
sale_date DATE
);


#----------------------------------------------------------------------------------------------------

#OLAP History Table
create table sales_history (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sales_team_lead VARCHAR(40),
pay_grade VARCHAR(3),
region VARCHAR(2),
emp_id VARCHAR(7),
item_code VARCHAR(8),
item_name VARCHAR(50),
item_price INTEGER,
url VARCHAR(200),
manufacturer VARCHAR(50),
warranty_price INTEGER,
sale_year INTEGER,
sale_week varchar(3),
sale_date DATE,
sale_count INTEGER
);


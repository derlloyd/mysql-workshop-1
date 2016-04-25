CREATE DATABASE decodemtl_test;

DELETE DATABASE decodemtl_test;
DROP DATABASE decodemtl_test;
show databases;

CREATE TABLE Account (id INT AUTO_INCREMENT primary key);
CREATE TABLE AddressBook (id INT AUTO_INCREMENT primary key, address VARCHAR(100));
CREATE TABLE Entry (id INT AUTO_INCREMENT primary key);
CREATE TABLE Test  (id INT AUTO_INCREMENT primary key);

show tables;

DROP TABLE Test;


ALTER TABLE Account ADD COLUMN (email VARCHAR(255), password VARCHAR(40));
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

describe Account;

ALTER TABLE Account ADD COLUMN (createdOn DATETIME, modifiedOn DATETIME);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

describe Account;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| email      | varchar(255) | YES  |     | NULL    |                |
| password   | varchar(40)  | YES  |     | NULL    |                |
| createdOn  | datetime     | YES  |     | NULL    |                |
| modifiedOn | datetime     | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)





// remove column address I created
> ALTER TABLE AddressBook DROP COLUMN address;
// add required columns
> ALTER TABLE AddressBook ADD COLUMN (accontId INT, name VARCHAR(255), createdOn DATETIME, modifiedOn DATETIME);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

> describe AddressBook;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| accontId   | int(11)      | YES  |     | NULL    |                |
| name       | varchar(255) | YES  |     | NULL    |                |
| createdOn  | datetime     | YES  |     | NULL    |                |
| modifiedOn | datetime     | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)


> ALTER TABLE Entry ADD COLUMN (addressBookId INT, firstName VARCHAR(255), lastName VARCHAR(255));
describe Entry;  // ok
> ALTER TABLE Entry ADD COLUMN (birthday DATETIME, type ENUM('home', 'work', 'other'));
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0
> describe Entry;  // ok
> ALTER TABLE Entry ADD COLUMN (subtype ENUM('phone', 'address', 'email'));
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0
> describe Entry;  // ok
> ALTER TABLE Entry ADD COLUMN (contentLineOne VARCHAR(255), contentLineTwo VARCHAR(255),contentLineThree VARCHAR(255),contentLineFour VARCHAR(255),contentLineFive VARCHAR(255));
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

> describe Entry;
+------------------+---------------------------------+------+-----+---------+----------------+
| Field            | Type                            | Null | Key | Default | Extra          |
+------------------+---------------------------------+------+-----+---------+----------------+
| id               | int(11)                         | NO   | PRI | NULL    | auto_increment |
| addressBookId    | int(11)                         | YES  |     | NULL    |                |
| firstName        | varchar(255)                    | YES  |     | NULL    |                |
| lastName         | varchar(255)                    | YES  |     | NULL    |                |
| birthday         | datetime                        | YES  |     | NULL    |                |
| type             | enum('home','work','other')     | YES  |     | NULL    |                |
| subtype          | enum('phone','address','email') | YES  |     | NULL    |                |
| contentLineOne   | varchar(255)                    | YES  |     | NULL    |                |
| contentLineTwo   | varchar(255)                    | YES  |     | NULL    |                |
| contentLineThree | varchar(255)                    | YES  |     | NULL    |                |
| contentLineFour  | varchar(255)                    | YES  |     | NULL    |                |
| contentLineFive  | varchar(255)                    | YES  |     | NULL    |                |
+------------------+---------------------------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)


> create database chickens;
CREATE TABLE Barn (id INT auto_increment primary key, address VARCHAR(255), owner VARCHAR(255));

mysql> describe Barn;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| id      | int(11)      | NO   | PRI | NULL    | auto_increment |
| address | varchar(255) | YES  |     | NULL    |                |
| owner   | varchar(255) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

CREATE TABLE Chicken (id INT auto_increment primary key, foreign key(id) references Barn(id));

SHOW CREATE TABLE Chicken;
// display foreign key in table
ALTER TABLE Chicken ADD COLUMN (type ENUM('male', 'female'), birthdate DATETIME, deceaseDate DATETIME);


CREATE TABLE Breed (breedId INT auto_increment primary key, plumage VARCHAR(100), color VARCHAR(100), comb_type VARCHAR(100), number_of_toes INT);

ALTER TABLE Chicken ADD COLUMN (foreign key(breedId) REFERENCES Breed(breedId));

ALTER TABLE Chicken ALTER COLUMN type SET DEFAULT 'female';

CREATE TABLE Entry (entryId INT auto_increment primary key, date DATETIME, eggsLaid INT, weight INT, otherEvent VARCHAR(255));



ALTER TABLE Entry ADD FOREIGN KEY (chickenId) REFERENCES Chicken(id);


ALTER TABLE Chicken ADD FOREIGN KEY (barnId) REFERENCES Barn(id);

ALTER TABLE Chicken ADD COLUMN (breedId INT, FOREIGN KEY (breedId) REFERENCES Breed(breedId));


CREATE DATABASE hotel;
USE hotel;
CREATE TABLE Floor (floorId INT auto_increment PRIMARY KEY, floorNum VARCHAR(10));
CREATE TABLE Rooms (roomId INT auto_increment PRIMARY KEY, roomNum VARCHAR(10), floorId INT, FOREIGN KEY (floorId) REFERENCES Floor(floorId));
ALTER TABLE Rooms ADD COLUMN (maxOccupancy INT, withKitchen INT, type ENUM('rent', 'janitor closet', 'public laundry room','gym','other'));
ALTER TABLE Rooms ADD COLUMN (windowNum INT, withCarpet ENUM('yes', 'no'));
ALTER TABLE Rooms CHANGE withKitchen withKitchen ENUM('yes', 'no'); 
ALTER TABLE Rooms ALTER COLUMN withKitchen SET DEFAULT 'no';

CREATE TABLE Bookings (bookingId INT auto_increment PRIMARY KEY);
CREATE TABLE Client (clientId INT auto_increment PRIMARY KEY, clientInfo VARCHAR(255));
ALTER TABLE Bookings ADD COLUMN(clientId INT, FOREIGN KEY (clientId) REFERENCES Client(clientId));
ALTER TABLE Bookings ADD COLUMN(dateArrive DATETIME, dateDepart DATETIME, guests INT, roomId INT, FOREIGN KEY (roomId) REFERENCES Rooms(roomId));



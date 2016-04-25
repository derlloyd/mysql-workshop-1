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

DROP DATABASE IF EXISTS api_test;
CREATE DATABASE api_test;
USE api_test;
	
CREATE TABLE customer (
  ID INT NOT NULL AUTO_INCREMENT,
  Name varchar(255) NOT NULL,
  Address varchar(255) NOT NULL,
  Country varchar(100) NOT NULL,
  Phone INT(12) NOT NULL,
  Created_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Updated_on datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO customer
VALUES(2,'STEVE','124 fuckwad lane', 'usa', '32349292', DEFAULT, DEFAULT);
INSERT INTO customer
VALUES(DEFAULT,'Steve-er-ino','124 fuckwad lane', 'usa', '32349292', DEFAULT, DEFAULT);
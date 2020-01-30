DROP DATABASE IF EXISTS week4Lab;
CREATE DATABASE week4Lab;

CREATE TABLE Customer (
	CustId INT(11) PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(55),
    CustBalance DECIMAL(6, 2),
    CustPhone CHAR(10)
);

INSERT INTO Customer
	(CustId, CustName, CustBalance,CustPhone)
VALUES (DEFAULT, 'Steve', 34.45, '2064342667');

-- use cathyCakes

DROP DATABASE IF EXISTS als_aquariums;

CREATE DATABASE als_aquariums;

USE als_aquariums;

CREATE TABLE fish (
	FishId INT PRIMARY KEY AUTO_INCREMENT,
    FishName VARCHAR(20) NOT NULL,
    FishType ENUM('Salt', 'Fresh') NOT NULL
);

CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerLName VARCHAR(15) NOT NULL,
    CustomerFName VARCHAR(15) NOT NULL,
    CustPhone CHAR(10)
);

CREATE TABLE Aquarium (
	AquariumId INT PRIMARY KEY AUTO_INCREMENT,
    AquariumGallons SMALLINT(3) NOT NULL,
    AquariumFinish ENUM('Wood','Black') NOT NULL
);

CREATE TABLE Pump (
	PumpId INT PRIMARY KEY AUTO_INCREMENT,
    PumpType ENUM('Salt','Fresh') NOT NULL,
    PumpFlowRateGPM SMALLINT(4) NOT NULL
);

CREATE TABLE Cust_Order (
	OrderNum INT PRIMARY KEY AUTO_INCREMENT
);
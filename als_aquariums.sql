DROP DATABASE IF EXISTS als_aquariums;

CREATE DATABASE als_aquariums;

USE als_aquariums;

CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerLName VARCHAR(15) NOT NULL,
    CustomerFName VARCHAR(15) NOT NULL,
    CustPhone CHAR(10)
);

INSERT INTO Customer 
VALUES (
	DEFAULT, 'Doe', 'John', 2064645588),
	(DEFAULT, 'Jane','Doe',5096453894),
	(DEFAULT, 'Jeff', 'Lebowski', 5556498525),
	(DEFAULT, 'Luke', 'Skywalker', 6063136465);

CREATE INDEX CUSTPHONE
ON Customer (CustPhone);

CREATE TABLE Aquarium (
	AquariumId INT PRIMARY KEY AUTO_INCREMENT,
    AquariumGallons SMALLINT(3) NOT NULL,
    AquariumFinish ENUM('Wood','Black') NOT NULL
);

INSERT INTO Aquarium
VALUES (
	DEFAULT, 50, 'Wood'),
	(DEFAULT,100,'Black'),
	(DEFAULT,75,'Wood'),
	(DEFAULT,125,'Black');

CREATE TABLE Pump (
	PumpId INT PRIMARY KEY AUTO_INCREMENT,
    PumpType ENUM('Salt','Fresh') NOT NULL,
    PumpFlowRateGPM SMALLINT(4) NOT NULL
);

INSERT INTO Pump
VALUES(
	DEFAULT,'Salt',200),
    (DEFAULT,'Fresh',150),
    (DEFAULT,'Salt',75),
    (DEFAULT,'Fresh',40);

CREATE TABLE fish (
	FishId INT PRIMARY KEY AUTO_INCREMENT,
    FishName VARCHAR(20) NOT NULL,
    FishType ENUM('Salt', 'Fresh') NOT NULL
);

INSERT INTO fish 
VALUES 	(DEFAULT,'Clown Fish','Salt'),
		(DEFAULT,'Puffer Fish', 'Salt'),
		(DEFAULT, 'Sword Fish', 'Salt'),
		(DEFAULT, 'Trout', 'Fresh'),
        (DEFAULT, 'Salmon', 'Salt'),
        (DEFAULT, 'Halibut', 'Salt'),
        (DEFAULT, 'Steelhead', 'Fresh');

CREATE TABLE Orders (
	OrderNum INT AUTO_INCREMENT NOT NULL,
    AquariumId INT NOT NULL,
    PumpId INT NOT NULL,
    CustomerId INT NOT NULL,
    CONSTRAINT orders_pk
		PRIMARY KEY (OrderNum),
	CONSTRAINT aquarium_fk
		FOREIGN KEY (AquariumId)
		REFERENCES Aquarium (AquariumId),
	CONSTRAINT pump_fk
		FOREIGN KEY (PumpId)
        REFERENCES Pump (PumpId),
	CONSTRAINT customer_fk
		FOREIGN KEY (CustomerId)
		REFERENCES Customer (CustomerId)
    ON DELETE CASCADE
);
INSERT INTO Orders
VALUES (
	DEFAULT,1,1,1),
    (2,2,2,2),
    (DEFAULT,2,2,4),
    (DEFAULT,3,3,3),
    (DEFAULT,3,1,1),
    (DEFAULT,4,2,4),
    (DEFAULT,3,4,2);


CREATE TABLE OrderFish (
	OrderNum INT AUTO_INCREMENT,
    FishId INT NOT NULL,
	OrderFishCount TINYINT(2) NOT NULL,
	CONSTRAINT fish_id_fk
		FOREIGN KEY (FishId)
		REFERENCES Fish (FishId),
	CONSTRAINT orders_fk
		FOREIGN KEY (OrderNum)
		REFERENCES Orders (OrderNum),
        CONSTRAINT orderfish_pk
		PRIMARY KEY (OrderNum, FishId)
);

INSERT INTO OrderFish
VALUES (
	DEFAULT,1,25),
    (DEFAULT,2,10),
    (DEFAULT,4,40),
    (4,3,50),
    (3,2,30),
    (5,2,40);

SELECT * FROM fish;
SELECT * FROM orders;
SELECT * FROM Customer;
SELECT * FROM OrderFish;

-- get all customers who ordered a specific fish by name
SELECT * 
FROM Customer
INNER JOIN orders
	USING(customerId)
INNER JOIN OrderFish
	USING(OrderNum)
INNER JOIN Fish
	USING(FishId)
WHERE fishName = 'Puffer Fish';

-- get best selling fishType
SELECT
	FishName,
    FishType,
    SUM(OrderFishCount) as totalPurchased
FROM orderFish
JOIN Fish
WHERE OrderFish.FishId = Fish.fishId
GROUP BY FishName
ORDER BY totalPurchased DESC;

-- get most sold aquarium type
SELECT
	distinct
    aquariumGallons,
    aquariumFinish,
    orders.aquariumId,
    COUNT(orders.AquariumId) as totalSales
FROM Orders
INNER JOIN Aquarium
	WHERE orders.AquariumId = Aquarium.AquariumId
GROUP BY orders.aquariumId
ORDER BY totalSales DESC;
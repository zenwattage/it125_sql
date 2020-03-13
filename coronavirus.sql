DROP DATABASE IF EXISTS coronavirus;
CREATE DATABASE coronavirus;
USE coronavirus;

# Creating Country Table
CREATE TABLE Country
(
CountryId			INT				NOT NULL 	AUTO_INCREMENT,
CountryName			VARCHAR(60)		NOT NULL,
Continent			ENUM('North America','South America','Africa','Asia','Antarctica','Europe','Oceania')		NOT NULL,
CountryPopulation	INT				NOT NULL,
CountrySurfaceArea	INT				NOT NULL,
CONSTRAINT Count_CountryId_PK 
	PRIMARY KEY(CountryId)
);

INSERT INTO country
VALUES
	(1, 'China', 'Asia', 1435000000,3700000),
    (2, 'US',  'North America', 300000, 71362),
	(3, 'Cruise Ship', 'Asia', 3750, 682),
    (4, 'Italy',  'Europe', 2879728, 116347),
    (5, 'Australia', 'Oceania',25203198, 2920000),
    (6, 'Canada',  'North America',13448494, 3855000),
    (7, 'Denmark', 'Europe', 51783, 16577 ),
    (8, 'France',  'Europe', 77741, 248573),
    (9, 'Thailand', 'Asia', 68000000 ,198120),
    (10, 'United Kingdom', 'Europe', 67545757 ,94000),
    (11, 'Iran', 'Asia', 83000000 ,636400)  ;

SELECT * FROM country;
 	
# Creating State Table
CREATE TABLE State
(
StateId				INT				NOT NULL		AUTO_INCREMENT,
CountryId			INT				NOT NULL,
StateName			VARCHAR(45)		NOT NULL,
StatePopulation		INT				NOT NULL,
CONSTRAINT State_StateId_PK
	PRIMARY KEY(StateId),
CONSTRAINT State_CountryId_FK
	FOREIGN KEY(CountryId)
    REFERENCES Country (CountryId)
    ON DELETE CASCADE
);

INSERT INTO State
VALUES
	(2, 1, 'Hubei', 1023000),
	(1, 2, 'Washington', 300000),
    (6, 3, 'Diamond Princess', 3700), 
    (4, 4, 'Rome', 2600000),
    (8, 5, 'Melbourne', 4800000),
    (5, 6, 'Toronto', 6197000),
    (3, 7, 'Copenhagen', 794128),
    (7,	8, 'Paris', 2148000),    
    (10, 9, 'Chang Mai', 131091),
    (9, 10, 'Manchester', 547627),    
    (12, 11, 'Tehran', 8700000),
    (13, 2, 'California', 39000000),
    (14, 1, 'Guangdong', 113000000),
    (11, 4, 'Milan', 3208509),
    (15, 2, 'New York', 19453561) 
    ;

SELECT * FROM State;

# Creating Patient Table
CREATE TABLE Patient
(
PatientId		INT				NOT NULL		AUTO_INCREMENT,
PatientFName	VARCHAR(45)		NOT NULL,
PatientLName	VARCHAR(45)		NOT NULL,
InfectionDate	DATE			NOT NULL,
CureDate		DATE			NULL,
DeathDate		DATE			NULL,
CONSTRAINT Pat_PatientId_PK
	PRIMARY KEY(PatientId)
);
INSERT INTO Patient
(PatientId, PatientFName, PatientLName,InfectionDate)
VALUES
	(1, 'Donald', 'Trump', '2020-03-03'),
    (2, 'Mike', 'Pence', '2020-01-15')
    
    ;

INSERT INTO Patient
VALUES
	(3, 'John', 'Doe', '2020-02-11', '2020-03-04', null),
    (4, 'Jeffrey', 'Lebowski', '2020-01-20','2020-01-23', null),
    (5, 'James', 'Bond', '2020-02-02', '2020-02-04',null);

select 
*,
MONTHNAME(InfectionDate) 
from patient
;


# Creating Quarantine Table
CREATE TABLE Quarantine
(
QuarantineId		INT				NOT NULL		AUTO_INCREMENT,
StateId				INT				NOT NULL,
QuarantineName		VARCHAR(45)		NOT NULL,
QuarantineProvider	VARCHAR(45)		NOT NULL,
CONSTRAINT Quar_QuarantineId_PK
	PRIMARY KEY(QuarantineId),
CONSTRAINT Quar_StateId_FK
	FOREIGN KEY(StateId)
    REFERENCES State (StateId)
    ON DELETE CASCADE
);

INSERT INTO Quarantine
VALUES
	(1, 2, 'Kirkland', 'Leisure Care'),
    (2, 15, 'New Rochelle', 'CDC'),
    (3, 4, 'Milan', 'Ministry of Health'),
    (4, 2, 'Seattle', 'CDC'),
    (5, 2, 'New York', 'CDC'),
    (6, 2, 'Los Angeles', 'CDC'),
    (7, 1, 'Wuhan', 'Xi Jinping'),
    (8, 6, 'Ontario', 'Public Health Authority')
    ;

SELECT * FROM Quarantine;


# Creating Quarantined Patients Table
CREATE TABLE QuarantinedPatients
(
QuarantineId	INT		NOT NULL		AUTO_INCREMENT,
PatientId		INT		NOT NULL,
CONSTRAINT 
	PRIMARY KEY(QuarantineId, PatientId),
CONSTRAINT QuarPat_QuarantineId_FK
	FOREIGN KEY (QuarantineId)
    REFERENCES Quarantine (QuarantineId)
    ON DELETE CASCADE,
CONSTRAINT QuarPat_PatientId_FK
	FOREIGN KEY (PatientId)
    REFERENCES Patient (PatientId)
    ON DELETE CASCADE
);

INSERT INTO QuarantinedPatients
VALUES(1, 2);

SELECT * FROM QuarantinedPatients;
    






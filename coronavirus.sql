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

insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Jobie', 'Geator', '2019-12-06', '2019-04-17', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Walsh', 'Hartrick', '2019-06-18', null,null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Tobye', 'Soigne', '2019-04-18', '2019-12-21', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Kerry', 'Strathe', '2019-06-23', null, '2019-04-09');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Lyman', 'Rolance', '2019-05-18', '2019-09-13', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Sloan', 'Brett', '2019-10-12', null, null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Alvin', 'Tynemouth', '2019-08-14', '2019-08-22', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Malorie', 'Muldoon', '2019-05-07', null, null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Inglebert', 'Goad', '2019-08-17', '2020-01-19', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Brenna', 'Crimes', '2019-06-01', null, '2020-01-24');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Zak', 'Scherme', '2019-04-11', '2020-02-12', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Babb', 'Lafayette', '2019-10-03', '2019-02-25',null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Gianina', 'Brant', '2019-12-04', null, '2020-03-01');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Karoly', 'Giorio', '2019-04-24', '2019-07-17', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Consalve', 'Gurry', '2019-09-26', '2019-09-12', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Riobard', 'Alvarado', '2019-07-30', '2020-01-08', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Rodolfo', 'Handke', '2019-03-26', null, '2019-08-29');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Dmitri', 'Tyrer', '2020-03-02', '2019-07-14', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Tommie', 'Bowld', '2019-04-27', '2019-09-03', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Heddi', 'Fradson', '2019-02-04', null, null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Kele', 'Huet', '2019-08-16', '2019-02-10', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Alfredo', 'Whatham', '2020-02-01', null, '2020-03-06');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Selia', 'Cottier', '2019-03-13', '2020-02-17', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Cassi', 'Abbay', '2019-08-30', '2019-12-12', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Karlene', 'Brafferton', '2019-09-06', '2019-04-10', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Mychal', 'Braun', '2019-12-28', '2019-04-23', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Rabi', 'Spare', '2020-01-02', '2019-11-13', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Cristal', 'Lovel', '2019-10-30', null, null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Nance', 'Hartshorn', '2019-12-09', null, '2019-05-25');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Jeralee', 'Trevaskiss', '2019-09-25', '2019-08-22', null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Bail', 'Fleischer', '2020-03-09', null, '2019-09-18');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Avictor', 'Winscum', '2019-09-21', null, null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Corbett', 'Schouthede', '2019-07-05', '2019-01-24',null);
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Lemmie', 'Gummow', '2019-03-05', null, '2020-02-28');
insert into Patient (PatientFName, PatientLName, InfectionDate, CureDate, DeathDate) values ('Mariele', 'Byars', '2019-05-18', '2019-10-26', null);
SELECT * FROM patient;


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
    (5, 15, 'New York', 'CDC'),
    (6, 13, 'Los Angeles', 'CDC'),
    (7, 1, 'Wuhan', 'Xi Jinping'),
    (8, 6, 'Ontario', 'Public Health Authority'),
    (9, 7, 'Haut-Rhin', 'Ministry of Social Affairs and Health'),
    (10, 8, 'Sydney', 'Department of Health')
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
VALUES
	(1, 2),
    (3,5),
    (2,3),
    (1,1),
    (3,4),
    (4,6),
    (4,7),
    (8,9),
    (1,8),
    (4,10),
    (6,11),
    (9,12),
    (9,13),
    (1,14),
    (2,15),
    (3,16),
    (5,17),
    (6,18),
    (7,19),
    (5,20),
    (10,21),
    (7,22),
    (5,23),
    (1,24),
    (2,25),
    (3,26),
    (10,27),
    (7,28),
    (8,29),
    (9,30)
    ;

SELECT * FROM QuarantinedPatients;

DROP DATABASE IF EXISTS csvParseDb;
CREATE DATABASE csvParseDb;
USE csvParseDb;



CREATE TABLE cases (
	case_Id INT PRIMARY KEY AUTO_INCREMENT,
	province_state VARCHAR(45),
	country VARCHAR(45),
    last_update VARCHAR(45),
    confirmed INT UNSIGNED,
    deaths INT UNSIGNED,
    recovered INT UNSIGNED,
    latitude DECIMAL(8,5),
    longitude DECIMAL(8,5)
    
);

  select * from country;
  select * from cases;

-- INSERT INTO cases 
-- VALUES(DEFAULT,'Hubei','Mainland China','2020-03-05T14:53:03',67466,2902,40592,30.9756,112.2707);



CREATE TABLE IF NOT EXISTS country (
  `CountryID` INT NOT NULL AUTO_INCREMENT,
  `CountryName` VARCHAR(60) NOT NULL,
  `Region` VARCHAR(45) NOT NULL,
  `Continent` ENUM('North America', 'South America', 'Africa', 'Asia', 'Antarctica', 'Oceania') NOT NULL DEFAULT 'Asia',
  `CountryPopulation` INT NOT NULL,
  `CountrySurfaceArea` INT NOT NULL,
  PRIMARY KEY (`CountryID`));
  
  INSERT INTO country 
  VALUES(
	DEFAULT,'China','Hubei','Asia',1386000000,34000000
  );
  
DROP TABLE IF EXISTS WHR_2019;
DROP TABLE IF EXISTS world_countries;


-- Create World hhappiness report table
CREATE TABLE WHR_2019 (
	Country VARCHAR(50) PRIMARY KEY UNIQUE NOT null,
	HappinessRank SMALLINT NOT null,
	HappinessScore DECIMAL(5,3) NOT null,
	GDP DECIMAL(6,5) NOT null,
	Family DECIMAL(6,5) NOT null,
	LifeExpectancy DECIMAL(6,5) NOT null,
	Freedom DECIMAL(6,5) NOT null,
	Generosity DECIMAL(6,5) NOT null,
	Trust DECIMAL(6,5) NOT null
	);

copy WHR_2019 from 'C:\Users\saleh\Desktop\UCB Bootcamp\Final Project\Data\2019.csv' with delimiter ',' csv header encoding 'windows-1251';



-- CREATE World Countries table
CREATE TABLE World_Countries (
	Country_code CHAR(2) PRIMARY KEY UNIQUE NOT null,
	lat Decimal(8,6) NOT null,
	Lng Decimal(9,6) NOT null, 
	Country VARCHAR(50) NOT null
);

copy World_Countries from 'C:\Users\saleh\Desktop\UCB Bootcamp\Final Project\Data\world_country_and_usa_states_latitude_and_longitude_values.csv' with 
delimiter ',' csv header encoding 'windows-1251';


-- Check matching countries
SELECT whr.country,wc.country FROM whr_2019 AS whr
LEFT JOIN world_countries AS wc ON whr.country = wc.country
WHERE wc.country IS null
ORDER BY whr.country ASC;


-- Updating Countries to match world_countries table.

--CG
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='CG')
WHERE country = 'Congo (Brazzaville)';

--CD
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='CD')
WHERE country = 'Congo (Kinshasa)';

--CI
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='CI')
WHERE country = 'Ivory Coast';

--MM
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='MM')
WHERE country = 'Myanmar';

--MK
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='MK')
WHERE country = 'North Macedonia';

--MK
DELETE FROM whr_2019 WHERE country = 'Northern Cyprus';

-- Droping South sudan row due to insufficient data
DELETE FROM whr_2019 WHERE country = 'South Sudan';

--TT
UPDATE whr_2019
SET country = (SELECT country FROM world_countries
			  WHERE country_code='TT')
WHERE country = 'Trinidad & Tobago';


-- Adding Dependencies
SELECT country, COUNT(*) 
FROM whr_2019
GROUP BY country
HAVING COUNT(*) > 1

	
CREATE TABLE countries (
	country_code CHAR(2) PRIMARY KEY UNIQUE NOT null,
	country VARCHAR(50)  UNIQUE NOT null,
	FOREIGN KEY (country) REFERENCES whr_2019(country)
)

INSERT INTO countries
SELECT wc.country_code, whr.country 
FROM whr_2019 AS whr
INNER JOIN world_countries AS wc ON whr.country = wc.country;

ALTER TABLE whr_2019
ADD COLUMN lat Decimal(8,6);

ALTER TABLE whr_2019
ADD COLUMN lng Decimal(9,6);

UPDATE whr_2019 AS whr
SET lat =  (SELECT lat FROM world_countries AS wc
		   WHERE wc.country = whr.country);
		   
UPDATE whr_2019 AS whr
SET lng =  (SELECT lng FROM world_countries AS wc
		   WHERE wc.country = whr.country);
		   
DROP TABLE world_countries


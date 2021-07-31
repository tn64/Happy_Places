DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS WHR_2019;


CREATE TABLE WHR_2019 (
	Country VARCHAR(50) PRIMARY KEY UNIQUE,
	HappinessRank SMALLINT,
	HappinessScore DECIMAL(5,3),
	GDP DECIMAL(6,5),
	Family DECIMAL(6,5),
	LifeExpectancy DECIMAL(6,5),
	Freedom DECIMAL(6,5),
	Generosity DECIMAL(6,5),
	Trust DECIMAL(6,5)
	);

copy WHR_2019 from 'C:\Users\saleh\Desktop\UCB Bootcamp\Final Project\Data\2019.csv' with delimiter ',' csv header encoding 'windows-1251';

CREATE TABLE countries (
	country_code CHAR(2) PRIMARY KEY UNIQUE,
	lat Decimal(8,6),
	lng Decimal(9,6),
	country VARCHAR(50) UNIQUE
);
	
copy countries from 'C:\Users\saleh\Desktop\UCB Bootcamp\Final Project\Data\world_country_and_usa_states_latitude_and_longitude_values.csv' with delimiter ',' csv header encoding 'windows-1251';	

	
SELECT DISTINCT C.country,W.country FROM countries AS C
FULL OUTER JOIN whr_2019 AS W on C.country = W.country
WHERE C.country is null

-- Match country names

DELETE FROM whr_2019
where country = 'South Sudan'

DELETE FROM whr_2019
where country = 'Northern Cyprus';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CG')
WHERE country = 'Congo (Brazzaville)';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CD')
WHERE country = 'Congo (Kinshasa)';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CI')
WHERE country = 'Ivory Coast';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'MM')
WHERE country = 'Myanmar';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'MK')
WHERE country = 'North Macedonia';

UPDATE whr_2019
SET country = (SELECT country FROM countries
			  WHERE country_code = 'TT')
WHERE country = 'Trinidad & Tobago';

-- Query History 

ALTER TABLE whr_2019
ADD COLUMN lat Decimal(8,6);

ALTER TABLE whr_2019
ADD COLUMN lng Decimal(9,6);

UPDATE whr_2019 AS whr
SET lat =  (SELECT lat FROM countries AS wc
		   WHERE wc.country = whr.country)
		  
		   
UPDATE whr_2019 AS whr
SET lng =  (SELECT lng FROM countries AS wc
		   WHERE wc.country = whr.country);

 

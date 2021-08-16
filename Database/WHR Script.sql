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

CREATE TABLE countries (
	country_code CHAR(2) PRIMARY KEY UNIQUE,
	lat Decimal(8,6),
	lng Decimal(9,6),
	country VARCHAR(50) UNIQUE
);
	
	
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

 
-- create alcohol_cons Table and clean it

CREATE TABLE alcohol_cons
(
    country varchar(50),
    alcohol_per_year numeric(3,1)
)

SELECT DISTINCT C.country,ac.country FROM countries AS C
FULL OUTER JOIN alcohol_cons AS ac on C.country = ac.country
WHERE C.country is null;

-- Match country names

DELETE FROM alcohol_cons
where country = 'Northern Cyprus';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CG')
WHERE country = 'Republic of the Congo';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CD')
WHERE country = 'DR Congo';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'CI')
WHERE country = 'Ivory Coast';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'MM')
WHERE country = 'Myanmar';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'SZ')
WHERE country = 'Eswatini';

UPDATE alcohol_cons
SET country = (SELECT country FROM countries
			  WHERE country_code = 'ST')
WHERE country = 'Sao Tome and Principe';

SELECT DISTINCT C.country,ac.country FROM countries AS C
FULL OUTER JOIN alcohol_cons AS ac on C.country = ac.country
WHERE C.country is null;


-- Adding alcohol_LiPerYear column and populating it
ALTER TABLE whr_2019
ADD COLUMN alcohol_LiPerYear numeric(3,1);

UPDATE whr_2019 AS whr
SET alcohol_LiPerYear =  (SELECT alcohol_per_year FROM alcohol_cons AS wc
		   WHERE wc.country = whr.country);

-- Check for null values
SELECT * FROM whr_2019
WHERE alcohol_LiPerYear is null or country is null






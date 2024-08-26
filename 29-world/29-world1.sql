use world;
#1
SELECT * FROM country
	WHERE continent='Europe';
#2
SELECT * FROM country
	WHERE continent='North America'
    OR continent='Africa';
#3
SELECT country.code AS country_code, country.name AS country_name, continent, country.population AS country_population, city.name AS city_name
	FROM world.city
    LEFT JOIN country ON city.countrycode=country.code
    WHERE country.population>100000000;
#4
SELECT name AS country, language
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language='spanish';
#5
SELECT name AS country, language, isofficial
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language='spanish'
    AND isofficial="T";
#6
SELECT name AS country, language
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language IN ('spanish','english');
#7
SELECT name AS country, language, percentage, isofficial
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language='arabic'
		AND percentage>30
        AND NOT isofficial="T";
#8
SELECT name AS country, language, isofficial, percentage
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language='french'
		AND percentage<50
        AND isofficial="T";
#9
SELECT name AS country, language, isofficial
	FROM country
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE isofficial="T"
    ORDER BY language;
#10
SELECT country.name AS country, city.name AS cty ,language, isofficial
	FROM city
    LEFT JOIN country ON city.countrycode=country.code
    LEFT JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE isofficial="T"
    ORDER BY city.population desc
    LIMIT 100;
#11
SELECT country.name AS country, lifeexpectancy,city.name AS city, country.population
	FROM city
    LEFT JOIN country ON country.code=city.countrycode
    WHERE lifeexpectancy < 40
    ORDER BY city.population desc
    LIMIT 100;
    
#12
SELECT country.name AS country, city.name AS cty , lifeexpectancy
	FROM city
    LEFT JOIN country ON city.countrycode=country.code
    Inner JOIN countrylanguage ON countrylanguage.countrycode=country.code
    WHERE language='english'
    ORDER BY lifeexpectancy desc
    LIMIT 100;
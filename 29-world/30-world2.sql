#1
SELECT continent, count(*) AS total_countries, lifeexpectancy
	FROM world.country
    WHERE lifeexpectancy>70
    GROUP by continent;
	
#2
SELECT continent, name, lifeexpectancy
	FROM world.country
    WHERE lifeexpectancy BETWEEN 60 AND 70
    GROUP BY continent;

#3
SELECT name, lifeexpectancy
	FROM world.country
    WHERE lifeexpectancy>70;
    
#4
SELECT name, lifeexpectancy
	FROM world.country
    WHERE lifeexpectancy<40;

#5
SELECT name, Population
	FROM world.country
    ORDER BY Population desc
    LIMIT 10;

#6
SELECT sum(Population) as total_population
	FROM world.country;

#7
SELECT continent, sum(Population) as total_population
	FROM world.country
    GROUP BY continent
    HAVING total_population > 500000000;
#8
SELECT continent, count(name) AS country, sum(Population) as total_population, avg(lifeexpectancy) as life_expectancy
	FROM world.country
    GROUP BY continent
    HAVING life_expectancy < 71;
    
#Part2
#1
SELECT country.name AS country, count(city.name) AS number_of_cities
	FROM city
    LEFT JOIN country ON  city.countrycode=country.code
    GROUP by country
    ORDER BY country;
    
#2
SELECT country.name AS country, language, count(country.name) AS number_of_countries
	FROM country	
    RIGHT JOIN countrylanguage ON  country.code=countrylanguage.countrycode
    GROUP BY language;
#3
SELECT language, count(country.name) AS total_countries, isofficial
	FROM country	
    RIGHT JOIN countrylanguage ON  country.code=countrylanguage.countrycode
    WHERE isofficial="T"
    GROUP BY language;
#4
SELECT country.continent AS continent, count(city.name) AS total_cities, AVG(city.population) AS average_cities_population
	FROM city
    LEFT JOIN country ON  city.countrycode=country.code
    GROUP BY continent;
#5
# This Verification if percentage total of each langague in country's population will be 100%, resulting otherwise means that there are unaccounted languages within the country; There for total_pop != total_langauge_pop
SELECT *,sum(percentage) FROM countrylanguage GROUP BY countrycode;


#This is the query to find how many people int he world speaks the language
SELECT language, sum(country.population*percentage/100) AS total_population
	FROM country
	RIGHT JOIN countrylanguage ON  country.code=countrylanguage.countrycode
    GROUP BY language;
    
#This is the query that verifies that in each country hte total_population is not exactly the same as population within the langauge percentage.
SELECT name AS country , population AS total_population, sum(percentage), population * sum(percentage) AS expected_total_population_with_langaguep ,sum(country.population*percentage/100) AS total_population_with_langague
	FROM country
	RIGHT JOIN countrylanguage ON  country.code=countrylanguage.countrycode
    GROUP BY country.name;

#This query verifies that the total of the population and total population with language.
SELECT sum(total_population),sum(total_population_with_langague)
	FROM(
    SELECT name AS country , population AS total_population, sum(percentage), population * sum(percentage) AS expected_total_population_with_langaguep ,sum(country.population*percentage/100) AS total_population_with_langague
	FROM country
	RIGHT JOIN countrylanguage ON  country.code=countrylanguage.countrycode
    GROUP BY country.name) AS world_total
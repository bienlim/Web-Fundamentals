#1
use sakila;
SELECT * FROM customer;

#2
SELECT CONCAT(first_name," ",last_name) AS customer_name, address FROM customer LEFT JOIN address ON customer.address_id=address.address_id;

#3
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id;

#4
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city, country 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    ORDER BY country;
    
#5
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city, country 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE country='Bolivia';
    
#6
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city, country 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE country IN ('Bolivia','Germany','Greece');

#7
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city, country 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE city='Baku';
#8
SELECT CONCAT(first_name," ",last_name) AS customer_name, address, city, country 
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE city IN ('Baku','Beira','Bergamo');
    
#9
SELECT CONCAT(first_name," ",last_name) AS customer_name, country, LENGTH(country) as country_name_length
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE LENGTH(country)<5
    ORDER BY LENGTH(customer_name) desc;
    
#10
SELECT CONCAT(first_name," ",last_name) AS customer_name, country, city, LENGTH(city) AS city_name_length
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    WHERE LENGTH(city)>10
    ORDER BY country, city; 
#11
SELECT CONCAT(first_name," ",last_name) AS customer_name, city
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    WHERE city LIKE '%ba%';

#12
SELECT CONCAT(first_name," ",last_name) AS customer_name, city, LENGTH(city) AS city_name_length
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    WHERE city LIKE '% %'
    ORDER BY LENGTH(city) desc;

#13
SELECT CONCAT(first_name," ",last_name) AS customer_name, city, country, LENGTH(city) AS city_name_length, LENGTH(country) as country_name_length
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
	LEFT JOIN country ON city.country_id=country.country_id
    WHERE LENGTH(country)>LENGTH(city)
    ORDER BY country;

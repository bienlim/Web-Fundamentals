use sakila;
#1
SELECT country,count(customer_id) AS total_number_of_customer
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    GROUP BY country
    ORDER BY country;
    
#2
SELECT country,count(customer_id) AS total_number_of_customer
	FROM customer 
	LEFT JOIN address ON customer.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id
    GROUP BY city
    ORDER BY country;

#PART2
select * from payment;
#1
SELECT DATE_FORMAT(payment_date,'%M-%Y')  As month_and_year, sum(amount) AS total_rental_amount, count(payment_id) AS total_transactions, avg(amount) AS average_rental_amount
	FROM payment
    GROUP BY month_and_year;
    
#2
SELECT DATE_FORMAT(payment_date,'%l-%p')  As hour_of_the_day, sum(amount) AS total_payments_recieved
	FROM payment
    GROUP BY hour_of_the_day;

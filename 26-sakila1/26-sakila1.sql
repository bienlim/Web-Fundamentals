#1
select * From customer where customer_id=20;
#2
select * from customer where customer_id between 20 and 60;
#3
select * from customer where first_name like 'l%';
#4
select * from customer where first_name like '%l%';
#5
select * from customer where first_name like '%l';
#6
select * from customer where last_name like 'c%' order by create_date desc;
#7
select * from customer where last_name like '%nn%' order by create_date limit 5;
#8
select customer_id, first_name, last_name, email address from customer where customer_id in(515, 181, 582, 503, 29, 85);
#9
select first_name,last_name,email as email_address,store_id from customer where store_id=2;
#10
select first_name, last_name, email from customer order by email desc;
#11
select customer_id, first_name, last_name, email from customer where  active=1 and month(create_date)=2;
#12
select email, length(email) as email_length from customer order by email_length desc, email ;
#13
select email, length(email) as email_length from customer order by email_length limit 100 ;


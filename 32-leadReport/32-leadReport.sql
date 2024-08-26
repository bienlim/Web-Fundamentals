use lead_gen_business;
select * FROM billing;
select * FROM clients;
select * FROM leads;
select * FROM sites;
#1
SELECT domain_name AS website, client_id
	FROM sites
    WHERE client_id=15;
    
#2
SELECT DATE_FORMAT(created_datetime, '%M') AS month, count(site_id) AS total_count
	FROM sites
    WHERE DATE_FORMAT(created_datetime, '%Y')=2011
		AND DATE_FORMAT(created_datetime, '%M')='june'
	GROUP BY month;
#3
SELECT DATE_FORMAT(charged_datetime, '%Y-%m-%d') AS date, sum(amount) AS revenue
	FROM billing
    WHERE DATE_FORMAT(charged_datetime, '%Y-%m-%d') ='2012-11-19'
    GROUP BY date;
#4
SELECT client_id, sum(amount) AS revenue, DATE_FORMAT(charged_datetime, '%M') as month, DATE_FORMAT(charged_datetime, '%Y') as year
	FROM billing
    WHERE client_id=1
    GROUP BY DATE_FORMAT(charged_datetime, '%Y-%m');
#5
SELECT  concat(first_name," ",last_name) AS client_name, sum(amount) AS total_revenue, DATE_FORMAT(charged_datetime, '%M') as month_charged, DATE_FORMAT(charged_datetime, '%Y') as year_charged
	FROM billing
		LEFT JOIN clients ON clients.client_id=billing.client_id
    GROUP BY DATE_FORMAT(charged_datetime, '%Y-%m'), client_name
    ORDER BY  client_name, DATE_FORMAT(charged_datetime, '%Y'),DATE_FORMAT(charged_datetime, '%m')  ;

#6
SELECT domain_name AS website, count(leads_id) AS number_of_leads
	FROM leads
		LEFT JOIN sites ON sites.site_id=leads.site_id
	WHERE date_format(registered_datetime,'%Y-%m-%d') > '2011-03-15'
		AND date_format(registered_datetime,'%Y-%m-%d') < '2011-04-15'
	GROUP BY website;
#7
SELECT concat(clients.first_name," ",clients.last_name) AS client_name,domain_name, count(leads_id) AS num_leads
	FROM leads
		LEFT JOIN sites ON sites.site_id=leads.site_id
        LEFT JOIN clients ON clients.client_id=sites.client_id
	GROUP BY domain_name
    ORDER BY client_name;
#8
SELECT concat(clients.first_name," ",clients.last_name) AS client, count(leads_id) AS number_of_leads
	FROM leads
		LEFT JOIN sites ON sites.site_id=leads.site_id
        LEFT JOIN clients ON clients.client_id=sites.client_id
	WHERE date_format(registered_datetime,'%Y')=2012
	GROUP BY client;
#9
SELECT concat(clients.first_name," ",clients.last_name) AS client, count(leads_id) AS number_of_leads, date_format(registered_datetime,'%M') AS month
	FROM leads
		LEFT JOIN sites ON sites.site_id=leads.site_id
        LEFT JOIN clients ON clients.client_id=sites.client_id
	WHERE date_format(registered_datetime,'%Y-%m') >='2012-01'
		AND date_format(registered_datetime,'%Y-%m') <='2012-06'
	GROUP BY month,client
    ORDER BY date_format(registered_datetime,'%m');
#10
SELECT concat(clients.first_name," ",clients.last_name) AS client_name, count(site_id) AS number_of_sits, group_concat(domain_name)
	FROM sites
        LEFT JOIN clients ON clients.client_id=sites.client_id
	GROUP BY client_name;
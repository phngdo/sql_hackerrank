SELECT country.country_name,
       COUNT(invoice.invoice_number) AS total_invoice,
       ROUND(AVG(invoice.total_price), 6) AS avg_amount
  FROM country
 INNER JOIN city
         ON city.country_id = country.id
 INNER JOIN customer
         ON customer.city_id = city.id
 INNER JOIN invoice
         ON invoice.customer_id = customer.id
 GROUP BY country.country_name
 HAVING AVG(invoice.total_price) > (SELECT AVG(total_price) FROM invoice);

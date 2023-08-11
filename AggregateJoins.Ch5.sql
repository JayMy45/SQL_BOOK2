-- Find employees who haven't made any sales and the name of the dealership they work at.
SELECT
    e.first_name,
    e.last_name,
    d.business_name,
    s.price
FROM employees e
INNER JOIN dealershipemployees de ON e.employee_id = de.employee_id
INNER JOIN dealerships d ON d.dealership_id = de.dealership_id
LEFT JOIN sales s ON s.employee_id = e.employee_id
WHERE s.price IS NULL;

-- Get all the departments in the database,
-- all the employees in the database and the floor price of any vehicle they have sold.
SELECT
    d.business_name,
    e.first_name,
    e.last_name,
    v.floor_price
FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
INNER JOIN employees e ON e.employee_id = de.employee_id
INNER JOIN sales s ON s.employee_id = e.employee_id
INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id;

-- Use a self join to list all sales that will be picked up on the same day,
-- including the full name of customer picking up the vehicle. .
SELECT
    CONCAT  (c.first_name, ' ', c.last_name) AS full_name,
    s1.invoice_number,
    s1.pickup_date
FROM sales s1
INNER JOIN sales s2
    ON s1.sale_id <> s2.sale_id 
    AND s1.pickup_date = s2.pickup_date
INNER JOIN customers c
   ON c.customer_id = s1.customer_id
  GROUP BY s1.invoice_number, 
	c.first_name, 
	c.last_name, 
	s1.pickup_date;
   
-- Get employees and customers who have interacted through a sale.
-- Include employees who may not have made a sale yet.
-- Include customers who may not have completed a purchase.

SELECT
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
FROM employees e
FULL OUTER JOIN sales s ON e.employee_id = s.employee_id
FULL OUTER JOIN customers c ON s.customer_id = c.customer_id;

-- Get a list of all dealerships and which roles each of the employees hold.
SELECT
    d.business_name,
    et.employee_type_name
FROM dealerships d
LEFT JOIN dealershipemployees de ON d.dealership_id = de.dealership_id
INNER JOIN employees e ON de.employee_id = e.employee_id
RIGHT JOIN employeetypes et ON e.employee_type_id = et.employee_type_id;

-- Produce a report that lists every dealership, the number of purchases done by each, 
-- and the number of leases done by each.

SELECT
d.business_name,
--s2.sales_type_name,
--COUNT(d.business_name),
SUM(s2.sales_type_name) AS number_of_lease,
COUNT(s.dealership_id) AS number_of_sale
FROM dealerships d 
INNER JOIN sales s ON d.dealership_id = s.dealership_id 
INNER  JOIN salestypes s2 ON s.sales_type_id  = s2.sales_type_id 
WHERE s2.sales_type_name = 'Lease'
GROUP BY d.business_name ;

SELECT
    d.business_name,
    SUM(CASE WHEN s2.sales_type_name = 'Purchase' THEN 1 ELSE 0 END) AS number_of_purchases,
    SUM(CASE WHEN s2.sales_type_name = 'Lease' THEN 1 ELSE 0 END) AS number_of_leases
FROM dealerships d 
LEFT JOIN sales s ON d.dealership_id = s.dealership_id 
LEFT JOIN salestypes s2 ON s.sales_type_id  = s2.sales_type_id 
GROUP BY d.business_name;

-- What is the most popular vehicle make in terms of number of sales?
SELECT 
	v2.make,
	COUNT(s.sale_id) AS total_sales
FROM sales s
LEFT JOIN vehicles v ON v.vehicle_id = s.vehicle_id 
LEFT JOIN vehicletypes v2 ON v.vehicle_type_id  = v2.vehicle_type_id 
GROUP BY v2.make
ORDER BY total_sales DESC;


SELECT v.make, v.model
FROM (SELECT v.make , v.model FROM vehicletypes v) AS v;

SELECT v.make, v.model
FROM (SELECT vehicletypes.make, vehicletypes.model FROM vehicletypes v) AS v;





  

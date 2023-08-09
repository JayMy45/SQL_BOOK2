-- 1. Get a list of the sales that were made for each sales type.
SELECT *
FROM sales s
INNER JOIN salestypes s2 
ON s.sales_type_id  = s2.sales_type_id;

SELECT 
	s.sale_id, 
	s.purchase_date,
	s2.sales_type_name 
FROM sales s
LEFT JOIN salestypes s2 
ON s.sales_type_id  = s2.sales_type_id;

/* 
2. Get a list of sales with the VIN of the vehicle, 
the first name and last name of the customer, 
first name and last name of the employee who made the sale and the name, 
city and state of the dealership.
*/

SELECT 
s.sale_id,
v.vin,
c.first_name cust_firstname,
c.last_name cust_lastname,
e.first_name emp_firstname,
e.last_name emp_lastname,
d.business_name dealer_name,
d.city dealer_city,
d.state dealer_state
FROM sales s
LEFT JOIN vehicles v ON s.vehicle_id  = v.vehicle_id
LEFT JOIN customers c ON s.customer_id = c.customer_id
LEFT JOIN employees e ON s.employee_id = e.employee_id
LEFT JOIN dealerships d ON s.dealership_id = d.dealership_id;




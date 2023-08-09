-- Get all sales
SELECT *
FROM employees e  


-- 1. Get a list of sales records where the sale was a lease.
SELECT s.sale_id, s.sales_type_id, s.vehicle_id  
FROM sales s 
WHERE s.sales_type_id = '2';

-- 2. Get a list of sales where the purchase date is within the last five years.

SELECT s.sale_id, s.vehicle_id, s.dealership_id, s.sales_type_id, s.purchase_date 
FROM sales s 
WHERE s.purchase_date BETWEEN '2018-08-08' AND '2023-08-08';

-- or

SELECT s.sale_id, s.vehicle_id, s.dealership_id, s.sales_type_id, s.purchase_date 
FROM sales s 
WHERE s.purchase_date BETWEEN CURRENT_DATE - INTERVAL '5 years' AND CURRENT_DATE;

-- 3. Get a list of sales where the deposit was above 5000 or the customer payed with American Express.

SELECT s.sale_id, s.vehicle_id, s.dealership_id, s.sales_type_id, s.deposit, s.payment_method  
FROM sales s 
WHERE s.deposit > '5000' OR s.payment_method = 'americanexpress';

-- 4. Get a list of employees whose first names start with "M" or ends with "d".
SELECT e.employee_id ,e.first_name ,e.last_name
FROM employees e
WHERE e.first_name LIKE 'M%' AND e.first_name LIKE '%d';

-- 5. Get a list of employees whose phone numbers have the 604 area code.
SELECT e.employee_id, e.first_name ,e.last_name ,e.phone 
FROM employees e 
WHERE e.phone LIKE '604%';


-- Get all sales
SELECT *
FROM salestypes s 

-- 1. Get a list of sales records where the sale was a lease.
SELECT  
	s.sale_id, s.sales_type_id, s.vehicle_id  
FROM 
	sales s 
WHERE 
	s.sales_type_id = '2';

-- 2. Get a list of sales where the purchase date is within the last five years.



SELECT s.sale_id, s.vehicle_id, s.dealership_id, s.sales_type_id, s.deposit, s.payment_method  
FROM sales s 
WHERE s.deposit > '5000';
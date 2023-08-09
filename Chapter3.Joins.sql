-- 1. Get a list of the sales that were made for each sales type.
SELECT *
FROM sales s
INNER JOIN salestypes s2 
ON s.sales_type_id  = s2.sales_type_id 

SELECT 
	s.sale_id, 
	s.purchase_date,
	s2.sales_type_name 
FROM sales s
LEFT JOIN salestypes s2 
ON s.sales_type_id  = s2.sales_type_id 

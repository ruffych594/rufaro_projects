-- Business Performance
-- Do not jump straight to the SQL. Start by identifying the business meaning, tables, grain of the data, and required
-- calculation.
-- Question 1: How many orders has the coffee shop received?
-- Business meaning: Measures customer demand - every order placed, regardless of its final outcome.
-- Tables/columns: Orders (order_id, status)
-- Grain: One row per order, so counting rows = counting orders.

-- SQL concepts: COUNT aggregate, GROUP BY
SELECT
	COUNT(order_id) AS Total_Orders
FROM
	Orders;

-- Further analysis: orders by status

SELECT
	status,
    COUNT(order_id) AS total_orders
FROM
	 Orders
GROUP BY
	status;

-- Business interpretation:
/* The coffee shop received 1 000 orders in total. Only 650 (65%) were completed,
while 172 (17.2%) were cancelled and 178 (17.8%) were refunded.
This means 35% of all orders did not turn into revenue, which is high for a coffee shop.
Refunds are slightly more common than cancellations and are usually more costly, since the
product has already been made before the money is returned.
Next step: investigate why orders are being cancelled and refunded (by month, product,
time of day or payment method). */


-- Question 2: What is the total revenue generated?
-- Tables/columns: Orders 

-- SQL concepts: 
SELECT
	SUM(total_amount)
FROM
	Orders;
    
-- analysis

SELECT 
	status,
    SUM(total_amount) AS total
FROM 
	Orders
GROUP BY 
	status;
    
-- Business interpretation: 
-- This analysis illustrates that the cash inflow from the total orders was $45 429.75
-- From a deeper analysis we can record that $29 852.22 was the actual income generated but the business.
-- The refunds resulted to $7 977.56 and the total cost for the cancelled orders was $7 599.22.


-- Question 3: What is the average order value?
-- Tables/columns: Orders

-- SQL concepts: 
SELECT
	SUM(total_amount) / count(order_id)	AS Average_order_value
FROM 
	Orders;
    
-- deeper analysis
SELECT
	date_format(order_datetime, '%Y-%M') as month,	
	ROUND(SUM(total_amount) / count(order_id), 2 )	AS AOV
FROM 
	Orders
GROUP BY
	date_format(order_datetime, '%Y-%M')
ORDER BY 
	MIN(order_datetime);
    
-- Business interpretation: 
/*So on this report we used the monthly average order value to find the values for each month, 
this can help us identify the trends and take corrective measure so that the business stay above the AOV.*/


-- Question 4: How many orders are completed, pending, or cancelled?
-- Tables/columns: Orders
-- SQL concepts:

SELECT
	status,
	count(status) AS number,
    SUM(total_amount) AS cost
FROM
	Orders
GROUP BY
	status;
    
-- Business interpretation:
/* The business managed to secure 650 orders successfully which generated $29 852.22, 
178 orders where refunded to the customers and the total amount of $7 977.56 was refunded to the customers
and 172 orders were cancelled due to various reasons which costed $7 599.97.*/ 


-- Question 5: Which period generated the highest revenue?
-- Tables/columns: Orders
-- SQL concepts: 

SELECT
	DATE_FORMAT(order_datetime, '%Y %M') as DATE,
	SUM(total_amount) AS Total
FROM 
	Orders
GROUP BY
	DATE_FORMAT(order_datetime, '%Y %M')
ORDER BY
	Total DESC;

-- Business interpretation:
-- The Month that generateD alot of revenue was $2 888.58 and it wsas January 2026.
-- The report is preseneted in such a way that the months with the highest revenue are placed on top going downwards.


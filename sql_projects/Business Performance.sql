-- Business Performance
-- Do not jump straight to the SQL. Start by identifying the business meaning, tables, grain of the data, and required
-- calculation.
/* ============================================================
   COFFEESHOPDB - QUESTION 1
   Business Question:
   How many orders has the coffee shop received?
   ============================================================ */


/* ------------------------------------------------------------
   1. MAIN ANALYSIS
   Count the total number of orders received.
   ------------------------------------------------------------ */

SELECT
    COUNT(order_id) AS total_orders
FROM Orders;


/* ------------------------------------------------------------
   2. VALIDATE THE RESULT
   Break down the total orders by their status.
   ------------------------------------------------------------ */

SELECT
    status,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY status;


/* ------------------------------------------------------------
   3. SUPPORTING BUSINESS METRICS
   Calculate:
   - Fulfilment Rate
   - Refund Rate
   - Cancellation Rate
   ------------------------------------------------------------ */

SELECT

    /* Fulfilment Rate:
       Completed Orders ÷ Total Orders × 100 */

    ROUND(
        100.0 * SUM(
            CASE
                WHEN status = 'Completed' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS fulfilment_rate_pct,


    /* Refund Rate:
       Refunded Orders ÷ Total Orders × 100 */

    ROUND(
        100.0 * SUM(
            CASE
                WHEN status = 'Refunded' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS refund_rate_pct,


    /* Cancellation Rate:
       Cancelled Orders ÷ Total Orders × 100 */

    ROUND(
        100.0 * SUM(
            CASE
                WHEN status = 'Cancelled' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS cancellation_rate_pct

FROM Orders;


/* ------------------------------------------------------------
   4. BUSINESS INTERPRETATION

   Total orders received: 1,000

   Completed orders: 650
   Cancelled orders: 172
   Refunded orders: 178

   Fulfilment Rate: 65.00%
   Cancellation Rate: 17.20%
   Refund Rate: 17.80%

   65.00% + 17.20% + 17.80% = 100%

   Validation:

   650 + 172 + 178 = 1,000

   The status breakdown therefore agrees with the total
   number of orders.

   Business Insight:

   350 orders did not remain as completed orders.
   This creates an important business question:

   Why are orders being cancelled or refunded?

   Next Investigation:

   Investigate the reasons for cancelled and refunded orders,
   using the available data to identify the main drivers.
   ------------------------------------------------------------ */

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


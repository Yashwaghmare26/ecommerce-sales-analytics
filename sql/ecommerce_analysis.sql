/*
=========================================================
E-COMMERCE SALES ANALYSIS
=========================================================

Dataset:
E-Commerce Sales Analytics Dataset

Records:
5,000 transactions

Purpose:
Analyze sales performance, customer behavior,
product performance, regional trends, discounts,
delivery performance, payment methods and ratings.

SQL Analysis Levels:
1. Basic Analysis
2. Intermediate Analysis
3. Advanced Analysis
4. Business Insights
=========================================================
*/


/* =======================================================
   1. DATASET OVERVIEW
   ======================================================= */


/* Q1. Display all records from the dataset */

SELECT *
FROM ecommerce_sales;


/* Q2. Display the total number of orders */

SELECT COUNT(*) AS total_orders
FROM ecommerce_sales;


/* Q3. Display the total number of customers */

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM ecommerce_sales;


/* Q4. Display the total quantity of products sold */

SELECT SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales;


/* Q5. Display the total revenue generated */

SELECT SUM(revenue) AS total_revenue
FROM ecommerce_sales;


/* Q6. Display the average order revenue */

SELECT AVG(revenue) AS average_order_revenue
FROM ecommerce_sales;


/* Q7. Display the minimum and maximum order revenue */

SELECT
    MIN(revenue) AS minimum_revenue,
    MAX(revenue) AS maximum_revenue
FROM ecommerce_sales;


/* =======================================================
   2. BASIC SALES ANALYSIS
   ======================================================= */


/* Q8. Display all unique product categories */

SELECT DISTINCT product_category
FROM ecommerce_sales
ORDER BY product_category;


/* Q9. Display all unique regions */

SELECT DISTINCT region
FROM ecommerce_sales
ORDER BY region;


/* Q10. Display all unique payment methods */

SELECT DISTINCT payment_method
FROM ecommerce_sales
ORDER BY payment_method;


/* Q11. Count the number of orders in each product category */

SELECT
    product_category,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_orders DESC;


/* Q12. Calculate total revenue by product category */

SELECT
    product_category,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;


/* Q13. Calculate total quantity sold by product category */

SELECT
    product_category,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC;


/* Q14. Calculate average revenue by product category */

SELECT
    product_category,
    AVG(revenue) AS average_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_revenue DESC;


/* Q15. Calculate total revenue by region */

SELECT
    region,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;


/* Q16. Calculate total orders by region */

SELECT
    region,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY region
ORDER BY total_orders DESC;


/* Q17. Calculate total revenue by payment method */

SELECT
    payment_method,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC;


/* =======================================================
   3. PRODUCT ANALYSIS
   ======================================================= */


/* Q18. Find the product category with the highest revenue */

SELECT
    product_category,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC
FETCH FIRST 1 ROW ONLY;


/* Q19. Find the product category with the lowest revenue */

SELECT
    product_category,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue ASC
FETCH FIRST 1 ROW ONLY;


/* Q20. Find the product category with the highest quantity sold */

SELECT
    product_category,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC
FETCH FIRST 1 ROW ONLY;


/* Q21. Find the average unit price for each product category */

SELECT
    product_category,
    ROUND(AVG(unit_price), 2) AS average_unit_price
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_unit_price DESC;


/* Q22. Find the average discount for each product category */

SELECT
    product_category,
    ROUND(AVG(discount), 2) AS average_discount
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_discount DESC;


/* Q23. Find the total discount amount by product category */

SELECT
    product_category,
    ROUND(SUM(unit_price * quantity * discount), 2)
        AS total_discount_amount
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_discount_amount DESC;


/* Q24. Classify product categories based on total revenue */

SELECT
    product_category,
    SUM(revenue) AS total_revenue,
    CASE
        WHEN SUM(revenue) >= 100000 THEN 'High Revenue'
        WHEN SUM(revenue) >= 50000 THEN 'Medium Revenue'
        ELSE 'Low Revenue'
    END AS revenue_category
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_revenue DESC;


/* Q25. Find the average customer rating for each product category */

SELECT
    product_category,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_rating DESC;


/* =======================================================
   4. CUSTOMER ANALYSIS
   ======================================================= */


/* Q26. Find the number of orders placed by each customer */

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_orders DESC;


/* Q27. Find the total revenue generated by each customer */

SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC;


/* Q28. Find the average order value for each customer */

SELECT
    customer_id,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY average_order_value DESC;


/* Q29. Find the top 10 customers by total revenue */

SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY total_revenue DESC
FETCH FIRST 10 ROWS ONLY;


/* Q30. Find customers who placed more than 5 orders */

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY customer_id
HAVING COUNT(*) > 5
ORDER BY total_orders DESC;


/* Q31. Find customers whose total revenue is greater than 10,000 */

SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
HAVING SUM(revenue) > 10000
ORDER BY total_revenue DESC;


/* Q32. Find the average customer rating given by each customer */

SELECT
    customer_id,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY average_rating DESC;


/* =======================================================
   5. REGIONAL ANALYSIS
   ======================================================= */


/* Q33. Find total revenue generated by each region */

SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC;


/* Q34. Find total orders from each region */

SELECT
    region,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY region
ORDER BY total_orders DESC;


/* Q35. Find total quantity sold in each region */

SELECT
    region,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales
GROUP BY region
ORDER BY total_quantity_sold DESC;


/* Q36. Find average order revenue for each region */

SELECT
    region,
    ROUND(AVG(revenue), 2) AS average_order_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY average_order_revenue DESC;


/* Q37. Find the region with the highest revenue */

SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY region
ORDER BY total_revenue DESC
FETCH FIRST 1 ROW ONLY;


/* Q38. Find average delivery days for each region */

SELECT
    region,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM ecommerce_sales
GROUP BY region
ORDER BY average_delivery_days;


/* Q39. Find average customer rating for each region */

SELECT
    region,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM ecommerce_sales
GROUP BY region
ORDER BY average_rating DESC;


/* =======================================================
   6. PAYMENT METHOD ANALYSIS
   ======================================================= */


/* Q40. Find the number of orders for each payment method */

SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_orders DESC;


/* Q41. Find total revenue generated by each payment method */

SELECT
    payment_method,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC;


/* Q42. Find average order revenue for each payment method */

SELECT
    payment_method,
    ROUND(AVG(revenue), 2) AS average_order_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY average_order_revenue DESC;


/* Q43. Find total quantity sold for each payment method */

SELECT
    payment_method,
    SUM(quantity) AS total_quantity_sold
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;


/* Q44. Find the payment method generating the highest revenue */

SELECT
    payment_method,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY total_revenue DESC
FETCH FIRST 1 ROW ONLY;

/* =======================================================
   7. DISCOUNT ANALYSIS
   ======================================================= */


/* Q45. Find the average discount offered */

SELECT
    ROUND(AVG(discount), 2) AS average_discount
FROM ecommerce_sales;


/* Q46. Find the minimum and maximum discount */

SELECT
    MIN(discount) AS minimum_discount,
    MAX(discount) AS maximum_discount
FROM ecommerce_sales;


/* Q47. Find total revenue by discount percentage */

SELECT
    discount,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY discount
ORDER BY discount;


/* Q48. Find average revenue for each discount level */

SELECT
    discount,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM ecommerce_sales
GROUP BY discount
ORDER BY discount;


/* Q49. Categorize orders based on discount */

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN 'Low Discount'
        WHEN discount <= 0.25 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_category,
    COUNT(*) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.10 THEN 'Low Discount'
        WHEN discount <= 0.25 THEN 'Medium Discount'
        ELSE 'High Discount'
    END
ORDER BY total_revenue DESC;


/* Q50. Compare average revenue between discounted
        and non-discounted orders */

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        ELSE 'Discounted'
    END AS discount_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(revenue), 2) AS average_revenue
FROM ecommerce_sales
GROUP BY
    CASE
        WHEN discount = 0 THEN 'No Discount'
        ELSE 'Discounted'
    END;
/* =======================================================
   8. DELIVERY PERFORMANCE ANALYSIS
   ======================================================= */


/* Q51. Find the average delivery time */

SELECT
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM ecommerce_sales;


/* Q52. Find the minimum and maximum delivery time */

SELECT
    MIN(delivery_days) AS minimum_delivery_days,
    MAX(delivery_days) AS maximum_delivery_days
FROM ecommerce_sales;


/* Q53. Find the number of orders for each delivery time */

SELECT
    delivery_days,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY delivery_days
ORDER BY delivery_days;


/* Q54. Find the average delivery time by product category */

SELECT
    product_category,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_delivery_days;


/* Q55. Find regions with an average delivery time
        greater than 5 days */

SELECT
    region,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM ecommerce_sales
GROUP BY region
HAVING AVG(delivery_days) > 5
ORDER BY average_delivery_days DESC;


/* Q56. Classify orders based on delivery time */

SELECT
    CASE
        WHEN delivery_days <= 3 THEN 'Fast Delivery'
        WHEN delivery_days <= 7 THEN 'Normal Delivery'
        ELSE 'Delayed Delivery'
    END AS delivery_category,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY
    CASE
        WHEN delivery_days <= 3 THEN 'Fast Delivery'
        WHEN delivery_days <= 7 THEN 'Normal Delivery'
        ELSE 'Delayed Delivery'
    END
ORDER BY total_orders DESC;


/* =======================================================
   9. CUSTOMER RATING ANALYSIS
   ======================================================= */


/* Q57. Find the average customer rating */

SELECT
    ROUND(AVG(customer_rating), 2) AS average_customer_rating
FROM ecommerce_sales;


/* Q58. Find the minimum and maximum customer rating */

SELECT
    MIN(customer_rating) AS minimum_rating,
    MAX(customer_rating) AS maximum_rating
FROM ecommerce_sales;


/* Q59. Find the number of orders for each rating */

SELECT
    customer_rating,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY customer_rating
ORDER BY customer_rating;


/* Q60. Find the average rating for each product category */

SELECT
    product_category,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM ecommerce_sales
GROUP BY product_category
ORDER BY average_rating DESC;


/* Q61. Find the average rating for each region */

SELECT
    region,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM ecommerce_sales
GROUP BY region
ORDER BY average_rating DESC;


/* Q62. Find orders having a customer rating
        greater than 4 */

SELECT
    COUNT(*) AS highly_rated_orders
FROM ecommerce_sales
WHERE customer_rating > 4;


/* Q63. Find orders having a customer rating
        less than 3 */

SELECT
    COUNT(*) AS low_rated_orders
FROM ecommerce_sales
WHERE customer_rating < 3;


/* Q64. Classify customer ratings */

SELECT
    CASE
        WHEN customer_rating >= 4 THEN 'High Rating'
        WHEN customer_rating >= 3 THEN 'Medium Rating'
        ELSE 'Low Rating'
    END AS rating_category,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY
    CASE
        WHEN customer_rating >= 4 THEN 'High Rating'
        WHEN customer_rating >= 3 THEN 'Medium Rating'
        ELSE 'Low Rating'
    END
ORDER BY total_orders DESC;


/* =======================================================
   10. ADVANCED SQL ANALYSIS
======================================================= */


/* Q65. Find orders having revenue greater than
        the average order revenue */

SELECT
    order_id,
    customer_id,
    product_category,
    revenue
FROM ecommerce_sales
WHERE revenue > (
    SELECT AVG(revenue)
    FROM ecommerce_sales
)
ORDER BY revenue DESC;


/* Q66. Find customers whose total revenue is
        greater than the average customer revenue */

SELECT
    customer_id,
    SUM(revenue) AS total_revenue
FROM ecommerce_sales
GROUP BY customer_id
HAVING SUM(revenue) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(revenue) AS customer_total
        FROM ecommerce_sales
        GROUP BY customer_id
    ) customer_revenue
)
ORDER BY total_revenue DESC;


/* Q67. Find the order with the highest revenue */

SELECT
    order_id,
    customer_id,
    product_category,
    revenue
FROM ecommerce_sales
WHERE revenue = (
    SELECT MAX(revenue)
    FROM ecommerce_sales
);


/* Q68. Find orders with revenue higher than
        the average revenue of their product category */

SELECT
    e.order_id,
    e.product_category,
    e.revenue
FROM ecommerce_sales e
WHERE e.revenue > (
    SELECT AVG(e2.revenue)
    FROM ecommerce_sales e2
    WHERE e2.product_category = e.product_category
)
ORDER BY e.revenue DESC;


/* =======================================================
   ADVANCED SQL - COMMON TABLE EXPRESSIONS (CTE)
======================================================= */


/* Q69. Calculate total revenue by product category
        using a CTE */

WITH category_sales AS (
    SELECT
        product_category,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY product_category
)
SELECT
    product_category,
    ROUND(total_revenue, 2) AS total_revenue
FROM category_sales
ORDER BY total_revenue DESC;


/* Q70. Find the top 5 customers by revenue
        using a CTE */

WITH customer_sales AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY customer_id
)
SELECT
    customer_id,
    ROUND(total_revenue, 2) AS total_revenue
FROM customer_sales
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;


/* Q71. Find product categories whose revenue
        is greater than the average category revenue */

WITH category_sales AS (
    SELECT
        product_category,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY product_category
)
SELECT
    product_category,
    ROUND(total_revenue, 2) AS total_revenue
FROM category_sales
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM category_sales
)
ORDER BY total_revenue DESC;


/* Q72. Calculate monthly revenue using a CTE */

WITH monthly_sales AS (
    SELECT
        TRUNC(order_date, 'MM') AS sales_month,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY TRUNC(order_date, 'MM')
)
SELECT
    sales_month,
    ROUND(total_revenue, 2) AS total_revenue
FROM monthly_sales
ORDER BY sales_month;


/* =======================================================
   ADVANCED SQL - WINDOW FUNCTIONS
======================================================= */

/* Q73. Rank customers based on total revenue */

SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_rank
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY revenue_rank;


/* Q74. Rank product categories based on revenue */

SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS category_rank
FROM ecommerce_sales
GROUP BY product_category
ORDER BY category_rank;


/* Q75. Rank customers within each region */

SELECT
    region,
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue,
    RANK() OVER (
        PARTITION BY region
        ORDER BY SUM(revenue) DESC
    ) AS regional_rank
FROM ecommerce_sales
GROUP BY
    region,
    customer_id
ORDER BY
    region,
    regional_rank;


/* Q76. Assign row numbers to customers based
        on their total revenue */

SELECT
    customer_id,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROW_NUMBER() OVER (
        ORDER BY SUM(revenue) DESC
    ) AS row_number
FROM ecommerce_sales
GROUP BY customer_id
ORDER BY row_number;


/* Q77. Calculate cumulative revenue by order date */

SELECT
    order_date,
    revenue,
    SUM(revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_revenue
FROM ecommerce_sales
ORDER BY order_date;


/* Q78. Calculate revenue contribution percentage
        of each product category */

SELECT
    product_category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) * 100 /
        SUM(SUM(revenue)) OVER (),
        2
    ) AS revenue_percentage
FROM ecommerce_sales
GROUP BY product_category
ORDER BY revenue_percentage DESC;


/* =======================================================
  11 MONTHLY BUSINESS ANALYSIS
======================================================= */


/* Q79. Calculate monthly revenue */

SELECT
    TRUNC(order_date, 'MM') AS sales_month,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM ecommerce_sales
GROUP BY TRUNC(order_date, 'MM')
ORDER BY sales_month;


/* Q80. Calculate monthly order count */

SELECT
    TRUNC(order_date, 'MM') AS sales_month,
    COUNT(*) AS total_orders
FROM ecommerce_sales
GROUP BY TRUNC(order_date, 'MM')
ORDER BY sales_month;


/* Q81. Calculate monthly revenue and previous
        month's revenue */

WITH monthly_sales AS (
    SELECT
        TRUNC(order_date, 'MM') AS sales_month,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY TRUNC(order_date, 'MM')
)
SELECT
    sales_month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(
        LAG(total_revenue) OVER (
            ORDER BY sales_month
        ),
        2
    ) AS previous_month_revenue
FROM monthly_sales
ORDER BY sales_month;


/* Q82. Calculate month-over-month revenue growth */

WITH monthly_sales AS (
    SELECT
        TRUNC(order_date, 'MM') AS sales_month,
        SUM(revenue) AS total_revenue
    FROM ecommerce_sales
    GROUP BY TRUNC(order_date, 'MM')
),
monthly_comparison AS (
    SELECT
        sales_month,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    sales_month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(previous_month_revenue, 2)
        AS previous_month_revenue,
    ROUND(
        (total_revenue - previous_month_revenue)
        * 100 / NULLIF(previous_month_revenue, 0),
        2
    ) AS mom_growth_percentage
FROM monthly_comparison
ORDER BY sales_month;

-- 1. Top 10 Products by Total Sales Amount
SELECT TOP 10 product_id, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY product_id
ORDER BY total_sales DESC;


-- 2. Total Sales by Payment Type
SELECT payment_type, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY payment_type
ORDER BY total_sales DESC;


-- 3. Average Review Score by Product
SELECT product_id, AVG(review_score) AS average_review_score
FROM OrdersData
WHERE review_score IS NOT NULL
GROUP BY product_id
ORDER BY average_review_score DESC;


-- 4. Sales and Freight Value by Product Category
SELECT product_category_name, SUM(total_payment) AS total_sales, SUM(freight_value) AS total_freight
FROM OrdersData
GROUP BY product_category_name
ORDER BY total_sales DESC;


-- 5. Most Delayed Orders
SELECT order_id, order_purchase_timestamp, order_approved_at, order_delivered_customer_date, delay
FROM OrdersData
WHERE delay > 0
ORDER BY delay DESC;


-- 6. Customer Order Count and Total Spend
SELECT customer_id, COUNT(order_id) AS order_count, SUM(total_payment) AS total_spend
FROM OrdersData
GROUP BY customer_id
HAVING COUNT(order_id) > 5
ORDER BY total_spend DESC;


-- 7. Average Delivery Time by Seller
SELECT seller_id, AVG(delivery_time) AS avg_delivery_time
FROM OrdersData
GROUP BY seller_id
ORDER BY avg_delivery_time ASC;


-- 8. Total Payment for Installment Orders
SELECT SUM(total_payment) AS installment_sales
FROM OrdersData
WHERE is_installment = 1;


-- 9. Top 5 Sellers with Highest Total Sales
SELECT TOP 5 seller_id, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY seller_id
ORDER BY total_sales DESC;


-- 10. Orders With Longest Review Response Time
SELECT order_id, review_id, review_creation_date, review_answer_timestamp, response_time
FROM OrdersData
WHERE response_time IS NOT NULL
ORDER BY response_time DESC;


-- 11. Sales by Customer State
SELECT customer_state, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY customer_state
ORDER BY total_sales DESC;


-- 12. Orders Where Delivery Date Exceeds Estimated Delivery Date
SELECT order_id, order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(day, order_estimated_delivery_date, order_delivered_customer_date) AS actual_delivery_delay
FROM OrdersData
WHERE order_delivered_customer_date > order_estimated_delivery_date;


-- 13. Number of Orders Without Review
SELECT COUNT(*) AS orders_without_review
FROM OrdersData
WHERE review_score IS NULL;


-- 14. Top 5 Products with Highest Review Scores
SELECT TOP 5 product_id, AVG(review_score) AS avg_review_score
FROM OrdersData
WHERE review_score IS NOT NULL
GROUP BY product_id
ORDER BY avg_review_score DESC;


-- 15. Average Delay in Delivery by City
SELECT customer_city, AVG(delay) AS avg_delay
FROM OrdersData
GROUP BY customer_city
ORDER BY avg_delay DESC;


-- 16. Count of Orders by Product Category
SELECT product_category_name, COUNT(order_id) AS order_count
FROM OrdersData
GROUP BY product_category_name
ORDER BY order_count DESC;


-- 17. Top 3 Most Expensive Products
SELECT TOP 3 product_id, MAX(price) AS max_price
FROM OrdersData
GROUP BY product_id
ORDER BY max_price DESC;


-- 18. Sales by Review Score
SELECT review_score, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY review_score
ORDER BY review_score DESC;


-- 19. Orders Delivered Within 24 Hours
SELECT order_id, order_purchase_timestamp, order_delivered_customer_date, DATEDIFF(hour, order_purchase_timestamp, order_delivered_customer_date) AS delivery_time
FROM OrdersData
WHERE DATEDIFF(hour, order_purchase_timestamp, order_delivered_customer_date) <= 24;


-- 20. Average Product Weight by Product Category
SELECT product_category_name, AVG(product_weight_g) AS avg_product_weight
FROM OrdersData
GROUP BY product_category_name
ORDER BY avg_product_weight DESC;


-- 21. Orders with Multiple Payments (Installments)
SELECT order_id, COUNT(payment_sequential) AS payment_count
FROM OrdersData
GROUP BY order_id
HAVING COUNT(payment_sequential) > 1;


-- 22. Total Sales by Product Category and Seller
SELECT product_category_name, seller_id, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY product_category_name, seller_id
ORDER BY total_sales DESC;


-- 23. Total Sales for Top 10 Customers by Spend
SELECT TOP 10 customer_id, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY customer_id
ORDER BY total_sales DESC;


-- 24. Count of Orders by Shipping Limit Date
SELECT shipping_limit_date, COUNT(order_id) AS order_count
FROM OrdersData
GROUP BY shipping_limit_date
ORDER BY order_count DESC;


-- 25. Orders with Highest Review Score and Comment Length
SELECT order_id, review_score, LEN(review_comment_message) AS comment_length
FROM OrdersData
WHERE review_score = 5
ORDER BY comment_length DESC;


-- 26. Customer Review Count and Average Score
SELECT customer_id, COUNT(review_id) AS review_count, AVG(review_score) AS avg_review_score
FROM OrdersData
GROUP BY customer_id
HAVING COUNT(review_id) > 5;


-- 27. Products With No Reviews
SELECT product_id
FROM OrdersData
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM OrdersData WHERE review_score IS NOT NULL);


-- 28. Top 10 Cities by Total Sales
SELECT TOP 10 customer_city, SUM(total_payment) AS total_sales
FROM OrdersData
GROUP BY customer_city
ORDER BY total_sales DESC;


-- 29. Orders with No Delivery Date
SELECT order_id, order_purchase_timestamp, order_estimated_delivery_date
FROM OrdersData
WHERE order_delivered_customer_date IS NULL;


-- 30. Orders with Maximum Response Time
SELECT TOP 5 order_id, review_creation_date, review_answer_timestamp, response_time
FROM OrdersData
ORDER BY response_time DESC;



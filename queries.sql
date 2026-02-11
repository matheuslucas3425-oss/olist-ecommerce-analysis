-- #Customers by state
SELECT 
  customer_state,
  COUNT(*) AS total_customers
FROM olist_customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- #Orders per month
SELECT
  DATE_TRUNC('month', order_purchase_timestamp) AS month,
  COUNT(*) AS total_orders
FROM olist_orders
GROUP BY month
ORDER BY month;

-- #Revenue by state
SELECT
  c.customer_state,
  SUM(p.payment_value) AS total_revenue
FROM olist_orders o
JOIN olist_customers c
  ON o.customer_id = c.customer_id
JOIN olist_order_payments p
  ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;

-- #Top categories
SELECT
  pr.product_category_name,
  COUNT(*) AS total_sales
FROM olist_order_items oi
JOIN olist_products pr
  ON oi.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

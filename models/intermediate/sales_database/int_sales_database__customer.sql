WITH  orders_summary AS (
SELECT
 o.customer_id,
 SUM(total_order_amount) AS total_amount_spent,
 SUM(oi.quantity) as total_items,
 COUNT(distinct product_id) as total_distinct_items,
 COUNT(DISTINCT o.order_id) AS total_orders
FROM {{ ref('stg_sales_database__order_item') }} AS oi
INNER JOIN
{{ ref('stg_sales_database__order') }} AS o
ON oi.order_id = o.order_id
GROUP BY
o.customer_id
),


product_summary AS (
SELECT
o.customer_id,
oi.product_id,
ROW_NUMBER() OVER (
  PARTITION BY o.customer_id
  ORDER BY SUM(quantity) DESC
) AS rn
FROM
{{ ref('stg_sales_database__order_item') }} AS oi
INNER JOIN
{{ ref('stg_sales_database__order') }} o
ON oi.order_id = o.order_id
GROUP BY
o.customer_id,
oi.product_id
)

SELECT
o.customer_id,
u.customer_city,
u.customer_state,
o.total_amount_spent,
o.total_items,
o.total_distinct_items,
o.total_orders,
p.product_id AS favorite_product_id
FROM {{ ref('stg_sales_database__customer') }} AS u
INNER JOIN orders_summary o ON u.customer_id = o.customer_id
LEFT JOIN product_summary p
ON o.customer_id = p.customer_id
AND p.rn = 1
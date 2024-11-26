SELECT
  orders_item.order_id,
  product_id,
  customer_id,
  store_id,
  staff_id,
  order_date,
  required_date, 
  shipped_date,
  quantity,
  unit_price,
  discount_amount,
  total_order_gross_amount,
  total_order_net_amount
FROM
  {{ref('stg_localbike_orders_item')}}  AS orders_item
INNER JOIN
 {{ref('stg_localbike_orders')}} AS orders
ON
  orders_item.order_id=orders.order_id
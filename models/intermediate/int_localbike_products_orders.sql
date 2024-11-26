WITH orders_agg_product AS (

SELECT
  product_id,
  order_date,
  count(distinct orders_item.order_id) as total_number_order,
  sum(quantity) as total_product_quantity,
  sum(total_order_gross_amount) as total_product_gross_amount,
  sum(total_order_net_amount) as total_product_net_amount
FROM
 {{ref('stg_localbike_orders_item')}} as orders_item
INNER JOIN
  {{ref('stg_localbike_orders')}} AS orders
ON
  orders_item.order_id=orders.order_id
group by
  product_id,
  order_date)

SELECT
P.brand_id, 
brand_name, 
p.category_id, 
category_name,
orders_agg_product.product_id,
order_date,
total_number_order,
total_product_quantity,
total_product_gross_amount,
total_product_net_amount
FROM
  orders_agg_product
  inner join {{ref('stg_localbike_products')}} as p on orders_agg_product.product_id=P.product_id
  inner join {{ref('stg_localbike_brands')}} as b on b.brand_id=p.brand_id
  inner join {{ref('stg_localbike_categories')}} as c on c.category_id=p.category_id
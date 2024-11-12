SELECT  distinct
concat(order_id,'_',product_id) as order_item_id,
order_id,
product_id, 
seller_id, 
DATETIME(pickup_limit_date,'Europe/Paris') as pickup_limit_at,
shipping_cost, 
quantity,
price as unit_price,
(price * quantity) + shipping_cost as total_order_amount
FROM {{source('sales_database','order_item')}}

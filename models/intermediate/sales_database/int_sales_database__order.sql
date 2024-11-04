
WITH order_item_order_id_level as (
select 
order_id,
sum(quantity*price+shipping_cost) as total_order_amount,
count(quantity) as total_order_item,
count(distinct product_id) as total_distinct_order_item
from {{ref('stg_sales_database__order_item')}}
group by order_id
),
feedback_order_id_level as (
select order_id,
avg(feedback_score) as feedback_avg_score
from {{ref('stg_sales_database__feedback')}} 
group by order_id)

select orders.order_id,
orders.user_name,
 orders.order_status,
 orders.order_date,
 orders.order_approved_date,
 customer.customer_city,
 feedback_order_id_level.feedback_avg_score,
 order_item_order_id_level.total_order_amount,
 order_item_order_id_level.total_order_item,
 order_item_order_id_level.total_distinct_order_item
from {{ref('stg_sales_database__order')}} as orders
left join order_item_order_id_level on order_item_order_id_level.order_id=orders.order_id
left join feedback_order_id_level on feedback_order_id_level.order_id=orders.order_id
left join {{ref('stg_sales_database__customer')}} on user.user_name=orders.user_name
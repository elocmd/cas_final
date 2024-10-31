select
date(order_date) as order_date,
count(distinct order_id) as total_orders,
count(distinct user_name) as total_customers,
count (distinct case when order_status='shipped' then 1 else 0 end) as total_orders_shipped

from {{source('sales_database','order')}}
group by order_date
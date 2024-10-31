select
sum (total_orders) as total_orders 
from {{ref('daily_order_report')}}
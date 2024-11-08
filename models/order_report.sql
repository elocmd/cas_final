select
sum (total_orders) as total_orders 
from {{ref('mrt_order_daily_report')}}
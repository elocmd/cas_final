select count(distinct order_id) as total_order_id
from {{ref('test_model')}}
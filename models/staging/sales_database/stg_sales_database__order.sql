SELECT
    order_id,
    order_status,
DATETIME(order_date,'Europe/Paris') as order_created_at,
    DATETIME(order_approved_date,'Europe/Paris') as order_ ,
    DATETIME(pickup_date,'Europe/Paris')  AS order_pickup_at,
    DATETIME(delivered_date,'Europe/Paris') AS order_delivered_at,
    user_name as customer_id, 
    estimated_time_delivery as order_estimated_time_delivery
FROM {{source('sales_database','order')}}
SELECT distinct
  user_name as customer_id, 
  customer_zip_code,
  customer_city, 
  customer_state
FROM  {{source('sales_database','user')}}
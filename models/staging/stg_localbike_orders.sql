SELECT
  order_id,
  customer_id,
  order_date,
  required_date,
  safe_cast(shipped_date as date) as shipped_date,
  store_id,
  staff_id
FROM
 {{source('localbike','orders')}}
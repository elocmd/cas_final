SELECT
  order_id,
  item_id,
  product_id,
  quantity,
  list_price as unit_price,
  discount,
  round((quantity*list_price)*discount,2) as discount_amount,
  quantity*list_price as total_order_gross_amount,
  round((quantity*list_price)*(1-discount),2) as total_order_net_amount

FROM {{source('localbike','order_items')}}
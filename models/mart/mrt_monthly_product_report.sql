with monthly_product_report as (
SELECT
  brand_id,
  brand_name,
  category_id,
  category_name,
  product_id,
  extract(year from order_date) as year_order,
  extract(month from order_date) as month_order,
  sum(total_number_order) as ,
   sum(total_product_quantity) as total_product_quantity ,
   sum(total_product_gross_amount) as total_product_gross_amount,
   sum(total_product_net_amount) as  total_product_net_amount
FROM
  {{ref('int_localbike_products_orders')}}
  group by 
brand_id,
  brand_name,
  category_id,
  category_name,
  product_id,
  extract(year from order_date),
  extract(month from order_date))
  
  select
  brand_id,
  brand_name,
  category_id,
  category_name,
  product_id,
  year_order,
  month_order,
  coalesce(total_number_order,0) as total_number_order,
  coalesce(total_product_quantity,0) as total_product_quantity,
  coalesce(total_product_gross_amount,0) as total_product_gross_amount,
  coalesce(total_product_net_amount,0) as  total_product_net_amount
FROM {{ref('stg_localbike_products')}} as p
left join monthly_product_report as mpr  on  mpr.product_id=p.product_id
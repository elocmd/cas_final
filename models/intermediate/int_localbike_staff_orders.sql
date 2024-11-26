WITH orders_agg_staff AS (

SELECT
  staff_id,
  order_date,
  count(distinct orders_item.order_id) as total_staff_order,
  count(distinct orders.customer_id) as total_staff_customer,
  sum(quantity) as total_staff_quantity,
  sum(discount_amount) as total_staff_discount_amount,
  sum(total_order_gross_amount) as total_staff_gross_amount,
  sum(total_order_net_amount) as total_staff_net_amount
FROM
  {{ref('stg_localbike_orders_item')}} as orders_item
INNER JOIN
   {{ref('stg_localbike_orders')}} AS orders
ON
  orders_item.order_id=orders.order_id
group by
  staff_id,
  order_date)

SELECT
  orders_agg_staff.staff_id,
  s.staff_full_name,
  s.manager_id,
  m.manager_full_name,
  order_date,
  total_staff_customer,
  total_staff_order,
  total_staff_quantity,
  total_staff_discount_amount,
  total_staff_gross_amount,
  total_staff_net_amount
FROM
  orders_agg_staff
  inner join  {{ref('stg_localbike_staffs')}} as s on s.staff_id=orders_agg_staff.staff_id
  left join  {{ref('stg_localbike_managers')}} as m on m.manager_id=s.manager_id
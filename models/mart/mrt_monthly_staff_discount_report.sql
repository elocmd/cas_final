with monthly_staff_discount_report  as (
SELECT
  staff_id,
  staff_full_name,
  manager_id,
  manager_full_name,
  extract(year from order_date) as year_order,
  extract(month from order_date) as month_order,
  sum(total_staff_order) as monthly_staff_order,
  sum(total_staff_customer) as monthly_staff_customer,
  sum(total_staff_discount_amount) as monthly_staff_discount_amount,
  sum(total_staff_gross_amount) as  monthly_staff_gross_amount,
   sum(total_staff_net_amount) as  monthly_staff_net_amount
FROM
  {{ref('int_localbike_staff_orders')}}
  group by 
staff_id,
  staff_full_name,
  manager_id,
  manager_full_name,
  extract(year from order_date),
  extract(month from order_date) )

  Select 
  staff_id,
  staff_full_name,
  manager_id,
  manager_full_name,
  year_order,
  month_order,
  monthly_staff_order,
  monthly_staff_customer,
  monthly_staff_discount_amount,
  monthly_staff_gross_amount,
  monthly_staff_net_amount,
  monthly_staff_discount_amount/monthly_staff_gross_amount as monthly_discount_ratio
  FROM monthly_staff_discount_report

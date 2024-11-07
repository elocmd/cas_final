SELECT DATE_TRUNC(order_created_at, DAY) AS report_date,
    mapping.account_manager_name,
    orders.customer_state,
    COUNT(DISTINCT order_id) AS total_orders,
    coalesce(AVG(total_distinct_order_item),0) AS average_total_distinct_order_item,
    coalesce(avg(feedback_avg_score),0) AS average_feedback_score,
    coalesce(AVG(total_order_amount),0) AS average_total_order_amount
FROM {{ ref('int_sales_database__order') }} AS orders
LEFT JOIN {{ ref('stg_google_sheets__account_manager_region_mapping') }} as mapping ON orders.customer_state = mapping.account_manager_state
GROUP BY report_date,
    account_manager_name,
    customer_state
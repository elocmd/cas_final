SELECT
customer_id,
first_name,
last_name,
street,
state,
zip_code,
city
FROM {{source('localbike','customers')}}
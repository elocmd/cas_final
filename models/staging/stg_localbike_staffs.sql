SELECT 
staff_id, 
first_name as staff_first_name, 
last_name as staff_last_name, 
concat(first_name,' - ',last_name) as  staff_full_name, 
store_id, 
safe_cast(manager_id as int) as manager_id 
FROM {{source('localbike','staffs')}}
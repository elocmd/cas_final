WITH list_managers as(
SELECT distinct cast(replace(manager_id,'NULL','0') as int) as manager_id
FROM {{source('localbike','staffs')}}
where manager_id is not null),
info_managers as (
SELECT  staff_id ,
first_name,
last_name
FROM {{source('localbike','staffs')}} )

Select manager_id,
first_name as manager_first_name,
last_name as manager_last_name,
concat(first_name, ' - ', last_name)as manager_full_name
from list_managers
inner join info_managers on manager_id=staff_id


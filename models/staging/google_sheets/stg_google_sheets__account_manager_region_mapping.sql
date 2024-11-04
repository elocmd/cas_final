SELECT distinct 
concat(account_manager, '_',state) as account_manager_region_mapping_id,
account_manager as account_manager_name,
state as account_manager_state
FROM {{source('google_sheets','account_manager_region_mapping')}}
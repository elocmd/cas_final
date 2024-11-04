SELECT event_date,
 event_timestamp,
 event_name,
 (SELECT event_params.value.int_value from unnest(event_params)
event_params where event_params.key = 'ga_session_id') AS ga_session_id,
 (SELECT event_params.value.string_value from unnest(event_params)
event_params where event_params.key = 'page_title') AS page_title,
 (SELECT event_params.value.string_value from unnest(event_params)
event_params where event_params.key = 'page_location') AS page_location,
 user_pseudo_id,
 user_first_touch_timestamp,
device.web_info.browser,
 traffic_source.medium,
 traffic_source.source,
 traffic_source.name
FROM
 {{source('google_analytics_4','events_20210131')}} 
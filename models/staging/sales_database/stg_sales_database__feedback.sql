SELECT  distinct 
concat(feedback_id,'_',order_id) as feedback_id,
order_id, 
feedback_score,
DATETIME(feedback_form_sent_date,'Europe/Paris') as feedback_form_sent_at ,
DATETIME(feedback_answer_date,'Europe/Paris') as feedback_answer_at
FROM {{source('sales_database','feedback')}}


WITH CTE_users_action 
AS (SELECT 
		action, 
        COUNT(user_id) count_per_action 
	FROM 
		email_events
	GROUP BY action)

SELECT 
	action, 
    (count_per_action * 100 / (SELECT COUNT(action) FROM email_events)) AS perc_user_email_engag_metric 
FROM 
	CTE_users_action
;



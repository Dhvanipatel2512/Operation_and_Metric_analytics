WITH CTE_signup_flow 
AS 
	(SELECT 
		DISTINCT user_id AS signup_user, occurred_at AS signup_occurred 
    FROM 
		events
	WHERE 
		event_type = 'signup_flow'),

CTE_engagement 
AS 
	(SELECT 
		DISTINCT user_id AS engagement_user, occurred_at AS engagement_occurred 
	FROM 
		events
	WHERE 
		event_type = 'engagement')

SELECT 
	(COUNT(DISTINCT signup_user) * 100 / (SELECT COUNT(*) FROM users)) AS retension_of_users_weekly 
FROM 
	CTE_signup_flow, CTE_engagement
WHERE 
	   (signup_user = engagement_user)
	   AND (DATEDIFF(engagement_occurred, signup_occurred) < 8)	;

WITH CTE_Users_per_device 
AS (SELECT 
    e.device AS device, 
    count(distinct user_id) users_per_device 
	FROM
		users u
	RIGHT JOIN
		`events` e
	ON u.users_id = e.user_id
	WHERE
		(u.activated_at <= e.occurred_at
			AND (DATEDIFF(e.occurred_at, u.activated_at) < 8))
	GROUP BY e.device)
    
SELECT 
	device, 
	users_per_device * 100/(SELECT COUNT(*) FROM users) AS perc_active_user_per_device 
FROM 
	CTE_Users_per_device
ORDER BY perc_active_user_per_device DESC;









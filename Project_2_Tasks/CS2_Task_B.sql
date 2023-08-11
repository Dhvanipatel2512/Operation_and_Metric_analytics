
WITH CTE_2013 
AS 
	(SELECT 
		COUNT(users_id) as count_user_2013
	FROM 
		users
	WHERE 
		EXTRACT(YEAR FROM created_at) = 2013),

CTE_2014 
AS 
	(SELECT 
		COUNT(users_id) as count_user_2014
    FROM 
		users
	WHERE 
		EXTRACT(YEAR FROM created_at) = 2014)
        
select (count_user_2014 - count_user_2013) growth_of_user_in_2years from CTE_2013, CTE_2014
;



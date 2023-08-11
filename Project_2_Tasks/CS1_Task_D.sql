use ig_clone_oa_ims;
select count(*) from job_data;

WITH CTE_row_num 
AS 
	(SELECT 
		*, 
		ROW_NUMBER() OVER(PARTITION BY ds, job_id, actor_id, `event`, `language`, time_spent, org) AS row_num
	 FROM
		job_data)

SELECT 
	ds, job_id, actor_id, `event`, `language`, time_spent, org 
FROM 
	CTE_row_num
WHERE 
	row_num > 1;
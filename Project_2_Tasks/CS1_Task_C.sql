select * from job_data;

WITH CTE_language 
AS (SELECT 
    `language`, 
    COUNT(`language`) AS count_language
FROM
    job_data
WHERE 
	ds between '2020-11-01' and '2020-11-30'
GROUP BY `language`
ORDER BY count_language DESC)

SELECT `language`, 
		ROUND((count_language * 100 / SUM(count_language) OVER()), 2) AS percentage_of_language_30days 
FROM 
	CTE_language
;
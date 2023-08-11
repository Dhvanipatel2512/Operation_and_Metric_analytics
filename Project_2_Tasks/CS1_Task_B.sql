SELECT 
    *
FROM
    job_data;
       
WITH CTE_Throughput AS
(SELECT 
    ds, (COUNT(`event`) / SUM(time_spent)) daily_metric
FROM
    job_data
GROUP BY ds)

SELECT 
	ds, 
    ROUND(AVG(daily_metric) OVER(ORDER BY ds, ds ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 5) AS 7day_rolling_avg_TP
FROM CTE_Throughput; 
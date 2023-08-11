SELECT 
    *
FROM
    job_data;
use ig_clone_oa_ims;

SELECT 
    ds AS `date`,
    ROUND(COUNT(ds)/ (SUM(time_spent)/3600)) AS jobs_per_hour
FROM
    job_data
WHERE
    ds BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY ds
ORDER BY jobs_per_hour desc;


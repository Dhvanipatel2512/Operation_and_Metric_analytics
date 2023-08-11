
SELECT 
    COUNT(DISTINCT (e.user_id)) * 100 / (SELECT 
            COUNT(*)
        FROM
            users) AS perc_of_active_user
FROM
    users u
        RIGHT JOIN
    `events` e ON u.users_id = e.user_id
WHERE
    (u.activated_at <= e.occurred_at
        AND (DATEDIFF(e.occurred_at, u.activated_at) < 8));


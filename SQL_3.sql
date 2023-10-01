SELECT
    acc,
    dt_from,
    dt_to,
    SUM(balance) OVER (PARTITION BY acc ORDER BY dt_from, dt_to) AS running_balance
FROM (
    SELECT
        acc,
        dt_from,
        dt_to,
        balance
    FROM (
        SELECT
            from_acc AS acc,
            tdate AS dt_from,
            LEAD(tdate, 1, '3000-01-01') OVER (PARTITION BY from_acc ORDER BY tdate) AS dt_to,
            -amount AS balance
        FROM transfers

        UNION ALL

        SELECT
            to_acc AS acc,
            tdate AS dt_from,
            LEAD(tdate, 1, '3000-01-01') OVER (PARTITION BY to_acc ORDER BY tdate) AS dt_to,
            amount AS balance
        FROM transfers
    ) AS t
) AS date_ranges
ORDER BY acc, dt_from, dt_to;

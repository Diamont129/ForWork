CREATE TABLE IF NOT EXISTS random_check_schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    check_date DATE
);

SET @current_date = CURDATE();

INSERT INTO random_check_schedule (check_date)
WITH RECURSIVE DateSequence AS (
    SELECT @current_date AS generated_date, 1 AS n
    UNION ALL
    SELECT 
        DATE_ADD(generated_date, INTERVAL FLOOR(RAND() * 6) + 2 DAY),
        n + 1
    FROM DateSequence
    WHERE n < 100
)
SELECT generated_date FROM DateSequence;

SELECT * FROM random_check_schedule;
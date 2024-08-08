Answer: Average Time of Process per Machine

SELECT
    machine_id,
    ROUND(AVG(end_timestamp - start_timestamp)::numeric, 3) AS processing_time
FROM (
    SELECT
        start.machine_id,
        start.process_id,
        MIN(start.timestamp) AS start_timestamp,
        MAX(end_activity.timestamp) AS end_timestamp
    FROM Activity start
    JOIN Activity end_activity
    ON start.machine_id = end_activity.machine_id
    AND start.process_id = end_activity.process_id
    AND start.activity_type = 'start'
    AND end_activity.activity_type = 'end'
    GROUP BY start.machine_id, start.process_id
) AS ProcessDurations
GROUP BY machine_id;

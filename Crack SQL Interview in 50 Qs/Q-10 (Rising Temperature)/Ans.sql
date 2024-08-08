Answer: Product Sales Analysis I

select w1.id
from Weather w1
join Weather w2
on w1.recordDate = w2.recordDate + INTERVAL '1 day'
where w1.temperature > w2.temperature
order by id asc;

--we can make it another way: using CTE
with PreviousDayTemp AS (
    select
        w1.id AS current_id,
        w1.temperature AS current_temp,
        w2.temperature AS previous_temp
    from Weather w1
    left join Weather w2
    on w1.recordDate = w2.recordDate + INTERVAL '1 day'
)
select current_id
from PreviousDayTemp
where current_temp > previous_temp;

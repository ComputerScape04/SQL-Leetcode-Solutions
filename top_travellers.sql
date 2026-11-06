-- https://neetcode.io/problems/sql-top-travellers/question

with total_distance as (
    select user_id, sum(distance) as travelled_distance
    from rides
    group by user_id
)

select name, coalesce(travelled_distance, 0) as travelled_distance
from users u
left join total_distance t on u.id = t.user_id
order by travelled_distance desc, name asc


-- https://datalemur.com/questions/sql-average-post-hiatus-1

-- **** My Solution **** --
with first_post as (
				  SELECT user_id, min(post_date) as first_date
				  FROM posts
				  where EXTRACT(year from post_date) = 2021
				  GROUP by user_id
),

last_post as (
				  SELECT user_id, max(post_date) as last_date
				  from posts
				  WHERE EXTRACT(year from post_date) = 2021
				  GROUP by user_id
),

result as (
				  select f.user_id, extract(days from (last_date - first_date)) as days_between
				  from first_post f
				  full outer join last_post l on f.user_id = l.user_id
)

select user_id, days_between
from result
where days_between != 0;

-- **** Optimal Solution **** --
select 
  user_id,
  max(post_date::date) - min(post_date::date) as days_between
from posts
where extract(year from post_date) = 2021
group by user_id
having count(post_id) > 1;

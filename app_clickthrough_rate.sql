-- https://datalemur.com/questions/click-through-rate

-- **** My Solution **** --
with clicks as (
				  SELECT app_id, count(event_type) as clicks_cnt
				  FROM events
				  WHERE EXTRACT(YEAR FROM timestamp) = 2022 and event_type = 'click'
				  GROUP BY event_type, app_id
), 

impressions as (
				  SELECT app_id, count(event_type) as impressions_cnt
				  FROM events
				  WHERE EXTRACT(YEAR FROM timestamp) = 2022 and event_type = 'impression'
				  GROUP BY event_type, app_id
)

SELECT c.app_id, ROUND((100.0 * clicks_cnt / impressions_cnt), 2)
from clicks c
join impressions i on c.app_id = i.app_id
order by app_id desc
-- ********************* --

-- **** Optimal Solution **** --
SELECT
  app_id,
  ROUND(100.0 *
	  COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2) as ctr_rate
FROM events
where extract(year from timestamp) = 2022
group by app_id;
-- ************************** --

-- https://datalemur.com/questions/laptop-mobile-viewership

-- **** MY SOLUTION **** --
with view_count_device as (
				  SELECT device_type, count(device_type) as video_views
				  from viewership
				  group by device_type
),

laptop_views as (
				  SELECT video_views as laptop_view
				  from view_count_device
				  where device_type = 'laptop'
),

mobile_views as (
				  SELECT sum(video_views) as mobile_view
				  from view_count_device
				  WHERE device_type = 'phone' or device_type = 'tablet'
)

SELECT laptop_view, mobile_view
from laptop_views, mobile_views;

-- **** Optimal Solution **** --
SELECT
  COUNT(*) FILTER (where device_type = 'laptop') as laptop_views,
  COUNT(*) FILTER (where device_type IN ('phone', 'tablet')) as mobile_views
FROM viewership;

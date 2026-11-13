-- https://datalemur.com/questions/duplicate-job-listings

with duplicates as (
				  select count(*)
				  from job_listings
				  group by company_id, title, description
				  having count(*) > 1
)

select count(*)
from duplicates;

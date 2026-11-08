with tweet_counts as (
  SELECT COUNT(tweet_id) as tweet_bucket
  FROM tweets
  where tweet_date BETWEEN '2022-01-01' 
    and '2023-01-01'
  GROUP BY user_id
)

select tweet_bucket, count(*) as users_num
from tweet_counts
GROUP BY tweet_bucket
order by tweet_bucket

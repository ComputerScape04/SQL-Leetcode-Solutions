-- https://datalemur.com/questions/sql-avg-review-ratings

SELECT 
  EXTRACT(MONTH FROM submit_date) as mth, 
  product_id as product,
  TRUNC(AVG(stars), 2) as avg_stars
FROM reviews
GROUP BY product_id, EXTRACT(MONTH FROM submit_date)
ORDER BY EXTRACT(MONTH FROM submit_date), product_id

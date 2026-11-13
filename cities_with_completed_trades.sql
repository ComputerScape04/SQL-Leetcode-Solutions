-- https://datalemur.com/questions/completed-trades

SELECT city, COUNT(city)
FROM users u
JOIN trades t on u.user_id = t.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY COUNT(city) DESC
LIMIT 3

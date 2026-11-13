-- https://datalemur.com/questions/teams-power-users

SELECT sender_id, count(message_id) as mesasge_count
FROM messages
where extract(year from sent_date) = 2022 and EXTRACT(month from sent_date) = 8
group by sender_id
order by count(message_id) desc
limit 2

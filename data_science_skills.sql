-- https://datalemur.com/questions/matching-skills

select candidate_id
from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(candidate_id) = 3
order by candidate_id

-- https://neetcode.io/problems/sql-highest-grade-for-each-student/question

select student_id, min(exam_id) as exam_id, max(score) as score
from exam_results
where (student_id, score) in
    (
        select student_id, max(score)
        from exam_results
        group by student_id
    )
group by student_id
order by student_id

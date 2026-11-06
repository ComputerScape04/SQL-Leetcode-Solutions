-- https://neetcode.io/problems/sql-evaluate-boolean-expression/question

select left_operand, operator, right_operand,
    CASE
        WHEN operator = '>' THEN (v1.value > v2.value)
        WHEN operator = '<' THEN (v1.value < v2.value)
        WHEN operator = '=' THEN (v1.value = v2.value)
    END as value
from expressions e
join variables v1 on e.left_operand = v1.name
join variables v2 on e.right_operand = v2.name

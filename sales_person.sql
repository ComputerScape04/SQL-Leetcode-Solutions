-- https://neetcode.io/problems/sql-sales-person/question

-- salesmen who've sold to CRIMSON
with crimson_salesmen as (
    select sales_id
    from orders
    where com_id in (
        select com_id
        from company
        where name = 'CRIMSON'
    )
)

select name
from sales_person
where sales_id not in (
    select sales_id
    from crimson_salesmen
)

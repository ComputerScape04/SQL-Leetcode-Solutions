-- https://neetcode.io/problems/sql-sellers-with-no-sales/question

select seller_name
from seller
where seller_id not in (
    select distinct seller_id
    from orders
    where date(sale_date) >= '2020-01-01' and date(sale_date) <= '2020-12-31'
)
order by seller_name

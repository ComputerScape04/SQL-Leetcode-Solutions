-- https://neetcode.io/problems/sql-customers-bought-a-b-not-c/question

-- My Solution
-- Long and tedious
select distinct c.customer_id, c.customer_name
from customers c
join orders o on c.customer_id = o.customer_id
where c.customer_id IN (
    -- those that bought A
    select customer_id
    from orders
    where product_name = 'A' AND c.customer_id IN (
        -- those that bought B
        select customer_id
        from orders
        where product_name = 'B' AND c.customer_id NOT IN (
            -- those that bought C
            select customer_id
            from orders
            where product_name = 'C'
        )
    )
)
order by c.customer_name;

-- Better Solution
select c.customer_id, c.customer_name
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having count(*) filter (where o.product_name = 'A') > 0
    and count(*) filter (where o.product_name = 'B') > 0
    and count(*) filter (where o.product_name = 'C') = 0
order by c.customer_name

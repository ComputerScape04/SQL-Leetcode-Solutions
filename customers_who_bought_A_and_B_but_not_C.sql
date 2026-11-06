-- https://neetcode.io/problems/sql-customers-bought-a-b-not-c/question

-- You are given two tables: customers and orders.
-- customer_id is the primary key for this table. Each row contains a customer's ID and name.
-- order_id is the primary key for this table. customer_id references the customers table.
-- Each row represents an order placed by a customer for a specific product.
-- Write a query to find customers who purchased both products 'A' and 'B' but have never purchased product 'C'.
-- These are potential customers to target for product C recommendations.
-- Return the customer_id and customer_name of these customers, ordered by customer_name.

-- My Solution
-- Long and tedious
select distinct c.customer_id, c.customer_name
from customers c
join orders o on c.customer_id = o.customer_id
where c.customer_id in (
    -- those that bought A
    select customer_id
    from orders
    where product_name = 'A' and c.customer_id in (
        -- those that bought B
        select customer_id
        from orders
        where product_name = 'B' and c.customer_id not in (
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
order by c.customer_name;

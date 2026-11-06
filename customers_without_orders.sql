-- You are given two tables: customers and orders.
-- id is the primary key for customers table. Each row contains the ID and name of a customer.
-- id is the primary key for orders table. customer_id references the id from the customers table. Each row contains the ID of an order and the ID of the customer who placed it.
-- Write a query to find all customers who have never placed an order. Return the customer names. The result can be returned in any order.

select c.name
from customers c
left join orders o on c.id = o.customer_id
where o.customer_id is null

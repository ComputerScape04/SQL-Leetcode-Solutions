-- You are given a table customers which tracks customer revenue across different years.
-- (customer_id, year) is the primary key for this table. The revenue can be positive, negative, or zero.
-- Write a query to find all customers who had positive revenue in the year 2020. Return only the customer_id column. The result can be returned in any order.

select distinct customer_id
from customers
where revenue > 0 and year = 2020;

-- https://datalemur.com/questions/sql-page-with-no-likes

SELECT p.page_id
FROM page_likes pl
RIGHT JOIN pages p ON p.page_id = pl.page_id
where pl.user_id IS NULL
ORDER by p.page_id

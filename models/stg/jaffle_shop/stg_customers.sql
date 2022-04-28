
-- We go cte by cte(common table expression)
-- CUSTOMERS: change some column names

WITH customers AS (
    select
        id as customer_id,
        first_name,
        last_name

    from {{source('jaffle_shop','customers')}})

SELECT * FROM customers


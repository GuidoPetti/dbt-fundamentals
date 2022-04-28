with payments as (
    select
        orderid as order_id,
        id as customer_id,
        amount
    from
        {{source('stripe','payment')}}
)

SELECT * FROM payments

with customers as (
    select * from {{ ref('stg_customers')}}
),
customer_orders as (
    select * from {{ ref('fct_orders')}}
),

-- FINAL JOINEAMOS CUSTOMER Y ORDERS
final as (

    select
        customers.customer_id as custom_id,
        customers.first_name as primer_nombre,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final
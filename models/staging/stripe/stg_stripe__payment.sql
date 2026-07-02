with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id,
        orderid as order_id,
        paymentmethod,
        status as payment_status,
        amount / 100 as payment_amount,
        created,
        _batched_at

    from source

)

select * from renamed
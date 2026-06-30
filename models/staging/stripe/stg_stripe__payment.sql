with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id,
        orderid,
        paymentmethod,
        status,
        amount / 100 as amount,
        created,
        _batched_at

    from source

)

select * from renamed
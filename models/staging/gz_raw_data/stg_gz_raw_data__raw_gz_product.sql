with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_product') }}

),

renamed as (

    select
        products_id,
        CAST(purchSE_PRICE AS float64) AS purchase_price


    from source

)

select * from renamed

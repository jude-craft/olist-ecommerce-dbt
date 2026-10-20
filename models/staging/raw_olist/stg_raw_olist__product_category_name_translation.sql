with 

source as (

    select * from {{ source('raw_olist', 'product_category_name_translation') }}

),

renamed as (
    select
        string_field_0 as category_name,
        string_field_1 as category_name_en
    from source
)

select * from renamed
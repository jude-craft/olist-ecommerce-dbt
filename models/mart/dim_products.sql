select
    p.product_id,
    p.category_name as product_category_name,
    pc.category_name_en as product_category_name_english,
    p.weight_g
from {{ ref('stg_raw_olist__products') }} p
left join {{ ref('stg_raw_olist__product_category_name_translation') }} pc
    on p.category_name = pc.category_name
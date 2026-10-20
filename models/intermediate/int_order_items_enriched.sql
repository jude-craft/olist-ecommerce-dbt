select
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.shipping_limit_at,
    oi.price,
    oi.freight_value,
    oi.price + oi.freight_value as item_total,
    p.category_name as product_category_name,
    pc.category_name_en as product_category_name_english,
    s.city as seller_city,
    s.state as seller_state
from {{ ref('stg_raw_olist__order_items') }} oi
left join {{ ref('stg_raw_olist__products') }} p
    on oi.product_id = p.product_id
left join {{ ref('stg_raw_olist__product_category_name_translation') }} pc
    on p.category_name = pc.category_name
left join {{ ref('stg_raw_olist__sellers') }} s
    on oi.seller_id = s.seller_id
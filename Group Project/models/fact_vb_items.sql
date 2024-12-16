{{ config(materialized='table') }}

WITH items AS (
    SELECT
        item_name,
        item_type,
        item_reserve,
        item_enddate,
        item_sold,
        item_seller_user_id,
        item_buyer_user_id,
        item_soldamount
    FROM {{ source('raw', 'vb_items') }}
)

SELECT
    i.item_name,
    it.item_type,
    i.item_reserve,
    i.item_enddate,
    i.item_sold,
    s.user_firstname AS seller_firstname,
    s.user_lastname AS seller_lastname,
    b.user_firstname AS buyer_firstname,
    b.user_lastname AS buyer_lastname
FROM items i
JOIN {{ ref('dim_vb_item_types_lookup') }} it  -- Correct model for item types
    ON i.item_type = it.item_type
JOIN {{ ref('dim_vb_users') }} s  -- Reference to users model for seller
    ON i.item_seller_user_id = s.user_id
JOIN {{ ref('dim_vb_users') }} b  -- Reference to users model for buyer
    ON i.item_buyer_user_id = b.user_id;





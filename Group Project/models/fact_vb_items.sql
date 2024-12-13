{{ config(materialized='table') }}


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




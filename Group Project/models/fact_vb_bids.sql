{{ config(materialized='table') }}


SELECT
    bid_id,
    bid_user_id,
    bid_item_id,
    bid_datetime,
    bid_amount,
    bid_status
FROM {{ source('raw', 'vb_bids') }} 




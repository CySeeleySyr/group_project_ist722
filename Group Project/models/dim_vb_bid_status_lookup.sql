{{ config(materialized='table') }}

SELECT
    bid_status
FROM {{ source('raw', 'vb_bid_status_lookup') }}

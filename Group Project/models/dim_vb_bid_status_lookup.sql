-- Bid Status Lookup Table
{{ config(materialized='table') }}

WITH bid_status_lookup AS (
    SELECT
        bid_status
    FROM {{ source('raw', 'vb_bid_status_lookup') }}
)

SELECT
    bid_status
FROM bid_status_lookup;
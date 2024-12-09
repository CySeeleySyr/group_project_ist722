{{ config(materialized='table') }}

SELECT
    item_type
FROM {{ source('raw', 'vb_item_types_lookup') }}

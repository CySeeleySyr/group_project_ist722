-- Item Types Lookup Table
{{ config(materialized='table') }}

WITH item_types_lookup AS (
    SELECT
        item_type
    FROM {{ source('raw', 'vb_item_types_lookup') }}
)

SELECT
    item_type
FROM item_types_lookup;
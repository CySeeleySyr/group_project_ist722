{{ config(materialized='table') }}

SELECT
    rate_astype_lookup
FROM {{ source('raw', 'vb_rating_astypes_lookup') }}

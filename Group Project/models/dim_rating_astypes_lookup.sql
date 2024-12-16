-- Rate Astype Lookup Table
{{ config(materialized='table') }}

WITH rate_astype_lookup AS (
    SELECT
        rate_astype_lookup
    FROM {{ source('raw', 'vb_rating_astypes_lookup') }}
)

SELECT
    rate_astype_lookup
FROM rate_astype_lookup;
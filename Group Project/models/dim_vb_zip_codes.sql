{{ config(materialized='table') }}

SELECT
    zip_code,
    zip_city,
    zip_state,
    zip_lat,
    zip_lng
FROM {{ source('raw', 'vb_zip_codes') }}

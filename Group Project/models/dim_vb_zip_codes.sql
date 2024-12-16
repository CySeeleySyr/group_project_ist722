-- Zip Codes Table
{{ config(materialized='table') }}

WITH zip_codes AS (
    SELECT
        zip_code,
        zip_city,
        zip_state,
        zip_lat,
        zip_lng
    FROM {{ source('raw', 'vb_zip_codes') }}
)

SELECT
    zip_code,
    zip_city,
    zip_state,
    zip_lat,
    zip_lng
FROM zip_codes;

{{ config(materialized='table') }}

SELECT
    rating_id,
    rating_by_user_id,
    rating_for_user_id,
    rating_astype,
    rating_value,
    rating_comment
FROM {{ source('raw', 'vb_user_ratings') }}


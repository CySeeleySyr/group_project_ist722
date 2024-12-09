{{ config(materialized='table') }}

SELECT
    rating_for_user_id,
    COUNT(rating_id) AS total_ratings,
    AVG(rating_value) AS avg_rating,
    MAX(rating_value) AS max_rating,
    MIN(rating_value) AS min_rating
FROM {{ ref('fact_vb_user_ratings') }}
GROUP BY rating_for_user_id


{{ config(materialized='table') }}

WITH user_ratings_summary AS (
    SELECT
        rating_for_user_id,
        COUNT(rating_id) AS total_ratings,
        AVG(rating_value) AS avg_rating,
        MAX(rating_value) AS max_rating,
        MIN(rating_value) AS min_rating
    FROM {{ ref('fact_vb_user_ratings') }}  -- Corrected reference to fact_vb_user_ratings
    GROUP BY rating_for_user_id
)

SELECT
    urs.rating_for_user_id,
    u.user_firstname AS rated_for_firstname,
    u.user_lastname AS rated_for_lastname,
    urs.total_ratings,
    urs.avg_rating,
    urs.max_rating,
    urs.min_rating
FROM user_ratings_summary urs
JOIN {{ ref('dim_vb_users') }} u  -- Corrected reference to dim_vb_users model
    ON urs.rating_for_user_id = u.user_id;



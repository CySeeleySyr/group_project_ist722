{{ config(materialized='table') }}

WITH user_ratings AS (
    SELECT
        rating_id,
        rating_by_user_id,
        rating_for_user_id,
        rating_astype,
        rating_value,
        rating_comment
    FROM {{ source('raw', 'vb_user_ratings') }}
)

SELECT
    r.rating_id,
    u1.user_firstname AS rated_by_firstname,
    u1.user_lastname AS rated_by_lastname,
    u2.user_firstname AS rated_for_firstname,
    u2.user_lastname AS rated_for_lastname,
    rs.rate_astype_lookup,
    r.rating_value,
    r.rating_comment
FROM user_ratings r
JOIN {{ ref('dim_vb_users') }} u1  -- Correct reference to users model for the rating giver
    ON r.rating_by_user_id = u1.user_id
JOIN {{ ref('dim_vb_users') }} u2  -- Correct reference to users model for the rated user
    ON r.rating_for_user_id = u2.user_id
JOIN {{ ref('dim_rating_astypes_lookup') }} rs  -- Correct reference to rate astype lookup model
    ON r.rating_astype = rs.rate_astype_lookup;



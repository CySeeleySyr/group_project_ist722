-- Users Table
{{ config(materialized='table') }}

WITH users AS (
    SELECT
        user_id,
        user_firstname,
        user_lastname,
        user_email,
        user_zip_code
    FROM {{ source('raw', 'vb_users') }}
)

SELECT
    user_id,
    user_firstname,
    user_lastname,
    user_email,
    user_zip_code
FROM users;

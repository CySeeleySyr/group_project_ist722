{{ config(materialized='table') }}

SELECT
    user_id,
    user_firstname,
    user_lastname,
    user_email,
    user_zipcode
FROM {{ source('raw', 'vb_users') }}



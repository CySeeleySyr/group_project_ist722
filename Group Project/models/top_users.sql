{{ config(materialized='table') }}

WITH sellers AS (
    SELECT
        item_seller_user_id AS user_id,
        'Seller' AS role,
        COUNT(item_name) AS items_sold,
        SUM(item_soldamount) AS total_revenue
    FROM {{ ref('fact_vb_items') }}
    WHERE item_sold = 'Y'
    GROUP BY item_seller_user_id
),
buyers AS (
    SELECT
        item_buyer_user_id AS user_id,
        'Buyer' AS role,
        COUNT(item_name) AS items_bought,
        SUM(item_soldamount) AS total_spent
    FROM {{ ref('fact_vb_items') }}
    WHERE item_sold = 'Y'
    GROUP BY item_buyer_user_id
)
SELECT * FROM sellers
UNION ALL
SELECT * FROM buyers

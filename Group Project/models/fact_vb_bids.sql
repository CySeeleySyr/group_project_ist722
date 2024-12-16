WITH bid_data AS (
    SELECT
        b.bid_id,
        b.bid_user_id,
        b.bid_item_id,
        b.bid_datetime,
        b.bid_amount,
        b.bid_status,
        u.user_firstname,
        u.user_lastname
    FROM {{ source('raw', 'vb_bids') }} b
    LEFT JOIN {{ source('raw', 'vb_users') }} u
        ON b.bid_user_id = u.user_id
)

SELECT
    bid_id,
    bid_user_id,
    bid_item_id,
    bid_datetime,
    bid_amount,
    bid_status,
    user_firstname,
    user_lastname
FROM bid_data;



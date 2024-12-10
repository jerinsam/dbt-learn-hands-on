 
SELECT 
    listing_id,
    listing_name,
    listing_url,
    room_type,
    CASE 
        WHEN CAST(minimum_nights AS INT) > 0 THEN CAST(minimum_nights AS INT) 
        ELSE 1 
    END AS minimum_nights, 
    TRY_CAST(REPLACE(price_str, '$', '') AS FLOAT) AS price,
    host_id
FROM {{ ref('src_listing') }}

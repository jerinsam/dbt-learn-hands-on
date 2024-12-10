with l as (
    Select * from {{ref('dim_listings')}}
),
h as (
    Select * from {{ref('dim_host')}}
)
SELECT 
    l.listing_id,
    l.listing_name,
    l.listing_url,
    l.room_type,
    l.minimum_nights, 
    l.price,
    h.host_name
FROM l inner join 
h on l.host_id = h.host_id

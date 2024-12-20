
    SELECT * FROM "dbt"."dbo"."dim_listings" WHERE 
    listing_id IS NULL OR 
    listing_name IS NULL OR 
    listing_url IS NULL OR 
    room_type IS NULL OR 
    minimum_nights IS NULL OR 
    price IS NULL OR 
    host_id IS NULL OR 
    
    1=2


  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."dim_listings__dbt_tmp__dbt_tmp_vw" as SELECT 
    listing_id,
    listing_name,
    listing_url,
    room_type,
    CASE 
        WHEN CAST(minimum_nights AS INT) > 0 THEN CAST(minimum_nights AS INT) 
        ELSE 1 
    END AS minimum_nights, 
    TRY_CAST(REPLACE(price_str, ''$'', '''') AS FLOAT) AS price,
    host_id
FROM "dbt"."dbo"."src_listing";
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."dim_listings__dbt_tmp" FROM "dbt"."dbo"."dim_listings__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.dim_listings__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_dim_listings__dbt_tmp_cci'
        AND object_id=object_id('dbo_dim_listings__dbt_tmp')
    )
    DROP index "dbo"."dim_listings__dbt_tmp".dbo_dim_listings__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_dim_listings__dbt_tmp_cci
    ON "dbo"."dim_listings__dbt_tmp"

   


  
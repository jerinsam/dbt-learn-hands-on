
  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."dim_listing_and_host__dbt_tmp__dbt_tmp_vw" as with l as (
    Select * from "dbt"."dbo"."dim_listings"
),
h as (
    Select * from "dbt"."dbo"."dim_host"
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
h on l.host_id = h.host_id;
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."dim_listing_and_host__dbt_tmp" FROM "dbt"."dbo"."dim_listing_and_host__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.dim_listing_and_host__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_dim_listing_and_host__dbt_tmp_cci'
        AND object_id=object_id('dbo_dim_listing_and_host__dbt_tmp')
    )
    DROP index "dbo"."dim_listing_and_host__dbt_tmp".dbo_dim_listing_and_host__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_dim_listing_and_host__dbt_tmp_cci
    ON "dbo"."dim_listing_and_host__dbt_tmp"

   


  

  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."src_listing__dbt_tmp__dbt_tmp_vw" as  

WITH raw_listings AS (
SELECT
*
FROM
"dbt"."raw"."listings"
)
SELECT
id AS listing_id,
name AS listing_name,
listing_url,
room_type,
minimum_nights,
host_id,
price AS price_str,
created_at,
updated_at
FROM
raw_listings;
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."src_listing__dbt_tmp" FROM "dbt"."dbo"."src_listing__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.src_listing__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_src_listing__dbt_tmp_cci'
        AND object_id=object_id('dbo_src_listing__dbt_tmp')
    )
    DROP index "dbo"."src_listing__dbt_tmp".dbo_src_listing__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_src_listing__dbt_tmp_cci
    ON "dbo"."src_listing__dbt_tmp"

   


  
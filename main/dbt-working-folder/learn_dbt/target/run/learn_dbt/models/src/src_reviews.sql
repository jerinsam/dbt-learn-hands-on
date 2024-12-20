
  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."src_reviews__dbt_tmp__dbt_tmp_vw" as 
WITH raw_reviews AS (
SELECT
*
FROM
"dbt"."raw"."reviews"
)
SELECT
listing_id,
date AS review_date,
reviewer_name,
comments AS review_text 
FROM
raw_reviews;
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."src_reviews__dbt_tmp" FROM "dbt"."dbo"."src_reviews__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.src_reviews__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_src_reviews__dbt_tmp_cci'
        AND object_id=object_id('dbo_src_reviews__dbt_tmp')
    )
    DROP index "dbo"."src_reviews__dbt_tmp".dbo_src_reviews__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_src_reviews__dbt_tmp_cci
    ON "dbo"."src_reviews__dbt_tmp"

   


  

  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."mart_seed_full_moon__dbt_tmp__dbt_tmp_vw" as 


WITH fct_reviews AS (
SELECT * FROM "dbt"."dbo"."facr_reviews"
),

full_moon_dates AS (
SELECT * FROM "dbt"."dbo"."seed_full_moon_dates"
)

SELECT
r.*,
CASE
WHEN fm.full_moon_date IS NULL THEN ''not full moon''
ELSE ''full moon''
END AS is_full_moon
FROM
fct_reviews r
LEFT JOIN full_moon_dates fm
ON CAST(r.review_date as DATE) = CAST(DATEADD(DAY, 1, fm.full_moon_date) as DATE);
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."mart_seed_full_moon__dbt_tmp" FROM "dbt"."dbo"."mart_seed_full_moon__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.mart_seed_full_moon__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_mart_seed_full_moon__dbt_tmp_cci'
        AND object_id=object_id('dbo_mart_seed_full_moon__dbt_tmp')
    )
    DROP index "dbo"."mart_seed_full_moon__dbt_tmp".dbo_mart_seed_full_moon__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_mart_seed_full_moon__dbt_tmp_cci
    ON "dbo"."mart_seed_full_moon__dbt_tmp"

   


  
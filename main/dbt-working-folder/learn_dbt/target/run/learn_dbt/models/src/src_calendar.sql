
  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."src_calendar__dbt_tmp__dbt_tmp_vw" as 

with raw_calendar as (

    Select * from "dbt"."raw"."calendar"

)

Select * from raw_calendar;
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."src_calendar__dbt_tmp" FROM "dbt"."dbo"."src_calendar__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.src_calendar__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_src_calendar__dbt_tmp_cci'
        AND object_id=object_id('dbo_src_calendar__dbt_tmp')
    )
    DROP index "dbo"."src_calendar__dbt_tmp".dbo_src_calendar__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_src_calendar__dbt_tmp_cci
    ON "dbo"."src_calendar__dbt_tmp"

   


  

  
    USE [dbt];
    USE [dbt];
    
    

    

    
    USE [dbt];
    EXEC('
        create view "dbo"."dim_host__dbt_tmp__dbt_tmp_vw" as 

with src_host as (
    select * from "dbt"."dbo"."src_listing"
)

select DISTINCT CAST(host_id as int) as host_id,
''XYZ'' + host_id + ''ABC'' as host_name 
from src_host
 
;
    ')

EXEC('
            SELECT * INTO "dbt"."dbo"."dim_host__dbt_tmp" FROM "dbt"."dbo"."dim_host__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS dbo.dim_host__dbt_tmp__dbt_tmp_vw')



    
    use [dbt];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'dbo_dim_host__dbt_tmp_cci'
        AND object_id=object_id('dbo_dim_host__dbt_tmp')
    )
    DROP index "dbo"."dim_host__dbt_tmp".dbo_dim_host__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX dbo_dim_host__dbt_tmp_cci
    ON "dbo"."dim_host__dbt_tmp"

   


  
-- Create target schema if it does not
  USE [dbt];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo.testview_15168]
   as 
    
    

with all_values as (

    select
        room_type as value_field,
        count(*) as n_records

    from "dbt"."dbo"."dim_listing_and_host"
    group by room_type

)

select *
from all_values
where value_field not in (
    ''Private room'',''Shared room'',''Hotel room'',''Entire home/apt''
)


;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo.testview_15168]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo.testview_15168]
  ;')
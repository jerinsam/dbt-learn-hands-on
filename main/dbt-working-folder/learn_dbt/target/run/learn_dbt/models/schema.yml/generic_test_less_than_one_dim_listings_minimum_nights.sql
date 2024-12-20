-- Create target schema if it does not
  USE [dbt];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo.testview_18232]
   as 
    
    Select * from "dbt"."dbo"."dim_listings"
    where minimum_nights < 1

;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo.testview_18232]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo.testview_18232]
  ;')
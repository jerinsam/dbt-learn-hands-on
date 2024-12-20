-- Create target schema if it does not
  USE [dbt];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo.testview_13734]
   as 
    SELECT * FROM "dbt"."dbo"."dim_listings" WHERE 
    listing_id IS NULL OR 
    listing_name IS NULL OR 
    listing_url IS NULL OR 
    room_type IS NULL OR 
    minimum_nights IS NULL OR 
    price IS NULL OR 
    host_id IS NULL OR 
    
    1=2
;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo.testview_13734]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo.testview_13734]
  ;')
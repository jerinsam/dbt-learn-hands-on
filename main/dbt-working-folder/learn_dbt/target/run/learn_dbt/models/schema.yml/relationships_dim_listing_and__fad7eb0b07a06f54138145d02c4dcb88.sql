-- Create target schema if it does not
  USE [dbt];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo.testview_4615]
   as 
    
    

with child as (
    select listing_id as from_field
    from "dbt"."dbo"."dim_listing_and_host"
    where listing_id is not null
),

parent as (
    select listing_id as to_field
    from "dbt"."dbo"."dim_listings"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo.testview_4615]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo.testview_4615]
  ;')
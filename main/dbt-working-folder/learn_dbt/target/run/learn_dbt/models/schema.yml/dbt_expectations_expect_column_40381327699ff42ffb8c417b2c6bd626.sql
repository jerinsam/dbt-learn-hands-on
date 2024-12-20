-- Create target schema if it does not
  USE [dbt];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dbo')
  BEGIN
    EXEC('CREATE SCHEMA [dbo]')
  END

  

  
  EXEC('create view 
    [dbo.testview_4074]
   as 




with validation_errors as (

    select
        review,
        count(*) as "n_records"
    from "dbt"."dbo"."mart_seed_full_moon"
    where
        1=1
        and 
    not (
        review is null
        
    )


    
    group by
        review
    having count(*) > 1

)
select * from validation_errors

;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [dbo.testview_4074]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [dbo.testview_4074]
  ;')
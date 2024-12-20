




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


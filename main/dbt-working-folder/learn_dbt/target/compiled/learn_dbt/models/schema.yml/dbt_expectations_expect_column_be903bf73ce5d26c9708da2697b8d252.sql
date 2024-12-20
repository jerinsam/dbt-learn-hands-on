




with validation_errors as (

    select
        review_key,
        count(*) as "n_records"
    from "dbt"."dbo"."mart_seed_full_moon"
    where
        1=1
        and 
    not (
        review_key is null
        
    )


    
    group by
        review_key
    having count(*) > 1

)
select * from validation_errors


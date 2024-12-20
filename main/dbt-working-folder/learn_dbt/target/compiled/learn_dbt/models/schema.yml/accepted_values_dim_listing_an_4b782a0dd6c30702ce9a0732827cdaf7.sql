
    
    

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
    'Private room','Shared room','Hotel room','Entire home/apt'
)




    
    

select
    listing_id as unique_field,
    count(*) as n_records

from "dbt"."dbo"."dim_listing_and_host"
where listing_id is not null
group by listing_id
having count(*) > 1





with src_reviews as (
    select * from "dbt"."dbo"."src_reviews"
)

Select 

    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(listing_id as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(review_date as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(reviewer_name as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(review_text as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as review_key,
listing_id,
CAST(DATEFROMPARTS(RIGHT(review_date,4), SUBSTRING(review_date,4,2) ,LEFT(review_date,2)) as DATE)  as review_date,
reviewer_name,
review_text as review
from src_reviews
where reviewer_name is not null 


AND CAST(DATEFROMPARTS(RIGHT(review_date,4), SUBSTRING(review_date,4,2) ,LEFT(review_date,2)) as DATE)  > 
(
    select MAX(review_date)
    from "dbt"."dbo"."facr_reviews"
)

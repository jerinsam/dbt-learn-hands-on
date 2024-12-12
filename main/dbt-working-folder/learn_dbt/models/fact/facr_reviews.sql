{{
    config(
        materializaed='incremental',
        on_schema_change='fail'
    )
}}

with src_reviews as (
    select * from {{ ref('src_reviews') }}
)

Select 
{{dbt_utils.generate_surrogate_key(['listing_id','review_date','reviewer_name','review_text'])}} as review_key,
listing_id,
CAST(DATEFROMPARTS(RIGHT(review_date,4), SUBSTRING(review_date,4,2) ,LEFT(review_date,2)) as DATE)  as review_date,
reviewer_name,
review_text as review
from src_reviews
where reviewer_name is not null 

{% if is_incremental() %}
AND CAST(DATEFROMPARTS(RIGHT(review_date,4), SUBSTRING(review_date,4,2) ,LEFT(review_date,2)) as DATE)  > 
(
    select MAX(review_date)
    from {{this}}
)
{% endif %}


select * from {{ref('dim_listing_and_host')}}
where minimum_nights < 1
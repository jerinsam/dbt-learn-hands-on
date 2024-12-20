Select is_full_moon,count(review)  as [count of reviews]
from "dbt"."dbo"."mart_seed_full_moon"
GROUP BY is_full_moon
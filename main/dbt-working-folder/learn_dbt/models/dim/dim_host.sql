
with src_host as (
    select * from {{ ref('src_listing') }}
)

select DISTINCT CAST(host_id as int) as host_id,
'XYZ' + host_id + 'ABC' as host_name 
from src_host
 
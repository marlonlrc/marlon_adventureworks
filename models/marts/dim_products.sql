with 
staging as (
select * 
from {{ref('stg_products')}})

, transformed as ( 
select
row_number () over (order by productid) as product_sk -- auto-incremental surrogate key
, productid
, name
from staging
)

select * from transformed
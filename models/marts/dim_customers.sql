with 
staging as (
select * 
from {{ref('stg_customers')}})

, transformed as ( 
select
row_number () over (order by customerid) as customer_sk -- auto-incremental surrogate key
, customerid
, personid
, firstname
, middlename
, lastname
from staging
)

select * from transformed
with 
staging as (
select * 
from {{ref('stg_address')}})

, transformed as ( 
select
row_number () over (order by addressid) as address_sk -- auto-incremental surrogate key
, addressid
, city
, stateprovinceid
, stateprovincecode
, statename
, countryregioncode
, countryname
from staging
)

select * from transformed
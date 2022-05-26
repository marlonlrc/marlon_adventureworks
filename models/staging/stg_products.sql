with
source_data as (
    select 
    productid
    , name
    from {{source('adventureworks_etl_0522','production_product')}}
)

select *
from source_data
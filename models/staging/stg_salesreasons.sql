with
source_data as (
    select 
    salesreasonid
    , name
    , reasontype
    from {{source('adventureworks_etl_0522','sales_salesreason')}}
)

select *
from source_data
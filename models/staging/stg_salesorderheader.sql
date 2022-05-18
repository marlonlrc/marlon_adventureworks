with
source_data as (
    select 
    salesorderid
    , orderdate
    , status
    , customerid
    , billtoaddressid
    , shiptoaddressid
    , creditcardid
    from {{source('adventureworks_etl_0522','sales_salesorderheader')}}
)

select *
from source_data
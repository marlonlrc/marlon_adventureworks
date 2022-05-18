with
source_data as (
    select 
    salesorderid
    , salesorderdetailid
    , orderqty
    , productid
    , specialofferid
    , unitprice
    , unitpricediscount
    from {{source('adventureworks_etl_0522','sales_salesorderdetail')}}
)

select *
from source_data
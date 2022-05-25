with
source_data as (
    select 
    creditcardid
    , cardtype
    from {{source('adventureworks_etl_0522','sales_creditcard')}}
)

select *
from source_data
with
source_data as (
    select 
    salesorderid
    , salesreasonid
    from {{source('adventureworks_etl_0522','sales_salesorderheadersalesreason')}}
)

select 
  *
    from source_data
    

 
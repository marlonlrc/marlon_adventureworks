with
    addresses as (
        select *
        from {{ ref ('dim_addresses')}}
    )

    , creditcards as (
        select *
        from {{ ref ('dim_creditcards')}}
    )
      
    , customers as (
        select *
        from {{ ref ('dim_customers')}}
    )

    , products as (
        select *
        from {{ ref ('dim_products')}}
    )

    , salesreasons as (
        select *
        from {{ ref ('dim_salesreasons')}}
    )

    , orderheader_with_sk as (
    select 
    salesorderid
    , customers.customer_sk as customer_fk
    , creditcards.creditcard_sk as creditcard_fk
    , addresses.address_sk as address_fk
    --, salesorderheader.shiptoaddressid
    , salesorderheader.orderdate
    , salesorderheader.status
    from {{ ref ('stg_salesorderheader')}} as salesorderheader
    left join customers on salesorderheader.customerid = customers.customerid
    left join creditcards on salesorderheader.creditcardid = creditcards.creditcardid
    left join addresses on salesorderheader.billtoaddressid = addresses.addressid
    )

    , order_detail_with_sk as (
  select 
    salesorderid
    , salesorderdetailid
    , products.product_sk as product_fk
    , orderqty
    , specialofferid
    , unitprice
    , unitpricediscount
    from {{ref('stg_salesorderdetail')}} as salesorderdetail
    left join products on salesorderdetail.productid = products.productid
)

, order_header_sales_reason_with_sk as (
  select 
    salesorderid
    , salesreasons.salesreason_sk as salesreason_fk
    from {{ref('stg_salesorderheadersalesreason')}} as salesorderheadersalesreason
    left join salesreasons on salesorderheadersalesreason.salesreasonid = salesreasons.salesreasonid
)

, final as ( 
select
orderheader_with_sk.salesorderid
, orderheader_with_sk.customer_fk
, orderheader_with_sk.creditcard_fk
, orderheader_with_sk.address_fk
--, orderheader_with_sk.shiptoaddressid
, orderheader_with_sk.orderdate
, orderheader_with_sk.status
, salesorderdetailid
, order_detail_with_sk.product_fk
, order_detail_with_sk.orderqty
, order_detail_with_sk.specialofferid
, order_detail_with_sk.unitprice
, order_detail_with_sk.unitpricediscount
, order_header_sales_reason_with_sk.salesreason_fk
from orderheader_with_sk
left join order_detail_with_sk on orderheader_with_sk.salesorderid = order_detail_with_sk.salesorderid
left join order_header_sales_reason_with_sk on orderheader_with_sk.salesorderid = order_header_sales_reason_with_sk.salesorderid
)

select * 
from final

    
 
 







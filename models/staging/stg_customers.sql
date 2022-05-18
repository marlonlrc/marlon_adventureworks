    with
    sourcedata as (
    select 
    businessentityid as personid
    , firstname
    , middlename
    , lastname
    from {{source('adventureworks_etl_0522','person_person')}})

    select 
    customerid 
    , personid
    , firstname
    , middlename
    , lastname
    from sourcedata
    left join {{ source('adventureworks_etl_0522', 'sales_customer') }} using (personid)

 
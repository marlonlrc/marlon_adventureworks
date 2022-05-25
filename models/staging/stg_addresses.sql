with
source_data as (
    select 
    addressid
    , city
    , stateprovinceid
    from {{source('adventureworks_etl_0522','person_address')}}
)

select 
    addressid 
    , city
    , stateprovinceid
    , stateprovincecode
    , person_stateprovince.name as statename
    , countryregioncode 
    , person_countryregion.name as countryname
    from source_data
    left join {{ source('adventureworks_etl_0522', 'person_stateprovince') }} using (stateprovinceid)
    left join {{ source('adventureworks_etl_0522', 'person_countryregion') }} using (countryregioncode)

 
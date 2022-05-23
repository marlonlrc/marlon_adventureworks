with
    validation as (
        select count (distinct salesorderid) as sum_salesorderid
        from {{ ref ('fact_orders')}}
        where orderdate between '2013-01-01' and '2014-01-01'
    )

select * 
from validation 
where sum_salesorderid != 14244

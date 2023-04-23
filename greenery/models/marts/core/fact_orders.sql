{{
  config(
    materialized='table'
  )
}}

with grouped_items as(   
select order_id, 
sum(quantity) as items, 
count(quantity) as unique_items
from {{ ref('stg_order_items') }} 
group by 1)

select o.*, oi.items, oi.unique_items
from {{ ref('stg_orders') }}  o
left join grouped_items oi on oi.order_id=o.order_id


{{
  config(
    materialized='table'
  )
}}

select user_id, 
count(*) as orders, 
min(created_at) as first_order_date, 
max(created_at) as last_order_date, 
sum(order_total) as total_spend
from {{ ref('stg_orders') }}  
Group by 1
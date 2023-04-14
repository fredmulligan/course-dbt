{{
  config(
    materialized='table'
  )
}}

select address_id,
address, 
lpad(zipcode,5,0) as zipcode,
state,
country
from {{ source('postgres', 'addresses') }}
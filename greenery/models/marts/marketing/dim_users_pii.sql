{{
  config(
    materialized='table'
  )
}}
select
{{ dbt_utils.star(from=ref('stg_users'), except=["last_name", "address_id","phone_number"]) }}
from {{ ref('stg_users') }}
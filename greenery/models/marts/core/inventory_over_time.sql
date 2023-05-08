{{
  config(
    materialized='table'
  )
}}

select
  name,
  {{ dbt_utils.pivot(
      'dbt_updated_at::date',
      dbt_utils.get_column_values(
        table=ref('inventory_levels'),
        column='dbt_updated_at::date'),
      prefix='inventory_on_',
      then_value='inventory_levels',
      else_value=0
  ) }}
from {{ ref('inventory_levels') }}
group by 1


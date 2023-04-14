{% snapshot inventory_levels %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='product_id',
    check_cols=['inventory','price'],
   )
}}

select current_date,
product_id,
name,
price,
inventory
from {{ source('postgres', 'products') }}

{% endsnapshot %}



{{
  config(
    materialized='table'
  )
}}

{{ count_events_per( ref('stg_events'), 'session_id', 'event_type') }}



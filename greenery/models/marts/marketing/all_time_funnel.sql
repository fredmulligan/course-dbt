{{
  config(
    materialized='table'
  )
}}

select count(case when number_of_page_view>0 then 1 end) as views, 
count(case when number_of_add_to_cart>0 then 1 end) as carts, 
count(case when number_of_checkout>0 then 1 end) as checkouts, 
count(case when number_of_page_view>0 then 1 end)/count(case when number_of_page_view>0 then 1 end) as views_in_session, 
count(case when number_of_add_to_cart>0 then 1 end)/count(case when number_of_page_view>0 then 1 end) as carts_in_session, 
count(case when number_of_checkout>0 then 1 end)/count(case when number_of_page_view>0 then 1 end) as checkouts_in_session 

from int_events_per_session
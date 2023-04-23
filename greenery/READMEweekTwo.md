#### How many users purchased twice?

80% ish

with orders_per_user as (select user_id, count(*) as orders from stg_orders Group by 1)

select count(case when orders>1 then 1 end)/count(*) as percent_return
from orders_per_user

#### What are good indicators of a user who will likely purchase again? 

Not really much information on users, so no thorough analysis performed. I thought about querying time of day and day of week, but I was flat out this week doing other stuff. 


#### What changed from week to week? 

There are now only four products with inventory, and now of the products which had inventory last week appear to have inventory this week.

select *, rank() over (partition by product_id order by current_date ) as ranks from inventory_levels 




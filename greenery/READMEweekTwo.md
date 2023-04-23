#### How many users purchased twice?

80% ish

select count(case when orders>1 then 1 end)/count(*) as percent_return
from orders_per_user

#### What are good indicators of a user who will likely purchase again? 

Not really much information on users, so no thorough analysis performed. I thought about querying time of day and day of week, but I was flat out this week doing other stuff. 


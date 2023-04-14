#### How many users do we have?

There are 130 unique users

#### On average, how many orders do we receive per hour?

We receive 7.6 8 orders per hour (from the time of the first order to the last)

#### On average, how long does an order take from being placed to being delivered?

This is hard to say as not all orders have been delivered so we are biasing the data towards orders that have been delivered. 

For orders that have been delivered the average time is 3.89 days 

#### How many users have only made one purchase? Two purchases? Three+ purchases?

1: 25
2: 28
3+:71

#### On average, how many unique sessions do we have per hour?

On average there are 12 unique sessions per hour 

#### Queries

select count(distinct user_id) from users

select count(distinct order_id)/DATEDIFF( hour, min(created_at),max(created_at) ) from orders

select avg(DATEDIFF( seconds, created_at,delivered_at )/86400) from orders
where status='delivered'

with user_orders as (select user_id, count(distinct order_id) as total_orders from orders group by 1
select case when total_orders> 2 then 3 else total_orders end as total_orders, count(*) as total_order_numbers from user_orders group by 1
order by 1

with sessions as (select session_id, min(created_at) as created_at from events group by 1)
select count(distinct session_id)/DATEDIFF( hour, min(created_at),max(created_at) ) 
from sessions 

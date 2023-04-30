#### What was the conversion rate overall and for each product?

a killer 62%-ish overall 

query: 

```
select (select count(distinct order_id) from stg_orders)/(select count(distinct session_id) from stg_events)
```

Top 5 (of 30) converting products


Product ID                              Conversion
fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80	0.609375
74aeb414-e3dd-4e8a-beef-0fa45225214d	0.555556
c17e63f7-0d28-4a95-8248-b01ea354840e	0.545455
b66a7143-c18a-43bb-b5dc-06bb5d1d3160	0.539683
689fb64e-a4a2-45c5-b9f2-480c2155624d	0.537313

Query:

```
with product_sessions as (select product_id, count(distinct session_id) as sessions from stg_events where event_type='page_view'  group by 1),

product_orders as (select product_id, count(distinct order_id) as orders from stg_order_items group by 1)

select ps.product_id, po.orders/ps.sessions as conversion_rate
from product_sessions ps 
left join product_orders po on po.product_id=ps.product_id
order by conversion_rate desc
```

#### What is happening to the inventory levels?

Well to be plain, two of our products have gone out of stock and our customers are complaining

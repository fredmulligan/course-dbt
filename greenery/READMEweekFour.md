#### Can you use the inventory changes to determine which products had the most fluctuations in inventory? 

I pivoted the inventory levels table just to visualize it, this created some problems because I'd called the column current_date which it turns out is an inbuilt function, but I figured it out. 

After the first week where greenery cut back on our product selection, and the second and third week where two (different) products were out of stock each week, as of May 8 we are back again fully stocked. 

select * from inventory_over_time

#### Task 2 

We have an incredible conversion funnel of 62%, see all_time_funnel.  As such, our product team has put down their brushes and we are now expending all our efforts on marketing to get new customers in the door. 

#### 3B. Setting up for production

Put the run, snapshots, yada yada in an airflow automation scheme. Voila, a pipeline and a proper company!!!!


create database first_sql_project ;
use first_sql_project;

-- change date format
SELECT purchase_date 
FROM sales 
WHERE STR_TO_DATE(purchase_date, '%d/%m/%Y') IS NULL 
  AND purchase_date IS NOT NULL;
  
  
  -- change to time format  

SELECT time_of_purchase 
FROM sales 
WHERE str_to_date(time_of_purchase, '%H:/%i:/%S') IS NULL 
  AND time_of_purchase IS NOT NULL;
  
 use first_sql_project; 
 
ALTER TABLE sales 
MODIFY COLUMN customer_age VARCHAR(3);

alter table sales
modify column transaction_id varchar(10);

alter table sales
modify column quantiy int;


-- 1. what are the top 5 most selling products by quantity ? --

select 
   product_name,
   sum(quantiy) as total_quantity_sold
from sales
where status = 'delivered'
group by product_name
order by total_quantity_sold desc
limit 5;


-- 2.which products are most frequently cancelled?--

select 
  product_name,
  count(*) as total_cancelled
from sales
where status = 'cancelled'
group by product_name
order by total_cancelled desc

limit 6;


-- 3.what times of the day has higest number of purchases?--

select 
case 
  when hour(time_of_purchase) between 6 and 11 then 'Morning'
  when hour(time_of_purchase) between 12 and 17 then 'Afternoon'
  when hour(time_of_purchase) between 18 and 23 then 'Evening'
  else 'Night'
  end as time_of_day,
count(*) as total_order
from sales
group by time_of_day
order by total_order desc;

  -- 4. who are the top 5 highest spending customers ?--
  
select customer_id,
         customer_name,
         sum(quantiy * prce) as total_spending_by_customer
from sales
where status='delivered'

group by customer_id,customer_name
order by total_spending_by_customer desc
limit 5;


-- 5. which product categories generate the highest revenue (qua * price )?--

select 
     product_category,
     sum(quantiy * prce) as revenue 
     
from sales
where status = 'delivered'
group by product_category
order by revenue desc
limit 10;

-- 6. what is the return /cancellation rate per product category ?--

select 
     product_category,
     count(*) as total_order,
     sum(status = 'returned') as returned_orders,
     sum(status = 'cancelled') as cancelled_orders,
     round(sum(status = 'returned') /count(*),2 )as returned_rate,
     round(sum(status = 'cancelled')/count(*) ,2)as cancelled_rate
FROM sales
group by product_category

-- 7. what is the preferred payment mode ? --
     
select 
   payment_mode,
   count(*) as total_count
from sales
group by payment_mode
order by total_count desc;

-- 8 how does age group affect purchasing behaviour?--


select 
case 
  when customer_age between 18 and 25 then '18-25'
  when customer_age between 26 and 35 then '26-35'
  when customer_age between 36 and 51 then '36-51'
  else '52+'
  end as age_group,
sum(quantiy * prce) as  total_purchase_by_age
from sales
group by age_group
order by total_purchase_by_age ;
     
     
-- 9. what is the monthly sales trend ?--

select 
  date_format(purchase_date, '%Y-%M') as monthly_purchase,
  sum(quantiy * prce ) as total_sales,
  sum(quantiy)
from sales
group by monthly_purchase
order by monthly_purchase;


-- 10 . ARE certain genders buying more specific product categories  ? ---

select 
  gender,
  product_category,
  count(product_category) as total_purchase
from sales
group by gender,product_category
order by total_purchase desc;
  





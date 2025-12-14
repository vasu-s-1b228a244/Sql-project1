
create database sql_project1;

use sql_project1;

create table retail_shop
  (
  transactions_id int primary key,
  sale_date	 date,
  sale_time  time,
  customer_id int,
  gender varchar(10),
  age int,	
  category	varchar(15),
  quantiy	int,
  price_per_unit float,	
  cogs float,
  total_sale float
);

select
  count(*)
 from retail_shop;
 
 select *
 from retail_shop
 where sale_time is null
 or 
 sale_date is null
 or 
 customer_id is null
 or 
 gender is null
 or 
 age is  null
 or 
 category is  null
 or 
 quantiy is  null
 or 
 price_per_unit is  null
 or 
 cogs is null 
 or 
 total_sale is null ;

select distinct  category
 from
  retail_shop;
  
select *
from retail_shop
where sale_date='2022-11-05';

select
 category, sum(total_sale) as net_sale,
 count(*) as total_orders
 from retail_shop
 group by 1;
 select round(avg(age)) as age
 from retail_shop
 where category="Beauty";
 
 select * 
 from retail_shop
 where total_sale > 1000;
 
 select 
  category,
  gender,
  count(*) as total_sales
  from retail_shop
group by category, gender order by 1;

select 
  extract(year from sale_date) as year , 
  extract(month from sale_date) as month ,
  avg(total_sale) as ang_sale,
  rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc)
from retail_shop
group by 1,2
order by 1,2; 

select 
 customer_id,
 sum(total_sale)
from retail_shop
group by 1
order by 2 desc
limit 5;

select 
category,
count(distinct customer_id) as count 
from retail_shop
group by category;

select *,
 case
 when extract( hour from sale_time ) < 12 then 'morning'
 when extract( hour from sale_time ) between 12 and 17 then 'afternoon'
 else  'evening' 
end  as shif
from retail_shop;



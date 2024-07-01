Use restuarant;

-- 1 View menu items and number of items

select 

distinct menu_items.item_name

from menu_items;

select 
count(menu_items.menu_item_id) from menu_items;

-- 2 most expensive & least expensive menu item
select * from menu_items;

select
menu_items.item_name,
menu_items.price

from menu_items
order by price asc;

select
menu_items.item_name,
menu_items.price

from menu_items
order by price desc;

-- 3 how many italian dishes on the menu, least expensive and most expensive

select * from menu_items;

select 
count(menu_items.menu_item_id)
 from menu_items 

where menu_items.category = 'Italian'
order by menu_items.price asc;

select * from menu_items 
where menu_items.category = 'Italian'
order by menu_items.price asc;

select * from menu_items 
where menu_items.category = 'Italian'
order by menu_items.price desc;

-- 4 how many dishes in each category and average price

select * from menu_items;

select 
count(menu_items.menu_item_id),
menu_items.category,
avg(price)
from menu_items
group by menu_items.category
order by avg(price) asc;

-- 5 date range of order table 

select 
min(order_date), max(order_Date) from order_details;



-- 6 how many orders were made and how many items were ordered

select count(*) from order_details;
select
count(distinct order_details_id)

from order_details;


-- 7  which order had most number of order of items

select * from order_details;

select
order_id,
count(item_id)

from order_details
group by order_id
order by count(item_id) desc;



-- 8  How many orders had more than 12 items


select

order_id,
count(item_id)

from order_details
group by order_id
having count(item_id) > 12;

select count(*)
from (
select
order_id,
count(item_id)

from order_details
group by order_id
having count(item_id) > 12)

as subquery;

-- 9 Combine both menu_items & order_details table


select * from
order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id;


-- 10 most orders and least ordered item and their cateogires

select * from
order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id;




select
item_name,
count(order_details_id),
category

from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by count(order_details_id) asc;


-- 11 top 5 orders with most money spent

select *
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id;

select 
order_id,
sum(price)

from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by order_id
order by sum(price) desc
limit 5;


-- 12 details of highest order (since we found out the order number before)


select 
*

from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
where order_id in (440,2075,1957,330,2675);




 

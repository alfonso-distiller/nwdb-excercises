-- Create report by year, by month, by item
-- Show total sales, cost, and profit List Price * order quantity - standard cost * order quantity
-- Limit to order lines invoiced
-- Use Equi-Join Syntax for table joins

select
	date_format(o.order_date, '%Y - %M') as 'Order Month',
	p.product_code as 'Product Code',
	p.product_name as 'Description',
	concat('$',format(sum(od.quantity * p.list_price),2)) as 'Sales',
	concat('$',format(sum(od.quantity * p.standard_cost),2)) as 'Cost',
	concat('$',format(sum((p.list_price - p.standard_cost) * od.quantity), 2))  as 'Profit'
from orders o
	join order_details od on od.order_id = o.id 
	join products p on p.id = od.product_id 
group by date_format(o.order_date, '%Y - %M'), p.product_code
order by date_format(o.order_date, '%Y - %M'), sum((p.list_price - p.standard_cost) * od.quantity) desc;
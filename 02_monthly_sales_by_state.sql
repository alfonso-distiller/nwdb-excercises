-- Create Sales Report by year, month, by state
-- Show total revenue - List Price * order quantity
-- Limit to order lines invoiced
select date_format(o.order_date, '%Y - %M') as 'Sales Month',
o.ship_state_province as 'State',
concat('$ ',format((od.quantity * p.list_price), 2))  
from orders o
join order_details od on o.id = od.order_id
join products p on od.product_id = p.id
where od.status_id = 2
GROUP BY date_format(order_date, '%Y - %m'), o.ship_state_province
ORDER BY 'Sales Month' ASC;

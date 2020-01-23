select 
	c.first_name as 'First Name',
	c.last_name as 'Last Name',
	s.company as 'Shipping Company Name',
	date_format(o.order_date, '%M, %d, %Y')  as 'Order Date',
	o.ship_address as 'Street',
	o.ship_city as 'City',
	o.ship_state_province as 'State',
	o.ship_zip_postal_code as 'Zip',
	o.ship_country_region as 'Country',
	p.product_code as 'Product Code',
	p.product_name  as 'Product Name',
	format(p.list_price, 2)  as 'Cost',
	format(od.quantity, 0) as 'Quantity Ordered',
	format((p.list_price * od.quantity), 2)  as 'Total Cost'
from orders o 
	join customers c on o.customer_id = c.id
	join shippers s on s.id = o.shipper_id 
	join order_details od on od.order_id = o.id 
	join products p on od.product_id = p.id;
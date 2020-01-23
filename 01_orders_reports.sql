-- Show Customer First Name, Last Name
-- Shipping Company Name
-- Order Date (formatted as January, 1, 2018), Shipping Address (street, city, state, zip, country)

-- Product Code, Product Name, List Price, quantity ordered, and total cost of line item
-- Provide friendly column names
-- Format numbers to have commas and limit decimals to two places

select o.id as 'Order Id', 
c.first_name as 'First Name',
c.last_name as 'Last Name',
s.company as 'Shipping Company Name',
date_format(o.order_date, '%M, %d, %Y')  as 'Order Date',
concat(o.ship_address, ', ', o.ship_city, ', ', o.ship_state_province, ', ', o.ship_zip_postal_code, ', ', o.ship_country_region) as 'Shipping Address'
from orders o 
inner join customers c on o.customer_id = c.id
inner join shippers s on s.id = o.shipper_id 
;
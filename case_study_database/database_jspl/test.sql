SELECT * FROM furama_management.facility;
select c.*,ct.name as customer_type from customer c 
join customer_type ct
on c.customer_type_id = ct.id;

select c.* , ct.name as customer_type from customer c join customer_type ct on c.customer_type_id = ct.id;

select * from customer;
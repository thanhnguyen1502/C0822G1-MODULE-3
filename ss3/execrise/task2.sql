USE sales_management;

INSERT INTO customer (customer_name,customer_age) 
	VALUES
		("Minh Quan",10),
		("Ngoc Oanh",20),
		("Hong Ha",50);
        

INSERT INTO orders (customer_id,order_date) 
	VALUES
		(1,"2006-3-21"),
		(2,"2006-3-23"),
		(1,"2006-3-16");
        

INSERT INTO product (product_name,price)
	VALUE 
		("May Giat",3),
		("Tu Lanh",5),
		("Dieu Hoa",7),
		("Quat",1),
		("Bep Dien",2);
        

INSERT INTO order_detail (order_id,product_id,order_quantity)
	VALUE 
		(1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
        

-- Hiển thị order_id, order_date,totalr_price của tất cả hóa đơn trong bảng order.
select order_id, order_date,total_price from orders; 

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
SELECT 
    c.customer_name, p.product_name, od.order_quantity
FROM
    customer c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_detail od ON od.order_id = o.order_id
        JOIN
    product p ON p.product_id = od.product_id;
    
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào. 
SELECT 
    c.customer_id, c.customer_name, c.customer_age
FROM
    customer c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.order_id IS NULL;
    
    
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    o.order_id,
    o.order_date,
    SUM(od.order_quantity * p.price) AS total_price
FROM
    orders o
        JOIN
    order_detail od ON o.order_id = od.order_id
        JOIN
    product p ON p.product_id = od.product_id
GROUP BY o.order_id;
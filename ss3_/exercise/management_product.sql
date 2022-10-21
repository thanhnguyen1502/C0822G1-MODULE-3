USE quanlybanhang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 	o_id as  ma_hoa_don , 
		o_date as ngay_ban , 
		o_totalprice  as gia 
	from `order`; 

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c_name AS Ten_KH,
    p_name AS Ten_SP, 
    od_qty AS So_luong
FROM
    customer
        JOIN `order` ON customer.c_id = `order`.c_id
        JOIN order_detail ON `order`.o_id = order_detail.o_id
        JOIN product ON order_detail.p_id = product.p_id;
    

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c_name AS Ten_KH 
FROM
    customer
       left JOIN `order` ON customer.c_id = `order`.c_id
WHERE o_id IS  NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán 
-- của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    `order`.o_id as  ma_hoa_don , o_date as ngay_ban, SUM(od_qty * p_price) AS total
FROM
    `order`
        JOIN
    order_detail ON `order`.o_id = order_detail.o_id
        JOIN
    product ON order_detail.p_id = product.p_id
GROUP BY ma_hoa_don;


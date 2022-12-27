use furama_resort;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Nguyễn Chí Thanh” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “2021-06-01”. 

CREATE VIEW v_nhan_vien AS
    SELECT 
        nv.*
    FROM
         nhan_vien nv
                    JOIN
                hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
            WHERE
                nv.dia_chi LIKE '%Nguyễn Chí Thanh%'
                    AND hd.ngay_lam_hop_dong = '2021-06-01';
                                 		
                                        
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này. 
set sql_safe_updates =0;
update v_nhan_vien set dia_chi = replace(dia_chi,"Nguyễn Chí Thanh","Liên Chiểu") ;
set sql_safe_updates =1;
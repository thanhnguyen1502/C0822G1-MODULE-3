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

 --    23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
  delimiter $$
  create Procedure sp_xoa_khach_hang(in ma_khach_hang_in int)
  begin
  set sql_safe_updates =0;
  set foreign_key_checks = 0;
  delete from khach_hang where ma_khach_hang = ma_khach_hang_in;
  set foreign_key_checks = 1;
  set sql_safe_updates =1;
  end $$
  delimiter ;
  
call sp_xoa_khach_hang(13);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter $$
  create Procedure sp_them_moi_hop_dong(in ngay_lam_hop_dong_in date, ngay_ket_thuc_in date , tien_dat_coc_in double, ma_nhan_vien_in int , ma_khach_hang_in int , ma_dich_vu_in int)
  begin
  if (ma_nhan_vien_in not in (select ma_nhan_vien from nhan_vien) or ma_khach_hang_in not in (select ma_khach_hang from khach_hang) or ma_dich_vu_in not in (select ma_dich_vu from dich_vu)) 
  then signal sqlstate '45000' set message_text = 'mã nhân viên/mã khách hàng/mã dịch vụ chưa tồn tại, vui lòng nhập lại';
  else
    insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    value (ngay_lam_hop_dong_in, ngay_ket_thuc_in , tien_dat_coc_in, ma_nhan_vien_in, ma_khach_hang_in  , ma_dich_vu_in ) ;
    end if;
   end $$
  delimiter ;
  call sp_them_moi_hop_dong('2021-06-07','2021-07-07', 1000000,3,9,3);
  select * from hop_dong;
USE furama_resort;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        ma_nhan_vien
    FROM
        hop_dong
    WHERE
        YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021); 
SET sql_safe_updates = 1;



-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. 
SET sql_safe_updates =0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            temp.ma_khach_hang
        FROM
            (SELECT 
                hd.ma_khach_hang,
                    (dv.chi_phi_thue + SUM(IFNULL(hdct.so_luong * dvdk.gia, 0))) AS tong_tien
            FROM
                khach_hang kh
            LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            LEFT JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
            GROUP BY  kh.ma_khach_hang
            HAVING tong_tien > 1000000) temp);
SET sql_safe_updates =1;


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET sql_safe_updates = 0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        hop_dong hd
    
    WHERE
        YEAR(ngay_lam_hop_dong) < 2021);
	
    SET sql_safe_updates = 1;
    SET FOREIGN_KEY_CHECKS = 1;
    
    
    
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. 
SET sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet hdct
                JOIN
            hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING SUM(hdct.so_luong) > 10);
SET sql_safe_updates = 1;



-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien 
UNION SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;

 

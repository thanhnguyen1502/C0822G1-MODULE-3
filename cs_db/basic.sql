USE furama_resort;
-- task2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[HTK]'
        AND char_length(ho_ten) <= 15;


-- task3:
-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. 
SELECT 
    *
FROM
    khach_hang
WHERE
--     (YEAR(CURDATE()) - YEAR(ngay_sinh) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50
--         AND (YEAR(CURDATE()) - YEAR(ngay_sinh) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18
--         AND (dia_chi REGEXP 'Đà Nẵng$'
--         OR dia_chi REGEXP 'Quảng Trị$');

	-- lấy số năm sinh của khách hàng đến thời đểm hiện tại trong khoảng 18-50
   (TIMESTAMPDIFF(YEAR, ngay_sinh, NOW()) BETWEEN 18 AND 50)
        AND dia_chi REGEXP ('Quảng trị|Đà Nẵng');
        

-- task4:
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 
select
	kh.ma_khach_hang,
    kh.ho_ten,
    count(hd.ma_khach_hang) as so_lan_bocking
from 
    khach_hang kh 
    join 
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    where
    lk.ten_loai_khach = 'diamond'
    group by kh.ma_khach_hang
    order by so_lan_bocking asc;
    

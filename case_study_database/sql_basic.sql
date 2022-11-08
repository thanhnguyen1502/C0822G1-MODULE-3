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
    


-- task5:
-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien.
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem
-- , hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
      (IFNULL(dv.chi_phi_thue, 0) + IFNULL(SUM(IFNULL(hdct.so_luong, 0) * IFNULL(dvdk.gia, 0)),
            0)) AS tong_tien
    from
     khach_hang kh
	left join 
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    left join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
    left join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    left join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
    left join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    
	group by hd.ma_hop_dong, kh.ma_khach_hang
    order by kh.ma_khach_hang ; 
    
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
    
    select
    dv.ma_dich_vu,
    dv.ten_dich_vu,
	dv.dien_tich,
	dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
    from
    dich_vu dv
    join 
    loai_dich_vu ldv on  dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    join
    hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
    WHERE
		dv.ma_dich_vu not in(	-- đã từng
        select 
        hd.ma_dich_vu
			FROM
		hop_dong hd
        WHERE
				(hd.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31')
			OR 	(hd.ngay_ket_thuc BETWEEN '2021-01-01' AND '2021-03-31')
            )
GROUP BY hd.ma_dich_vu;
	
-- task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả 
-- các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021. 

select
	dv.ma_dich_vu, 
	dv.ten_dich_vu, 
	dv.dien_tich, 
	dv.so_nguoi_toi_da, 
	dv.chi_phi_thue, 
	ldv.ten_loai_dich_vu
from
    dich_vu dv
    join
    loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    where
    dv.ma_dich_vu in(
    select 
    dv.ma_dich_vu 
    from 
    hop_dong hd
    where year(hd.ngay_lam_hop_dong)  = '2020' or
			year(hd.ngay_ket_thuc)  = '2020')
                
     and dv.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = '2021'
                OR YEAR(hd.ngay_ket_thuc) = '2021')
                
    group by dv.ma_dich_vu;

-- task 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
 
 select
	ho_ten
from
    khach_hang
    group by ho_ten;
    
    -- Cách 2:
SELECT DISTINCT
    ho_ten 
FROM
    khach_hang;
    
    
-- Cách 3:
SELECT 
    t.ho_ten
FROM
    (SELECT 
        ho_ten, COUNT(ho_ten) AS a
    FROM
        khach_hang
    GROUP BY ho_ten
    HAVING a > 1) as t;

-- task9:
-- Thực hiện thống kê doanh thu theo tháng của năm 2021.
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    COUNT(MONTH(hd.ngay_lam_hop_dong)) AS so_luong_khach_hang
FROM
    hop_dong hd
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY  thang
order by thang;

-- task10:
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem). 
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong 
order by hd.ma_hop_dong; 

-- task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng 
-- bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select
	dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
    from
    khach_hang kh
    join
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    join
    hop_dong_chi_tiet hdct on  hdct.ma_hop_dong = hd.ma_hop_dong
    join
    dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    where
    lk.ten_loai_khach = 'diamond'
		and
			(kh.dia_chi like '%vinh' or kh.dia_chi like '%quảng ngãi');
    
-- task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chua tung được khách hàng đặt vào 6 tháng đầu năm 2021

select
hd.ma_hop_dong, 
nv.ho_ten, 
kh.ho_ten, 
kh.so_dien_thoai,
dv.ten_dich_vu,
SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem,
hd.tien_dat_coc
from
hop_dong hd
join
nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join
hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join
khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join
dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where
(QUARTER(ngay_lam_hop_dong) = 4
                AND YEAR(ngay_lam_hop_dong) = 2020)
                OR (QUARTER(ngay_ket_thuc) = 4
                AND YEAR(ngay_ket_thuc) = 2020)
        AND hd.ma_hop_dong NOT IN (SELECT 
            ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 6 
                AND YEAR(ngay_lam_hop_dong) = 2021)
                OR (MONTH(ngay_ket_thuc) BETWEEN 1 AND 6
                AND YEAR(ngay_ket_thuc) = 2021))

group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). 
select
dvdk.*, 
sum(hdct.so_luong) as so_luong
from
	dich_vu_di_kem dvdk
    join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
	join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
    group by dvdk.ma_dich_vu_di_kem
    having so_luong = (
    select sum(hdct.so_luong) as so_luong_dich_vu_di_kem
    from hop_dong_chi_tiet hdct
    	group by ma_dich_vu_di_kem
    order by so_luong_dich_vu_di_kem desc limit 1
    );
    
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem). 
    
 SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem  
having so_lan_su_dung = 1;
    
    -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021. 
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
        JOIN
    hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien

where (year(hd.ngay_lam_hop_dong) = 2020 or year(hd.ngay_lam_hop_dong) = 2021) 
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3;
    
    -- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 	-- đã từng
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
    ma_khach_hang IN (SELECT 	-- chưa từng
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
    SET FOREIGN_KEY_CHECKS=1;
    
    
    
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

 


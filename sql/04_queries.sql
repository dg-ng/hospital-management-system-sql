--Tìm những bệnh nhân trước giờ chỉ khám 1 lần 
SELECT hotenbn, COUNT(pk.mabn)AS so_lan_kham FROM BENHNHAN bn
JOIN PHIEUKHAM pk ON bn.mabn=pk.mabn
GROUP BY hotenbn
HAVING COUNT(pk.mabn)= 1

--Những phiếu khám được lập bởi bác sĩ Khoa Ung bướu 
SELECT pk.maphieu, pk.mabs, k.tenkhoa_pb from PHIEUKHAM pk
JOIN BACSI b ON pk.mabs = b.manv
JOIN NHANVIEN nv ON b.manv = nv.manv
JOIN KHOA_PHONGBAN k ON nv.makhoa_pb = k.makhoa_pb
WHERE k.tenkhoa_pb = N'Khoa ung bướu';

-- Tìm những bệnh chưa có trường hợp nào được ghi nhận
SELECT b.tenbenh
FROM BENH b
LEFT JOIN CHANDOAN cd ON b.mabenh = cd.mabenh
WHERE cd.mabenh IS NULL

--Tìm những toa thuốc được kê theo viên 
SELECT tt.matoa, cttt.mathuoc, t.dvt FROM TOATHUOC tt
JOIN CHITIETTOATHUOC cttt ON cttt.matoa=tt.matoa
JOIN THUOC t ON t.mathuoc=cttt.mathuoc
WHERE t.dvt=N'viên'

-- Thứ tự các loại thuốc thường được sử dụng
SELECT t.mathuoc, tenthuoc, COUNT(cttt.mathuoc) AS so_lan
FROM THUOC t
RIGHT JOIN CHITIETTOATHUOC cttt ON t.mathuoc = cttt.mathuoc
GROUP BY t.mathuoc, tenthuoc
ORDER BY COUNT(cttt.mathuoc) DESC;

-- Những Nhân viên không phải là bác sĩ và điều dưỡng
-- Cách 1
SELECT *
FROM NHANVIEN nv
WHERE nv.manv NOT IN (SELECT manv FROM BACSI)
AND nv.manv NOT IN (SELECT manv FROM DIEUDUONG);
-- Cách 2
SELECT nv.* 
FROM NHANVIEN nv
LEFT JOIN BACSI b ON nv.manv = b.manv
LEFT JOIN DIEUDUONG d ON nv.manv = d.manv
WHERE b.manv IS NULL AND d.manv IS NULL;

--Tìm khoa có nhiều nhân viên nhất 
select top 1 with ties k.makhoa_pb from KHOA_PHONGBAN k
join NHANVIEN nv on nv.makhoa_pb=k.makhoa_pb
group by k.makhoa_pb
order by count(manv) DESC

--Tìm tổng số giờ trực của từng điều dưỡng
select dd.manv,Sum(qlpb.sogiotuan) as tongsogiotruc from DIEUDUONG dd
join QUANLY_PHONGBENH qlpb on qlpb.manvdd= dd.manv
GROUP BY dd.manv;

--Truy vấn phòng bệnh chưa có bệnh nhân 
SELECT pb.maphong 
FROM PHONGBENH pb
LEFT JOIN PHIEUXUATVIEN pxv ON pxv.maphong = pb.maphong
WHERE pxv.maphong IS NULL;

-- Những phiếu khám được lập trong tháng 5/2022
-- Cách 1:
Select maphieu from PHIEUKHAM
where ngaykham >= '2022-05-01' AND ngaykham <= '2022-05-31'
-- Cách 2:
SELECT maphieu, ngaykham FROM PHIEUKHAM
WHERE MONTH(ngaykham) = 5 AND YEAR(ngaykham) = 2022;

--Tìm khoa có lương trung bình cao nhất 
SELECT TOP 1 kpb.makhoa_pb,tenkhoa_pb,AVG(nv.mucluong) AS luongtrungbinh  FROM KHOA_PHONGBAN kpb
JOIN NHANVIEN nv ON kpb.makhoa_pb=nv.makhoa_pb
GROUP BY kpb.makhoa_pb,tenkhoa_pb
ORDER BY luongtrungbinh DESC

-- Tìm lương trung bình của nhân viên nam 
SELECT AVG(nv.mucluong) AS luongtrungbinh FROM NHANVIEN nv
WHERE nu = 0

-- Tìm những bệnh nhân không có thân nhân 
SELECT DISTINCT * FROM BENHNHAN b
LEFT JOIN THANNHAN tn ON b.mabn = tn.mabenhnhan
WHERE tn.mabenhnhan is null

-- Tìm bác sĩ chưa kê đơn nào 
SELECT bs.manv FROM BACSI bs
WHERE not exists (SELECT pk.mabs FROM PHIEUKHAM pk  WHERE pk.mabs = bs.manv)

-- Tìm bệnh nhân có thời gian nhập viên lâu nhất
SELECT TOP 1 bn.mabn, bn.hotenbn, pxv.ngaynhapvien, pxv.ngayxuatvien,
       DATEDIFF(DAY, pxv.ngaynhapvien, pxv.ngayxuatvien) AS so_ngay_nam_vien
FROM BENHNHAN bn
JOIN PHIEUXUATVIEN pxv ON bn.mabn = pxv.mabn
WHERE pxv.ngayxuatvien IS NOT NULL -- Loại trừ các bệnh nhân chưa xuất viện
ORDER BY so_ngay_nam_vien DESC;
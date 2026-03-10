
--1.Tổng số giờ tuần của y tá trực không quá 48 giờ
CREATE TRIGGER GHTG_QLP ON QUANLY_PHONGBENH
AFTER INSERT, UPDATE
AS
DECLARE 
@TONGSOGIO INT;
IF EXISTS
( SELECT 1
FROM 
(SELECT ql.manvdd, SUM(ql.sogiotuan) tonggio
FROM QUANLY_PHONGBENH ql 
join inserted i on i.manvdd=ql.manvdd 
group by ql.manvdd ) dd
where dd.tonggio>48
)
BEGIN 
PRINT N'Mỗi y tá không trực quá 48h/tuần'
ROLLBACK TRANSACTION;
END;

--test1
INSERT INTO QUANLY_PHONGBENH (manvdd, maphong, sogiotuan)
VALUES
('NV008', 'A201', 30),
('NV002','B105',20);


--2.Ngày xuất viện phải sau ngày nhập viện
CREATE TRIGGER TG_N_X_VIEN ON PHIEUXUATVIEN
AFTER INSERT, UPDATE
AS
IF EXISTS
(
SELECT 1
FROM INSERTED 
where ngayxuatvien< ngaynhapvien
)
BEGIN
PRINT N'Ngày xuất viện phải sau ngày nhập viện'
ROLLBACK TRANSACTION
END;

--test2
INSERT INTO PHIEUXUATVIEN (maphieu, ngaynhapvien, ngayxuatvien, mabn, maphong) VALUES
('PX0014', '2021-12-25', '2021-10-13', 'BN001', 'B105');

--3.Ngày lập hóa đơn phải trong hoặc sau ngày xuất viện nhưng không quá 1 ngày sau ngày xuất viện
--3.a
CREATE TRIGGER TR_NgayLapHoaDon ON HOADON
AFTER INSERT, UPDATE
AS
    IF EXISTS (
        SELECT 1
        FROM PHIEUXUATVIEN PXV
        JOIN inserted i ON PXV.maphieu = i.mapxv
        WHERE i.ngaylaphoadon < PXV.ngayxuatvien 
           OR i.ngaylaphoadon > DATEADD(day, 1, PXV.ngayxuatvien)
    )
    BEGIN
        PRINT N'Ngày lập hóa đơn phải trong hoặc sau ngày xuất viện nhưng không quá 1 ngày sau ngày xuất viện.';
        ROLLBACK TRANSACTION;
    END;

--3.b
CREATE TRIGGER TR_NLHD 
ON PHIEUXUATVIEN
AFTER UPDATE
AS
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN HOADON HD ON i.maphieu = HD.mapxv
        WHERE HD.ngaylaphoadon < i.ngayxuatvien 
           OR HD.ngaylaphoadon > DATEADD(day, 1, i.ngayxuatvien)
    )
    BEGIN
        PRINT N'Ngày lập hóa đơn phải trong hoặc sau ngày xuất viện nhưng không quá 1 ngày sau ngày xuất viện.';
        ROLLBACK TRANSACTION;
    END;

	--test 3.a
UPDATE HOADON 
SET ngaylaphoadon = '2021-01-15'
WHERE mahd = 'BILL001'--2021-01-13 NXV

--test 3.b
UPDATE PHIEUXUATVIEN
SET ngayxuatvien = '2021-01-15'
WHERE maphieu = 'PX0001'; --NLHD 2021-01-13

--4.Lương tối thiểu của nhân viên trên 4.680.000 đồng
CREATE TRIGGER MIN_SALARY ON NHANVIEN
AFTER INSERT, UPDATE
AS
IF EXISTS 
(SELECT 1
FROM inserted WHERE mucluong<4680000)
BEGIN 
	PRINT(N'Lương tối thiểu là 4680000 đồng');
	ROLLBACK TRANSACTION
END;

--test 4
UPDATE NHANVIEN 
SET mucluong = 3000000
WHERE manv = 'NV009';

--5.Mỗi khoa/ phòng phải có ít nhất một nhân viên

--5.a
CREATE TRIGGER TR_SoLuongNVKPB ON [dbo].[KHOA_PHONGBAN]
AFTER INSERT, UPDATE
AS
DECLARE @sonhanvien INT, @makhoa_pb VARCHAR(6);
SELECT @makhoa_pb = makhoa_pb FROM inserted;
SELECT @sonhanvien = COUNT(*) FROM NHANVIEN WHERE NHANVIEN.makhoa_pb = @makhoa_pb
IF @sonhanvien < 1
BEGIN
	PRINT (N'Mỗi khoa, phòng ban phải có ít nhất 1 người');
	ROLLBACK TRANSACTION
END;

--5.b
CREATE TRIGGER TR_SoLuongNV ON [dbo].[NHANVIEN]
AFTER DELETE, UPDATE 
AS
DECLARE @sonhanvien INT, @makhoa_pb VARCHAR(6);
SELECT @makhoa_pb = makhoa_pb FROM deleted;
SELECT @sonhanvien = COUNT(*) FROM NHANVIEN WHERE NHANVIEN.makhoa_pb = @makhoa_pb
IF @sonhanvien < 1
BEGIN
	PRINT (N'Mỗi khoa, phòng ban phải có ít nhất 1 người');
	ROLLBACK TRANSACTION
END;

--test 5.a
DELETE FROM NHANVIEN
WHERE manv = 'NV003';

--test 5.b
INSERT INTO KHOA_PHONGBAN (makhoa_pb)
VALUES ('ABC');

--6.Mỗi bệnh nhân chỉ có 1 thân nhân
CREATE TRIGGER TN_BN ON THANNHAN
FOR INSERT, UPDATE
AS
IF EXISTS
(SELECT 1 FROM inserted WHERE mabenhnhan IN (SELECT mabenhnhan FROM THANNHAN))
BEGIN
PRINT N'Bệnh viện chỉ lưu 1 thân nhân cho 1 bệnh nhân'
ROLLBACK TRANSACTION;
END;

--test6
INSERT INTO THANNHAN  --BN003 và BN009 đã có thân nhân
VALUES
('TN005',N'Nguyễn Ngọc Thanh',N'Cha','0974536278','BN003'),
('TN006',N'Nguyễn Ngọc Tú',N'Chú','0974346272','BN009');















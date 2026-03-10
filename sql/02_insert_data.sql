
INSERT INTO KHOA_PHONGBAN (makhoa_pb, tenkhoa_pb) VALUES
('TM', N'Khoa tim mạch'),
('CXK', N'Khoa cơ xương khớp'),
('TMH', N'Khoa tai mũi họng'),
('UB', N'Khoa ung bướu'),
('PS', N'Khoa phụ sản'),
('DL', N'Khoa da liễu'),
('HR', N'Phòng nhân sự'),
('KT', N'Phòng kế toán');

INSERT INTO NHANVIEN (manv, hotennv, ngaysinh, diachi, nu, sodienthoai, mucluong, makhoa_pb)
VALUES
('NV001', N'Nguyễn Đỗ Nhật Minh', '1980-12-25', N'250 Lê Hồng Phong, phường 13, quận 10, TP.HCM', 0, '0987676890', 7000000, 'UB'),
('NV002', N'Nguyễn Lợi Thanh Dũng', '1978-02-07', N'30/5 Văn Cao, phường 12, quận Tân Phú, TP.HCM', 0, '0965785443', 6500000, 'PS'),
('NV003', N'Tăng Gia Hoàng', '1977-06-30', N'391 Nguyễn Tri Phương, phường 10, quận 5, TP.HCM', 0, '0926382492', 7000000, 'KT'),
('NV004', N'Dương Phương Anh', '1982-09-21', N'139 Nguyễn Du, phường Bến Nghé, quận 1, TP.HCM', 1, '0912345678', 9000000, 'TMH'),
('NV005', N'Nguyễn Hoàng Huy', '1975-08-30', N'348 Bàn Cờ, phường 3, quận 3, TP.HCM', 0, '0987654321', 9000000, 'TMH'),
('NV006', N'Huỳnh Thụy Mai Nguyên', '1975-05-30', N'51/6 An Dương Vương, phường 2, quận 5, TP.HCM', 1, '0908070605', 18000000, 'CXK'),
('NV007', N'Trần Minh Hiếu', '1983-01-27', N'21/5/4E Ngô Tất Tố, phường 20, quận Bình Thạnh, TP.HCM', 0, '0876543567', 7500000, 'HR'),
('NV008', N'Nguyễn Thanh Pháp', '1996-07-27', N'356 Lê Văn Duyệt, phường 3, quận Bình Thạnh, TP.HCM', 1, '0636355353', 6500000, 'DL'),
('NV009', N'Nguyễn Thị Thùy Dương', '1976-05-25', N'655 Lê Hồng Phong, phường 10, quận 10, TP.HCM', 1, '0987654432', 10000000, 'TM');

INSERT INTO BACSI (manv, hocvi, mahnbs)
VALUES
('NV001', 'BS.CK II', '0008941/SL-CCHN'),
('NV005', 'BS.CK I', '0008927/SL-CCHN'),
('NV006', 'BS.CK II', '0008940/SL-CCHN'),
('NV009', 'BS.CK I', '0007927/SL-CCHN');

INSERT INTO DIEUDUONG (manv, maccdd)
VALUES
('NV002', '001097'),
('NV004', '001058'),
('NV008', '001876');

INSERT INTO BENHNHAN (mabn, hotenbn, sdt, ngaysinh, diachi, nu, CCCD, BHYT) VALUES
('BN001', N'Trần Thị Nga Mỹ', '0901234567', '1985-02-15', N'123 Đường Trần Hưng Đạo, Quận 1, TP.HCM', 0, '123456789012', 'BV1234567890123'),
('BN002', N'Nguyễn Thị Bo', '0978654321', '1990-06-25', N'456 Đường Nguyễn Văn Hưởng, Quận 2, TP.HCM', 1, '324567890126', 'QN9876543210987'),
('BN003', N'Trần Văn Hào Môn', '0976543218', '1978-11-30', N'789 Đường Lê Văn Sĩ, Quận 3, TP.HCM', 1, '123456789123', 'DN4567891234567'),
('BN004', N'Bành Thị Kim Loan', '0228346328', '1988-03-12', N'321 Đường Xóm Chiếu, Quận 4, TP.HCM', 0, '987654321099', 'HD3210987654321'),
('BN005', N'Tăng Duy Tân', '0899112233', '1995-03-02', N'456 Đường Nguyễn Huệ, Quận 1, TP.HCM', 0, '112233445566', 'LA5678901234567'),
('BN006', N'Nguyễn Thị Hòa', '0708334455', '2002-08-27', N'789 Đường Lý Thái Tổ, Quận 3, TP.HCM', 0, '223344556677', 'TN0987654321123'),
('BN007', N'Thái Thủy Hoàng', '0903223344', '1988-11-05', N'321 Đường Hai Bà Trưng, Quận 1, TP.HCM', 1, '334455667788', 'AG6543210987654'),
('BN008', N'Trần Hoàng Đức Duy', '0868556677', '1999-06-19', N'654 Đường Lê Lợi, Quận 3, TP.HCM', 1, '445566778899', 'CT1230987654321'),
('BN009', N'Trần Minh Kha', '0942667788', '2005-01-04', N'987 Đường Phan Xích Long, Quận Phú Nhuận, TP.HCM', 1, '556677889900', 'ST7890123456789'),
('BN010', N'Hoàn Mỹ', '0789999888', '2004-12-01', N'213 Đường Võ Văn Kiệt, Quận 5, TP.HCM', 0, '667788990011', 'TH4567890123456');

INSERT INTO THANNHAN (matn, hotentn, mqh, sdt, mabenhnhan) VALUES
('TN001', N'Trần Văn Thông', N'Cha', '0901112233','BN003'),
('TN002', N'Nguyễn Thị Trà My', N'Mẹ', '0912345678', 'BN005'),
('TN003', N'Lê Văn Vũ', N'Anh', '0923456789', 'BN006'),
('TN004', N'Phạm Thị Thùy Dương', N'Chị', '0934567890', 'BN009');

INSERT INTO PHIEUKHAM (maphieu, ngaykham, mabs, mabn)
VALUES
('PK001', '2020-12-25', 'NV001', 'BN001'),
('PK002', '2021-01-26', 'NV005', 'BN002'),
('PK003', '2021-05-27', 'NV005', 'BN003'),
('PK004', '2021-10-08', 'NV001', 'BN004'),
('PK005', '2022-03-03', 'NV005', 'BN005'),
('PK006', '2022-05-30', 'NV006', 'BN006'),
('PK007', '2022-05-30', 'NV001', 'BN007'),
('PK008', '2023-11-01', 'NV001', 'BN008'),
('PK009', '2023-11-05', 'NV001', 'BN009'),
('PK010', '2024-11-10', 'NV006', 'BN010'),
('PK011', '2024-11-15', 'NV006', 'BN006'),
('PK012', '2024-11-20', 'NV001', 'BN002'),
('PK013', '2024-11-25', 'NV005', 'BN004');

INSERT INTO BENH (mabenh, tenbenh)
VALUES
('B001', N'Tiểu đường'),
('B002', N'Cao huyết áp'),
('B003', N'Suy giáp'),
('B004', N'Sốt siêu vi'),
('B005', N'Cường giáp'),
('B006', N'Lệch vách ngăn');

INSERT INTO TOATHUOC (matoa, ngaylap, mapk)
VALUES
('TT001', '2021-01-17', 'PK001'),
('TT002', '2021-02-17', 'PK002'),
('TT003', '2021-06-06', 'PK003'),
('TT004', '2021-10-31', 'PK004'),
('TT005', '2022-03-28', 'PK005'),
('TT006', '2022-06-07', 'PK006'),
('TT007', '2022-06-24', 'PK007'),
('TT008', '2023-11-25', 'PK008'),
('TT009', '2023-11-10', 'PK009'),
('TT010', '2024-11-18', 'PK010'),
('TT011', '2024-11-24', 'PK011'),
('TT012', '2024-12-11', 'PK012'),
('TT013', '2024-12-06', 'PK013');

INSERT INTO THUOC (mathuoc, tenthuoc, dvt, dongia)
VALUES
('PND1', 'Panadol', N'viên', 2000),
('CPC1', 'Complex C', N'vỉ', 20000),
('PNS1', 'Prednison', N'vỉ', 35000),
('TRZ1', 'Thyrozol', N'lọ', 80000),
('CPM1', 'Cepmox', N'lọ', 120000);

INSERT INTO PHONGBENH (maphong, loaiphong, succhua)
VALUES
('A302', N'Thường', 8),
('A201', 'Vip', 4),
('B105', N'Thường', 20),
('B402', 'Vip', 4),
('B205', N'Thường', 6),
('A405', 'Vip', 1);

INSERT INTO QUANLY_PHONGBENH (manvdd, maphong, sogiotuan)
VALUES
('NV008', 'A302', 8),
('NV002', 'A201', 14),
('NV004', 'B105', 22),
('NV008', 'B402', 10),
('NV008', 'B205', 10),
('NV002', 'A405', 20);

INSERT INTO PHIEUXUATVIEN (maphieu, ngaynhapvien, ngayxuatvien, mabn, maphong) VALUES
('PX0001', '2020-12-25', '2021-01-13', 'BN001', 'A201'),
('PX0002', '2021-01-26', '2021-02-02', 'BN002', 'A405'),
('PX0003', '2021-05-27', '2021-06-03', 'BN003', 'B402'),
('PX0004', '2021-10-08', '2021-10-14', 'BN004', 'B402'),
('PX0005', '2022-03-03', '2022-03-12', 'BN005', 'A302'),
('PX0006', '2022-05-30', '2022-06-19', 'BN006', 'A201'),
('PX0007', '2022-05-30', '2022-06-16', 'BN007', 'B105'),
('PX0008', '2023-11-01', '2023-11-06', 'BN008', 'B402'),
('PX0009', '2023-11-05', '2023-11-21', 'BN009', 'B205'),
('PX0010', '2024-11-10', '2024-11-28', 'BN010', 'A201'),
('PX0011', '2024-11-15', '2024-12-03', 'BN006', 'B105'),
('PX0012', '2024-11-20', '2024-12-16', 'BN002', 'B402'),
('PX0013', '2024-11-25', '2024-11-30', 'BN004', 'B205');

INSERT INTO HOADON (mahd, ngaylaphoadon, mabn, tien, mapxv) VALUES
('BILL001', '2021-01-13', 'BN001', 1235000,'PX0001'),
('BILL002', '2021-02-02', 'BN002', 6400000,'PX0002'),
('BILL003', '2021-06-03', 'BN003', 2179000,'PX0003'),
('BILL004', '2021-10-14', 'BN004', 2689000,'PX0004'),
('BILL005', '2022-03-12', 'BN005', 2155000,'PX0005'),
('BILL006', '2022-06-19', 'BN006', 3289000,'PX0006'),
('BILL007', '2022-06-16', 'BN007', 2220000,'PX0007'),
('BILL008', '2023-11-06', 'BN008', 2664000,'PX0008'),
('BILL009', '2023-11-21', 'BN009', 1075000,'PX0009'),
('BILL010', '2024-11-28', 'BN010', 761000,'PX0010'),
('BILL011', '2024-12-03', 'BN006', 1292000,'PX0011'),
('BILL012', '2024-12-16', 'BN002', 1665000,'PX0012'),
('BILL013', '2024-11-30', 'BN004', 3121000,'PX0013');

INSERT INTO CHANDOAN (maphieu, mabenh)
VALUES
('PK001', 'B004'),
('PK004', 'B004'),
('PK006', 'B004'),
('PK011', 'B004');

INSERT INTO CHITIETTOATHUOC (matoa, mathuoc, lieuluong)
VALUES
('TT001', 'PND1', N'Uống 1 viên mỗi 8 giờ khi cần'),
('TT001', 'CPC1', N'Uống 1 viên mỗi ngày'),
('TT002', 'TRZ1', N'Uống 1 viên 2 lần/ngày sau ăn'),
('TT003', 'CPM1', N'Uống 1 viên mỗi ngày'),
('TT004', 'PND1', N'Uống 1 viên mỗi 8 giờ khi cần'),
('TT004', 'CPC1', N'Uống 1 viên mỗi ngày'),
('TT004', 'PNS1', N'Uống 1 viên mỗi ngày'),
('TT005', 'TRZ1', N'Uống 1 viên 2 lần/ngày sau ăn'),
('TT006', 'PNS1', N'Uống 1 viên mỗi ngày'),
('TT006', 'TRZ1', N'Uống 1 viên 2 lần/ngày sau ăn');






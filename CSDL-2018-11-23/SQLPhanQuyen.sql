--1) Procedures thêm người dùng -> Tạo userlogin -> Phân quyền
ALTER PROC PROC_THEM_NGUOIDUNG @MaCanBo nvarchar(20)
							  ,@HoVaTen nvarchar(255)
							  ,@NgaySinh Date
							  ,@Email nvarchar(50)
							  ,@sdt nvarchar(11)
							  ,@username nvarchar(50)
							  , @password nvarchar(20)
							  , @TrangThai int
							  , @quyen int
							  , @MaCoQUan int
AS
BEGIN

INSERT INTO NGUOIDUNG 
VALUES ( @MaCanBo
		,@HoVaTen 
		,@NgaySinh
		,@Email
		,@sdt
		,@username 
		, @password 
		, @TrangThai
		, @quyen 
		, @MaCoQUan
		)

EXEC PROC_ADD_ACCOUNT_LOGIN @username, @username

END
GO

EXEC PROC_THEM_NGUOIDUNG 'CBNC001'
						 ,'Phan Huu Cau'
						 ,'2019/12/02'
						,'thinh@gmail.com'
						,'0971443983'
						,'CBNC001'
							,'CBNC001'
							  , 1
							  , 1
							  , 1


--2) Procedures Thêm account login when add user. Called at Proc PROC_THEM_NGUOIDUNG
ALTER PROC PROC_ADD_ACCOUNT_LOGIN @username nvarchar(50), @password nvarchar(50)
AS
BEGIN
	BEGIN TRANSACTION
	--ADD LOGIN AND USER
	DECLARE @SQLStringCreateLogin nvarchar(max)
	SET @SQLStringCreateLogin = 'CREATE LOGIN [' + @username + '] WITH PASSWORD = ''' + @Password + '''' + ', DEFAULT_DATABASE=[master] ,
								DEFAULT_LANGUAGE=[us_ENGLISH], CHECK_EXPIRATION=ON, CHECK_POLICY=ON;'
	exec (@SQLStringCreateLogin)

	DECLARE @SQLStringCreateUser nvarchar(max)
	SET @SQLStringCreateUser = 'CREATE USER [' + @username + '] FOR LOGIN [' + @username +']'

	exec (@SQLStringCreateUser)

	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR(N'Có lỗi lúc tạo user login rồi',16,1)
		ROLLBACK TRANSACTION
		RETURN
	END

	COMMIT TRANSACTION
END
GO
EXEC PHANQUYEN 'SA02', 'CANBOHOTICH'

--3) PROC phân quyền theo mã quyền
CREATE PROC PHANQUYEN @username nvarchar(50), @chucnang nvarchar(50)
AS
BEGIN
	if(@chucnang='CANBOHOTICH')
	BEGIN
		EXEC sp_addrolemember 'CANBOHOTICH', @username
	END
	if(@chucnang='ADMINCOQUAN')
	BEGIN
		EXEC sp_addrolemember 'ADMINCOQUAN', @username
	END
END
GO

--PHAN QUYÊN CHO CÁC ROLLE
--Code phân quyền cho cán bộ hộ tịch 
--Phân quyền cho table
--1) Các loại giấy tờ
GRANT SELECT ON DANGKY_KHAISINH TO CANBOHOTICH
GRANT SELECT ON DANGKY_KETHON TO CANBOHOTICH
GRANT SELECT ON DANGKY_CHUNGTU TO CANBOHOTICH
--2) Các bản chung của giấy tờ
GRANT SELECT ON DANGKY_TRICHLUC TO CANBOHOTICH
--3) Các bảng chuyên dụng
GRANT SELECT ON THANHPHO TO CANBOHOTICH
GRANT SELECT ON QUAN TO CANBOHOTICH
GRANT SELECT ON PHUONG TO CANBOHOTICH
GRANT SELECT ON DANTOC TO CANBOHOTIC
GRANT SELECT ON QUOCGIA TO CANBOHOTICH
--4) các ban phan loai giay to
GRANT SELECT ON LOAI_GIAYTO TO CANBOHOTICH
GRANT SELECT ON LOAI_DANGKY TO CANBOHOTICH
GRANT SELECT ON HINHTHUC_DANGKY TO CANBOHOTICH
--5) các bảng chuyên dụng dành cho cán bộ hộ tịch
GRANT SELECT,INSERT, UPDATE ON HOSO_DANGKY TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_KHAISINH TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_CHUNGTU TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_KETHON TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON CONGDAN TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON PHANHOI TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON THONGBAO TO CANBOHOTICH

--Phân quyền cho các programing database
--1) Phân quyền cho các Store Procedures
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HOTICH_COQUAN  to CANBOHOTICH
GRANT EXEC ON Add_Giay_KhaiSinh to CANBOHOTICH
GRANT EXEC ON Add_Giay_Kethon to CANBOHOTICH
GRANT EXEC ON Add_Giay_Chungtu to CANBOHOTICH
GRANT EXEC ON TimKiem_HoTich to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
--2) Phân quyền cho các Fuction
GRANT SELECT ON GET_HOSO_DANGKY_KHAISINH to CANBOHOTICH
GRANT SELECT ON Get_Giay_KhaiSinh  to CANBOHOTICH
GRANT SELECT ON Get_Giay_KetHon  to CANBOHOTICH
GRANT SELECT ON Get_Giay_ChungTu  to CANBOHOTICH


--Phân quyền cho Store Procedure
GRANT EXEC ON name to user

--Phân quyền cho function
GRANT SELECT ON name to user
---Tao bảng quyền lưu trữ các Roll



CREATE FUNCTION GET_NGUOIDUNG_TABLE (@MaCoQuan int)
RETURNS @tableUser TABLE(HoVaTen nvarchar(255), MaCB nvarchar(20), email nvarchar(50), sdt nvarchar(11), chucvu nvarchar(255), quyen nvarchar(50), trangThai nvarchar(50) )
AS
BEGIN
    INSERT INTO @tableUser (HoVaTen,MaCB,email,sdt)
	SELECT NGUOIDUNG_HOVATEN, NGUOIDUNG_MACANBO, NGUOIDUNG_EMAIL, NGUOIDUNG_SDT
	FROM NGUOIDUNG
	WHERE COQUAN_ID = @MaCoQuan	
	RETURN	  
END

SELECT * FROM GET_NGUOIDUNG_TABLE(1)
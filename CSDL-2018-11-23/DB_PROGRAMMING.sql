--Thêm 1 hồ sơ đăng ký
DROP PROC PROC_ADD_HOSO_DANGKY
CREATE PROC PROC_ADD_HOSO_DANGKY (@CoQuanID int, @LoaiDangKyID int) 
AS		
BEGIN
	INSERT INTO dbo.HOSO_DANGKY (TRANGTHAI_XULY_ID, HOSO_DANGKY_NGAY_DANGKY, HOSO_DANGKY_NGAY_HETHAN, COQUAN_ID, LOAI_DANGKY_ID)							   
	VALUES(NULL,NULL,NULL,@CoQuanID,@LoaiDangKyID );
END
GO
--Trigger sinh ra Mã hồ sơ đăng ký, Trạng thái xử lý, Ngày đăng ký, Ngày hết hạn
IF OBJECT_ID ('TRIGGER_ADD_HOSO_DANGKY','TR') IS NOT NULL
	DROP TRIGGER TRIGGER_ADD_HOSO_DANGKY;
GO
CREATE TRIGGER TRIGGER_ADD_HOSO_DANGKY ON HOSO_DANGKY
FOR INSERT
AS
	declare @id int, @loai_dangki int
	select @id=ne.HOSO_DANGKY_ID, @loai_dangki = ne.LOAI_DANGKY_ID
	from inserted ne

	UPDATE HOSO_DANGKY
	SET HOSO_DANGKY_MA = CONCAT('HSDK',replace(convert(VARCHAR(8),getdate(),11),'/','') +replace(convert(VARCHAR(8),getdate(),108),':',''))
		,TRANGTHAI_XULY_ID = ( SELECT TRANGTHAI_XULY_ID
							   FROM TRANGTHAI_XULY
							   WHERE TRANGTHAI_XULY_TEN like N'Chưa xử lý')
		,HOSO_DANGKY_NGAY_DANGKY = GETDATE()
		,HOSO_DANGKY_NGAY_HETHAN = DATEADD(DAY
										   , (SELECT LOAI_DANGKY_HANXULY
											  FROM LOAI_DANGKY
											  WHERE LOAI_DANGKY_ID = @loai_dangki)
										   , GETDATE()
										   )
	WHERE HOSO_DANGKY_ID = @id
GO
--Thêm giấy khai sinh
DROP PROC ADD_HOSO_DANGKY_KHAISINH_NYC
CREATE PROC ADD_HOSO_DANGKY_KHAISINH_NYC(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@NYC_TEN	nvarchar(255)
									,@NYC_CMND	nvarchar(12)
									,@NYC_CMND_NGAYCAP	date
									,@NYC_CMND_NOICAP	nvarchar(255)
									,@NYC_QUOCTICH	nvarchar(50)
									,@NYC_THANHPHO	nvarchar(50)
									,@NYC_QUAN	nvarchar(50)
									,@NYC_PHUONG	nvarchar(50)
									,@NYC_DIACHI	nvarchar(255)
									,@NYC_QUANHE	nvarchar(100) 
									,@KS_TEN	nvarchar(255)
									,@KS_GIOITINH	bit
									,@KS_NGAYSINH	date
									,@KS_DANTOC	nvarchar(50)
									,@KS_QUOCTICH	nvarchar(50)
									,@KS_QUEQUAN_THANHPHO	nvarchar(50)
									,@KS_QUEQUAN_QUAN	nvarchar(50)
									,@KS_QUEQUAN_PHUONG	nvarchar(50)
									,@KS_QUEQUAN_DIACHI	nvarchar(255)
									,@KS_NOISINH	nvarchar(50)
									,@KS_QUOCGIA_NOISINH	nvarchar(50)
									,@KS_THANHPHO_NOISINH	nvarchar(50)
									,@KS_QUAN_NOISINH	nvarchar(50)
									,@KS_PHUONG_NOISINH	nvarchar(50)
									,@KS_DIACHI_NOISINH	nvarchar(50)
									,@ME_TEN	nvarchar(255)
									,@ME_NGAYSINH	date
									,@ME_CMND	nvarchar(12)
									,@ME_CMND_NGAYCAP	date
									,@ME_CMND_NOICAP	nvarchar(255)
									,@ME_DANTOC	nvarchar(50)
									,@ME_QUOCTICH	nvarchar(50)
									,@ME_THANHPHO	nvarchar(50)
									,@ME_QUAN	nvarchar(50)
									,@ME_PHUONG	nvarchar(50)
									,@ME_DIACHI	nvarchar(255)
									,@CHA_TEN	nvarchar(255)
									,@CHA_NGAYSINH	date
									,@CHA_CMND	nvarchar(12)
									,@CHA_CMND_NGAYCAP	date
									,@CHA_CMND_NOICAP	nvarchar(255)
									,@CHA_DANTOC	nvarchar(50)
									,@CHA_QUOCTICH	nvarchar(50)
									,@CHA_THANHPHO	nvarchar(50)
									,@CHA_QUAN	nvarchar(50)
									,@CHA_PHUONG	nvarchar(50)
									,@CHA_DIACHI	nvarchar(255)
									,@FILE_GIAYCHUNGSINH	nvarchar(255)
									)
									
AS
BEGIN
  --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_KHAISINH (HOSO_DANGKY_ID, NGUOIYEUCAU_TEN, NGUOIYEUCAU_CMND, NGUOIYEUCAU_CMND_NGAYCAP, NGUOIYEUCAU_CMND_NOICAP, NGUOIYEUCAU_QUOCTICH, NGUOIYEUCAU_THANHPHO, NGUOIYEUCAU_QUAN, NGUOIYEUCAU_PHUONG, NGUOIYEUCAU_DIACHI, NGUOIYEUCAU_QUANHE
								,KHAISINH_TEN, KHAISINH_GIOITINH, KHAISINH_NGAYSINH, KHAISINH_DANTOC, KHAISINH_QUOCTICH, KHAISINH_QUEQUAN_THANHPHO
								,KHAISINH_QUEQUAN_QUAN, KHAISINH_QUEQUAN_PHUONG, KHAISINH_QUEQUAN_DIACHI, KHAISINH_NOISINH
								,KHAISINH_NOISINH_QUOCGIA, KHAISINH_NOISINH_THANHPHO, KHAISINH_NOISINH_QUAN, KHAISINH_NOISINH_PHUONG, KHAISINH_NOISINH_DIACHI
								,ME_TEN, ME_NGAYSINH,ME_CMND,ME_CMND_NGAYCAP,ME_CMND_NOICAP,ME_DANTOC,ME_QUOCTICH,ME_THANHPHO,ME_QUAN,ME_PHUONG,ME_DIACHI
								,CHA_TEN, CHA_NGAYSINH,CHA_CMND,CHA_CMND_NGAYCAP,CHA_CMND_NOICAP,CHA_DANTOC,CHA_QUOCTICH,CHA_THANHPHO,CHA_QUAN,CHA_PHUONG,CHA_DIACHI
								,FILE_GIAYCHUNGSINH
								)
   VALUES ( @HSDK_ID
			,@NYC_TEN
			,@NYC_CMND
			,@NYC_CMND_NGAYCAP
			,@NYC_CMND_NOICAP
			,@NYC_QUOCTICH
			,@NYC_THANHPHO
			,@NYC_QUAN
			,@NYC_PHUONG
			,@NYC_DIACHI
			,@NYC_QUANHE
			,@KS_TEN
			,@KS_GIOITINH
			,@KS_NGAYSINH
			,@KS_DANTOC
			,@KS_QUOCTICH
			,@KS_QUEQUAN_THANHPHO
			,@KS_QUEQUAN_QUAN
			,@KS_QUEQUAN_PHUONG
			,@KS_QUEQUAN_DIACHI
			,@KS_NOISINH
			,@KS_QUOCGIA_NOISINH
			,@KS_THANHPHO_NOISINH
			,@KS_QUAN_NOISINH
			,@KS_PHUONG_NOISINH
			,@KS_DIACHI_NOISINH
			,@ME_TEN
			,@ME_NGAYSINH
			,@ME_CMND
			,@ME_CMND_NGAYCAP
			,@ME_CMND_NOICAP
			,@ME_DANTOC
			,@ME_QUOCTICH
			,@ME_THANHPHO
			,@ME_QUAN
			,@ME_PHUONG
			,@ME_DIACHI
			,@CHA_TEN
			,@CHA_NGAYSINH
			,@CHA_CMND
			,@CHA_CMND_NGAYCAP
			,@CHA_CMND_NOICAP
			,@CHA_DANTOC
			,@CHA_QUOCTICH
			,@CHA_THANHPHO
			,@CHA_QUAN
			,@CHA_PHUONG
			,@CHA_DIACHI
			,@FILE_GIAYCHUNGSINH
		)
END
GO
--2018/11/24
--Hàm lấy 1 giấy khai sinh dựa trên id hồ sơ đăng ký
DROP FUNCTION GET_HOSO_DANGKY_KHAISINH
CREATE FUNCTION GET_HOSO_DANGKY_KHAISINH(@idHSDK int)
RETURNS @table table(
					NYC_TEN nvarchar(255)
					,NYC_CMND	nvarchar(12)
					,NYC_CMND_NGAYCAP date
					,NYC_CMND_NOICAP nvarchar(255)
					,NYC_QUOCTICH nvarchar(50)
					,NYC_THANHPHO	nvarchar(50)
					,NYC_QUAN	nvarchar(50)
					,NYC_PHUONG	nvarchar(50)
					,NYC_DIACHI	nvarchar(255)
					,NYC_QUANHE	nvarchar(100) 
					,KS_TEN	nvarchar(255)
					,KS_GIOITINH	bit
					,KS_NGAYSINH	date
					,KS_DANTOC	nvarchar(50)
					,KS_QUOCTICH	nvarchar(50)
					,KS_QUEQUAN_THANHPHO	nvarchar(50)
					,KS_QUEQUAN_QUAN	nvarchar(50)
					,KS_QUEQUAN_PHUONG	nvarchar(50)
					,KS_QUEQUAN_DIACHI	nvarchar(255)
					,KS_NOISINH	nvarchar(100)
					,KS_QUOCGIA_NOISINH	nvarchar(50)
					,KS_THANHPHO_NOISINH	nvarchar(50)
					,KS_QUAN_NOISINH	nvarchar(50)
					,KS_PHUONG_NOISINH	nvarchar(50)
					,KS_DIACHI_NOISINH	nvarchar(50)
					,ME_TEN	nvarchar(255)
					,ME_NGAYSINH	date
					,ME_CMND	nvarchar(12)
					,ME_CMND_NGAYCAP	date
					,ME_CMND_NOICAP	nvarchar(255)
					,ME_DANTOC	nvarchar(50)
					,ME_QUOCTICH	nvarchar(50)
					,ME_THANHPHO	nvarchar(50)
					,ME_QUAN	nvarchar(50)
					,ME_PHUONG	nvarchar(50)
					,ME_DIACHI	nvarchar(255)
					,CHA_TEN	nvarchar(255)
					,CHA_NGAYSINH	date
					,CHA_CMND	nvarchar(12)
					,CHA_CMND_NGAYCAP	date
					,CHA_CMND_NOICAP	nvarchar(255)
					,CHA_DANTOC	nvarchar(50)
					,CHA_QUOCTICH	nvarchar(50)
					,CHA_THANHPHO	nvarchar(50)
					,CHA_QUAN	nvarchar(50)
					,CHA_PHUONG	nvarchar(50)
					,CHA_DIACHI	nvarchar(255)
					,FILE_GIAYCHUNGSINH	nvarchar(255))
AS
	BEGIN
		INSERT @table SELECT NGUOIYEUCAU_TEN, NGUOIYEUCAU_CMND, NGUOIYEUCAU_CMND_NGAYCAP, NGUOIYEUCAU_CMND_NOICAP, NGUOIYEUCAU_QUOCTICH, NGUOIYEUCAU_THANHPHO, NGUOIYEUCAU_QUAN, NGUOIYEUCAU_PHUONG, NGUOIYEUCAU_DIACHI, NGUOIYEUCAU_QUANHE
								,KHAISINH_TEN, KHAISINH_GIOITINH, KHAISINH_NGAYSINH, KHAISINH_DANTOC, KHAISINH_QUOCTICH, KHAISINH_QUEQUAN_THANHPHO
								,KHAISINH_QUEQUAN_QUAN, KHAISINH_QUEQUAN_PHUONG, KHAISINH_QUEQUAN_DIACHI, KHAISINH_NOISINH
								,KHAISINH_NOISINH_QUOCGIA, KHAISINH_NOISINH_THANHPHO, KHAISINH_NOISINH_QUAN, KHAISINH_NOISINH_PHUONG, KHAISINH_NOISINH_DIACHI
								,ME_TEN, ME_NGAYSINH,ME_CMND,ME_CMND_NGAYCAP,ME_CMND_NOICAP,ME_DANTOC,ME_QUOCTICH,ME_THANHPHO,ME_QUAN,ME_PHUONG,ME_DIACHI
								,CHA_TEN, CHA_NGAYSINH,CHA_CMND,CHA_CMND_NGAYCAP,CHA_CMND_NOICAP,CHA_DANTOC,CHA_QUOCTICH,CHA_THANHPHO,CHA_QUAN,CHA_PHUONG,CHA_DIACHI
								,FILE_GIAYCHUNGSINH
					  FROM DANGKY_KHAISINH KS
					  WHERE KS.HOSO_DANGKY_ID = 3
		RETURN
	END
SELECT * FROM GET_HOSO_DANGKY_KHAISINH(3)
--2018/11/24
-- hàm tìm kiếm dành cho công dân tìm kiếm hồ sơ đăng ký
CREATE PROC TIMKIEM_HOSO_DANGKY(@maHSDK NVARCHAR(20))
AS
	DECLARE @loaiGiay int
			, @idHSDK int
	SELECT @loaiGiay = LOAI_DANGKY.LOAI_GIAYTO_ID,@idHSDK =HSDK.HOSO_DANGKY_ID
	FROM HOSO_DANGKY HSDK, LOAI_DANGKY
	WHERE HSDK.HOSO_DANGKY_MA LIKE @maHSDK
		  AND HSDK.LOAI_DANGKY_ID = LOAI_DANGKY.LOAI_DANGKY_ID
	IF @loaiGiay = (SELECT LOAI_GIAYTO_ID
					FROM LOAI_GIAYTO
					WHERE LOAI_GIAYTO_TEN LIKE N'%khai sinh%')
	BEGIN
		SELECT * FROM GET_HOSO_DANGKY_KHAISINH(@idHSDK)
		RETURN
	END

EXEC TIMKIEM_HOSO_DANGKY 'HSDK181123140116'

--Thêm đăng ký kết hôn
CREATE PROC ADD_HOSO_DANGKY_KETHON(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@KH_V_HOTEN	nvarchar(255)
									,@KH_V_NGAYSINH	date
									,@KH_V_DANTOC	nvarchar(50)
									,@KH_V_CMND	nvarchar(12)
									,@KH_V_CMND_NGAYCAP	date
									,@KH_V_CMND_NOICAP	nvarchar(255)
									,@KH_V_QUOCTICH	nvarchar(50)
									,@KH_V_THANHPHO	nvarchar(50)
									,@KH_V_QUAN	nvarchar(50)
									,@KH_V_PHUONG	nvarchar(50)
									,@KH_V_DIACHI	nvarchar(255)
									,@KH_V_LAN	int
									,@KH_FILE_V	nvarchar(255)
									,@KH_C_HOTEN	nvarchar(255)
									,@KH_C_NGAYSINH	date
									,@KH_C_DANTOC	nvarchar(50)
									,@KH_C_CMND	nvarchar(12)
									,@KH_C_CMND_NGAYCAP	date
									,@KH_C_CMND_NOICAP	nvarchar(255)
									,@KH_C_QUOCTICH	nvarchar(50)
									,@KH_C_THANHPHO	nvarchar(50)
									,@KH_C_QUAN	nvarchar(50)
									,@KH_C_PHUONG	nvarchar(50)
									,@KH_C_DIACHI	nvarchar(255)
									,@KH_C_LAN	int
									,@KH_FILE_C	nvarchar(255))
AS
BEGIN
    --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_KETHON
   VALUES ( @HSDK_ID
			,@KH_V_HOTEN
			,@KH_V_NGAYSINH
			,@KH_V_DANTOC
			,@KH_V_CMND
			,@KH_V_CMND_NGAYCAP
			,@KH_V_CMND_NOICAP
			,@KH_V_QUOCTICH
			,@KH_V_THANHPHO
			,@KH_V_QUAN
			,@KH_V_PHUONG
			,@KH_V_DIACHI
			,@KH_V_LAN
			,@KH_FILE_V
			,@KH_C_HOTEN
			,@KH_C_NGAYSINH
			,@KH_C_DANTOC
			,@KH_C_CMND
			,@KH_C_CMND_NGAYCAP
			,@KH_C_CMND_NOICAP
			,@KH_C_QUOCTICH
			,@KH_C_THANHPHO
			,@KH_C_QUAN
			,@KH_C_PHUONG
			,@KH_C_DIACHI
			,@KH_C_LAN
			,@KH_FILE_C
		)
    
END
GO

--2 Thêm loại đăng ký ( xảy ra khi thêm 1 loại giấy tờ mới, sẽ ghép trên ứng với từng loại hình thức đăng ký)
IF OBJECT_ID ('AddLoai_DangKi','TR') IS NOT NULL
	DROP TRIGGER AddLoai_DangKi;
GO
CREATE TRIGGER AddLoai_DangKi ON LOAI_GIAYTO
AFTER INSERT
AS
	declare @new int, @newName nvarchar(50)
	select @new=ne.LOAI_GIAYTO_ID, @newName = ne.LOAI_GIAYTO_TEN
	from inserted ne

	DECLARE cursorHinhThuc CURSOR FOR
	SELECT * FROM HINHTHUC_DANGKY
	DECLARE @Id int, @Name nvarchar(50)
	OPEN cursorHinhThuc
	FETCH NEXT FROM cursorHinhThuc INTO @Id, @Name
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO LOAI_DANGKY VALUES (@new,@Id,CONCAT(@newName,' - ', @Name),2,10000)
		FETCH NEXT FROM cursorHinhThuc INTO @Id, @Name
	END
	CLOSE cursorHinhThuc
	DEALLOCATE cursorHinhThuc
GO

--3 Đổi trạng thái xử lý khi hồ sơ đăng ký đã được thêm vào hộ tịch
IF OBJECT_ID ('ChangeTRANGTHAI_XULY','TR') IS NOT NULL
	DROP TRIGGER ChangeTRANGTHAI_XULY;
GO
CREATE TRIGGER ChangeTRANGTHAI_XULY ON GIAY_HOTICH
AFTER INSERT
AS
	declare @hosodangky_id int
	select @hosodangky_id=ne.HOSO_DANGKY_ID
	from inserted ne
	UPDATE HOSO_DANGKY
	SET TRANGTHAI_XULY_ID = (SELECT TRANGTHAI_XULY_ID
							 FROM TRANGTHAI_XULY
							 WHERE TRANGTHAI_XULY_TEN LIKE N'Đã xử lý')
	WHERE HOSO_DANGKY_ID = @hosodangky_id
GO

-- 4 Khi thêm hồ sơ đăng ký khai sinh vào giấy khai sinh
DROP PROC Add_Giay_Khaisinh
CREATE PROC Add_Giay_KhaiSinh @maHS_DK int,@nguoi_xuly int, @nguoi_ky int
AS
	DECLARE @flag int
	SELECT @flag =  TRANGTHAI_XULY_ID
	FROM HOSO_DANGKY
	WHERE HOSO_DANGKY_ID = @maHS_DK
	if(@flag = 1)
	BEGIN
	DECLARE @hoten nvarchar(255)
			, @gioitinh bit
			, @ngaysinh date
			, @noisinh nvarchar(100)
			, @noisinh_quocgia nvarchar(50)
			, @noisinh_thanhpho nvarchar(50)
			, @noisinh_quan nvarchar(50)
			, @noisinh_phuong nvarchar(50)
			, @noisinh_diachi nvarchar(50)
			, @dantoc nvarchar(50)
			, @quoctich nvarchar(50)
			, @cha_ID int
			, @me_ID int
			, @quequan nvarchar(50)
			, @diachi_thanhpho nvarchar(50)
			, @diachi_quan nvarchar(50)
			, @diachi_phuong nvarchar(50)
			, @diachi_chitiet nvarchar(255)
			, @congdan_id int
	DECLARE @coQuanID int
	DECLARE @soquyen nvarchar(10)
	DECLARE @magiay nvarchar(10)
	DECLARE @loaigiay int
	
	SELECT @loaigiay = LOAI_GIAYTO_ID
	FROM LOAI_GIAYTO
	WHERE LOAI_GIAYTO_TEN LIKE N'%khai sinh%'

	DECLARE @month int
	SET @month = MONTH(GETDATE())
	IF @month < 10
		SET @soquyen = CONCAT('KS-T0', @month)
	ELSE
		SET @soquyen = CONCAT('KS-T', @month)
	DECLARE @ma int
	SELECT @ma = COUNT(*) +1
	FROM (
		   SELECT *
		   FROM GIAY_HOTICH
		   WHERE LOAI_GIAYTO_ID = @loaigiay
		   ) as ks
	WHERE ks.GIAY_HOTICH_SOQUYEN = @soquyen
	GROUP BY GIAY_HOTICH_SOQUYEN
	IF @ma is null
		SET @ma = 1
	IF @ma < 10
		SET @magiay = CONCAT('KS000', @ma)
	ELSE
		IF @ma < 100
			SET @magiay = CONCAT('KS00', @ma)
		ELSE
			IF @ma < 1000
				SET @magiay = CONCAT('KS0', @ma)
			ELSE
				SET @magiay = CONCAT('KH', @ma)
	SELECT 
			@coQuanID = hsdk.COQUAN_ID
			,@hoten = ks.KHAISINH_TEN
			,@gioitinh = ks.KHAISINH_GIOITINH
			,@ngaysinh = ks.KHAISINH_NGAYSINH
			,@noisinh = ks.KHAISINH_NOISINH
			,@noisinh_quocgia = ks.KHAISINH_NOISINH_QUOCGIA
			,@noisinh_thanhpho = ks.KHAISINH_NOISINH_THANHPHO
			,@noisinh_quan = ks.KHAISINH_NOISINH_QUAN
			,@noisinh_phuong = ks.KHAISINH_NOISINH_PHUONG
			,@noisinh_diachi = ks.KHAISINH_NOISINH_DIACHI
			,@dantoc = ks.KHAISINH_DANTOC
			,@quoctich = ks.KHAISINH_QUOCTICH
			,@quequan = ks.KHAISINH_QUEQUAN_THANHPHO
			,@diachi_thanhpho = ks.KHAISINH_QUEQUAN_THANHPHO
			,@diachi_quan = ks.KHAISINH_QUEQUAN_QUAN
			,@diachi_phuong = ks.KHAISINH_QUEQUAN_PHUONG
			,@diachi_chitiet = ks.KHAISINH_QUEQUAN_DIACHI
			,@cha_ID = cha.CONGDAN_ID
			,@me_ID = me.CONGDAN_ID
	FROM DANGKY_KHAISINH ks,CONGDAN cha, CONGDAN me,HOSO_DANGKY hsdk
	WHERE ks.HOSO_DANGKY_ID = @maHS_DK 
	AND ks.CHA_CMND = cha.CONGDAN_CMND
	AND ks.ME_CMND = me.CONGDAN_CMND
	AND ks.HOSO_DANGKY_ID = hsdk.HOSO_DANGKY_ID
	INSERT INTO CONGDAN
	VALUES (
		@hoten
		,@ngaysinh
		,@gioitinh
		,@quequan
		,@quoctich
		,@dantoc
		,NULL
		,NULL
		,NULL
		,@diachi_thanhpho
		,@diachi_quan
		,@diachi_phuong
		,@diachi_chitiet
		,NULL
		,1
	)
	SELECT @congdan_id = @@IDENTITY 

	INSERT INTO GIAY_KHAISINH
	VALUES (
		@congdan_id
		,@noisinh
		,@noisinh_quocgia
		,@noisinh_thanhpho
		,@noisinh_quan
		,@noisinh_phuong
		,@noisinh_diachi
		,@cha_ID
		,@me_ID
	)

	DECLARE @giayto_id int
	SELECT @giayto_id = @@IDENTITY 

	INSERT INTO GIAY_HOTICH
	VALUES (
		@giayto_id
		,@maHS_DK
		,@coQuanID
		,@loaigiay
		,@magiay
		,@soquyen
		,GETDATE()
		,@nguoi_xuly
		,@nguoi_ky
	)
	END
	ELSE
		RAISERROR ('Đã thêm rồi',16,10);
GO
EXEC Add_Giay_Khaisinh 1,1,1
SELECT *
FROM GIAY_HOTICH
SELECT *
FROM HOSO_DANGKY
SELECT *
FROM GIAY_KHAISINH
SELECT *
FROM CONGDAN
GO
-- 5 Khi thêm hồ sơ đăng ký kết hôn vào giấy kết hôn
DROP PROC Add_Giay_Kethon
CREATE PROC Add_Giay_Kethon @maHS_DK int,@nguoi_xuly int, @nguoi_ky int
AS
	DECLARE @flag int
	SELECT @flag = TRANGTHAI_XULY_ID
	FROM HOSO_DANGKY
	WHERE HOSO_DANGKY_ID = @maHS_DK
	if(@flag = 1)
	BEGIN
		DECLARE @vo_ID int
				,@chong_ID int
		DECLARE @coQuanID int
		DECLARE @soquyen nvarchar(10)
		DECLARE @magiay nvarchar(10)
		DECLARE @loaigiay int

		SELECT @loaigiay = LOAI_GIAYTO_ID
		FROM LOAI_GIAYTO
		WHERE LOAI_GIAYTO_TEN LIKE N'%kết hôn%'

		DECLARE @month int
		SET @month = MONTH(GETDATE())
		IF @month < 10
			SET @soquyen = CONCAT('KH-T0', @month)
		ELSE
			SET @soquyen = CONCAT('KH-T', @month)
		DECLARE @ma int
		SELECT @ma = COUNT(*) +1
		FROM (
			   SELECT *
			   FROM GIAY_HOTICH
			   WHERE LOAI_GIAYTO_ID = @loaigiay
			   ) as kh
		WHERE kh.GIAY_HOTICH_SOQUYEN = @soquyen
		GROUP BY GIAY_HOTICH_SOQUYEN
		IF @ma is null
			SET @ma = 1
		IF @ma < 10
			SET @magiay = CONCAT('KH000', @ma)
		ELSE
			IF @ma < 100
				SET @magiay = CONCAT('KH00', @ma)
			ELSE
				IF @ma < 1000
					SET @magiay = CONCAT('KH0', @ma)
				ELSE
					SET @magiay = CONCAT('KH', @ma)

		SELECT 
				@coQuanID = hsdk.COQUAN_ID
				,@vo_ID = vo.CONGDAN_ID
				,@chong_ID = chong.CONGDAN_ID
		FROM DANGKY_KETHON kh
			,HOSO_DANGKY hsdk
			,CONGDAN vo
			, CONGDAN chong
		WHERE kh.HOSO_DANGKY_ID = @maHS_DK 
		AND KETHON_C_CMND = chong.CONGDAN_CMND
		AND KETHON_V_CMND = vo.CONGDAN_CMND
		AND hsdk.HOSO_DANGKY_ID = kh.HOSO_DANGKY_ID 


		INSERT INTO GIAY_KETHON
		VALUES (
			@vo_ID
			,@chong_ID
		)

		DECLARE @giayto_id int
		SELECT @giayto_id = @@IDENTITY 

		INSERT INTO GIAY_HOTICH
		VALUES (
			@giayto_id
			,@maHS_DK
			,@coQuanID
			,@loaigiay
			,@magiay
			,@soquyen
			,GETDATE()
			,@nguoi_xuly
			,@nguoi_ky
		)
	END
	ELSE
		RAISERROR ('Đã thêm rồi',16,10);
GO
EXEC Add_Giay_Kethon 2,1,1
SELECT *
FROM GIAY_HOTICH
SELECT *
FROM GIAY_KETHON
SELECT *
FROM CONGDAN
GO

-- 6 Cập nhật trạng thái kết hôn của công dân
IF OBJECT_ID ('Update_CongDan_KetHon','TR') IS NOT NULL
	DROP TRIGGER Update_CongDan_KetHon;
GO
CREATE TRIGGER Update_CongDan_KetHon ON GIAY_KETHON
AFTER INSERT
AS
	declare @newID int, @chong_ID int, @vo_ID int
	select @newID = ne.GIAY_KETHON_ID, @chong_ID = ne.CHONG_ID, @vo_ID = ne.VO_ID
	from inserted ne

	UPDATE CONGDAN
	SET CONGDAN_TINHTRANG_HONNHAN = @newID
	WHERE CONGDAN_ID = @chong_ID

	UPDATE CONGDAN
	SET CONGDAN_TINHTRANG_HONNHAN = @newID
	WHERE CONGDAN_ID = @vo_ID
GO

-- 7 Khi thêm hồ sơ đăng ký kết hôn vào giấy kết hôn
DROP PROC Add_Giay_Chungtu
CREATE PROC Add_Giay_Chungtu @maHS_DK int,@nguoi_xuly int, @nguoi_ky int
AS
	DECLARE @flag int
	SELECT @flag = TRANGTHAI_XULY_ID
	FROM HOSO_DANGKY
	WHERE HOSO_DANGKY_ID = @maHS_DK
	if(@flag = 1)
	BEGIN
		DECLARE @congdan_ID int
				,@nguyennhan nvarchar(255)
				,@ngaymat date
				,@thoigianmat time
				,@noimat_quocgia nvarchar(50)
				,@noimat_thanhpho nvarchar(50)
				,@noimat_quan nvarchar(50)
				,@noimat_phuong nvarchar(50)
				,@noimat_diachi nvarchar(255)
		DECLARE @coQuanID int
		DECLARE @soquyen nvarchar(10)
		DECLARE @magiay nvarchar(10)
		DECLARE @loaigiay int

		SELECT @loaigiay = LOAI_GIAYTO_ID
		FROM LOAI_GIAYTO
		WHERE LOAI_GIAYTO_TEN LIKE N'%chứng tử%'

		DECLARE @month int
		SET @month = MONTH(GETDATE())
		IF @month < 10
			SET @soquyen = CONCAT('CT-T0', @month)
		ELSE
			SET @soquyen = CONCAT('CT-T', @month)
		DECLARE @ma int
		SELECT @ma = COUNT(*) + 1
		FROM (
			   SELECT *
			   FROM GIAY_HOTICH
			   WHERE LOAI_GIAYTO_ID = @loaigiay
			   ) AS CT
		WHERE CT.GIAY_HOTICH_SOQUYEN = @soquyen
		GROUP BY GIAY_HOTICH_SOQUYEN
		IF @ma is null
			SET @ma = 1
		IF @ma < 10
			SET @magiay = CONCAT('CT000', @ma)
		ELSE
			IF @ma < 100
				SET @magiay = CONCAT('CT00', @ma)
			ELSE
				IF @ma < 1000
					SET @magiay = CONCAT('CT0', @ma)
				ELSE
					SET @magiay = CONCAT('CT', @ma)
		SELECT 
				@coQuanID = COQUAN_ID
				,@congdan_ID = cd.CONGDAN_ID
				,@nguyennhan = KHAITU_NGUYENNHAN
				,@ngaymat = KHAITU_NGAYMAT
				,@thoigianmat = KHAITU_THOIGIAN
				,@noimat_quocgia = KHAITU_NOIMAT_QUOCGIA
				,@noimat_thanhpho = KHAITU_NOIMAT_THANHPHO
				,@noimat_quan = KHAITU_NOIMAT_QUAN
				,@noimat_phuong = KHAITU_NOIMAT_PHUONG
				,@noimat_diachi = KHAITU_NOIMAT_DIACHI
		FROM DANGKY_CHUNGTU ct
			,HOSO_DANGKY hsdk
			,CONGDAN cd
		WHERE ct.HOSO_DANGKY_ID = @maHS_DK 
		AND KHAITU_CMND = cd.CONGDAN_CMND
		AND hsdk.HOSO_DANGKY_ID = ct.HOSO_DANGKY_ID

		INSERT INTO GIAY_CHUNGTU
		VALUES (
			@congdan_ID
			,@ngaymat
			,@thoigianmat
			,@noimat_quocgia
			,@noimat_thanhpho
			,@noimat_quan
			,@noimat_phuong
			,@noimat_diachi
			,@nguyennhan
		)

		DECLARE @giayto_id int
		SELECT @giayto_id = @@IDENTITY 

		INSERT INTO GIAY_HOTICH
		VALUES (
			@giayto_id
			,@maHS_DK
			,@coQuanID
			,@loaigiay
			,@magiay
			,@soquyen
			,GETDATE()
			,@nguoi_xuly
			,@nguoi_ky
		)
	END
	ELSE
		RAISERROR ('Đã thêm rồi',16,10);
GO
EXEC Add_Giay_Chungtu 3,1,1
SELECT *
FROM GIAY_HOTICH
SELECT *
FROM GIAY_CHUNGTU
SELECT *
FROM CONGDAN
GO

--8 Cập nhật trạng thái còn sống của công dân
IF OBJECT_ID ('Update_CongDan_Chungtu','TR') IS NOT NULL
	DROP TRIGGER Update_CongDan_Chungtu;
GO
CREATE TRIGGER Update_CongDan_Chungtu ON GIAY_CHUNGTU
AFTER INSERT
AS
	declare @congdan_ID int
	select @congdan_ID = ne.CONGDAN_ID
	from inserted ne

	UPDATE CONGDAN
	SET CONGDAN_CONSONG = 0
	WHERE CONGDAN_ID = @congdan_ID
GO


SELECT *
FROM HOSO_DANGKY

-- 8 Tiềm kiếm giấy hộ tịch theo mã giấy và số quyển
DROP PROC TimKiem_HoTich
CREATE PROC TimKiem_HoTich @ma nvarchar(10), @soquyen nvarchar(10)
AS
	BEGIN
	DECLARE @id int
		IF @ma LIKE '%KS%'
		BEGIN
			SELECT @id = GIAYTO_ID
			FROM (
					SELECT GIAY_HOTICH_MA,GIAYTO_ID
					FROM (
							SELECT *
							FROM GIAY_HOTICH
							WHERE LOAI_GIAYTO_ID = (SELECT LOAI_GIAYTO_ID
													FROM LOAI_GIAYTO
													WHERE LOAI_GIAYTO_TEN LIKE N'%khai sinh%'
													)) AS HTKS
					WHERE GIAY_HOTICH_SOQUYEN = @soquyen) AS KS
			WHERE GIAY_HOTICH_MA = @ma
			SELECT *
			FROM Get_Giay_KhaiSinh (@id)
			RETURN
		END
		IF @ma LIKE '%KH%'
		BEGIN
			SELECT @id = GIAYTO_ID
			FROM (
					SELECT GIAY_HOTICH_MA,GIAYTO_ID
					FROM (
							SELECT *
							FROM GIAY_HOTICH
							WHERE LOAI_GIAYTO_ID = (
													SELECT LOAI_GIAYTO_ID
													FROM LOAI_GIAYTO
													WHERE LOAI_GIAYTO_TEN LIKE N'%kết hôn%')) AS HTKH
					WHERE GIAY_HOTICH_SOQUYEN = @soquyen) AS KH
			WHERE GIAY_HOTICH_MA = @ma
			SELECT *
			FROM Get_Giay_KetHon(@id)
			RETURN
		END
		IF @ma LIKE '%CT%'
		BEGIN
			SELECT @id = GIAYTO_ID
			FROM (
					SELECT GIAY_HOTICH_MA,GIAYTO_ID
					FROM (
							SELECT *
							FROM GIAY_HOTICH
							WHERE LOAI_GIAYTO_ID = (
													SELECT LOAI_GIAYTO_ID
													FROM LOAI_GIAYTO
													WHERE LOAI_GIAYTO_TEN LIKE N'%chứng tử%'
													)) AS HTCT
					WHERE GIAY_HOTICH_SOQUYEN = @soquyen) AS CT
			WHERE GIAY_HOTICH_MA = @ma
			SELECT *
			FROM Get_Giay_ChungTu(@id)
			RETURN
		END
	END

EXEC TimKiem_HoTich 'KS0001','KS-T11'
EXEC TimKiem_HoTich 'KH0001','KH-T11'
EXEC TimKiem_HoTich 'CT0001','CT-T11'

-- 9 Lấy 1 giấy khai sinh từ ID
DROP FUNCTION Get_Giay_KhaiSinh
CREATE FUNCTION Get_Giay_KhaiSinh ( @id int = 0)
RETURNS @table table (
					LOAI_GIAYTO_ID INT
					, MA NVARCHAR(10)
					, SOQUYEN NVARCHAR(10)
					, CONGDAN_HOTEN NVARCHAR(255)
					, CONGDAN_GIOITINH NVARCHAR(10)
					, CONGDAN_NGAYSINH DATE
					, CONGDAN_NOISINH NVARCHAR(255)
					, CONGDAN_DANTOC NVARCHAR(50)
					, CONGDAN_QUOCTICH NVARCHAR(50)
					, CHA_HOVATEN NVARCHAR(255)
					, CHA_DANTOC NVARCHAR(50)
					, CHA_QUOCTICH NVARCHAR(50)
					, ME_HOVATEN NVARCHAR(255)
					, ME_DANTOC NVARCHAR(50)
					, ME_QUOCTICH NVARCHAR(50)
					, NGAY_KI DATETIME
					, NGUOI_XULY_HOTEN NVARCHAR(100)
					, nguoi_ky_HOTEN NVARCHAR(100)
					)
AS
	BEGIN
		INSERT @table 
			SELECT 
				GKS.LOAI_GIAYTO_ID
				, GKS.GIAY_HOTICH_MA
				, GKS.GIAY_HOTICH_SOQUYEN
				, CON.CONGDAN_HOVATEN
				, CASE CON.CONGDAN_GIOITINH
					WHEN 0 THEN 'NAM'
					WHEN 1 THEN 'NỮ'
				  END
				, CON.CONGDAN_NGAYSINH
				, GKS.GIAY_KHAISINH_NOISINH
				, CON.CONGDAN_DANTOC
				, CON.CONGDAN_QUOCTICH
				, CHA.CONGDAN_HOVATEN
				, CHA.CONGDAN_DANTOC
				, CHA.CONGDAN_QUOCTICH
				, ME.CONGDAN_HOVATEN
				, ME.CONGDAN_DANTOC
				, ME.CONGDAN_QUOCTICH
				, GKS.GIAY_HOTICH_NGAY_KY
				, NGUOI_XULY.NGUOIDUNG_HOVATEN
				, NGUOI_KY.NGUOIDUNG_HOVATEN
			FROM 
				(
					SELECT *
					FROM GIAY_KHAISINH , (
													SELECT *
													FROM GIAY_HOTICH
													WHERE LOAI_GIAYTO_ID = (
																			SELECT LOAI_GIAYTO_ID
																			FROM LOAI_GIAYTO
																			WHERE LOAI_GIAYTO_TEN LIKE N'%khai sinh%'
																			)
													) AS HT
					WHERE GIAY_KHAISINH_ID = @id AND GIAY_KHAISINH_ID = HT.GIAYTO_ID
				) AS GKS
				INNER JOIN CONGDAN AS CON ON CON.CONGDAN_ID = GKS.CONGDAN_ID
				INNER JOIN CONGDAN AS CHA ON CHA.CONGDAN_ID = GKS.CHA_ID
				INNER JOIN CONGDAN AS ME ON ME.CONGDAN_ID = GKS.ME_ID
				INNER JOIN NGUOIDUNG AS NGUOI_XULY ON NGUOI_XULY.NGUOIDUNG_ID = GKS.GIAY_HOTICH_NGUOI_XULY
				INNER JOIN NGUOIDUNG AS NGUOI_KY ON NGUOI_KY.NGUOIDUNG_ID = GKS.GIAY_HOTICH_NGUOI_KY
		RETURN
	END
SELECT * FROM Get_Giay_KhaiSinh (1)

-- 10 Lấy 1 giấy kết hôn từ hộ tịch
DROP FUNCTION Get_Giay_KetHon
CREATE FUNCTION Get_Giay_KetHon ( @id int = 0)
RETURNS @table table (
					LOAI_GIAYTO_ID INT
					, MA NVARCHAR(10)
					, SOQUYEN NVARCHAR(10)
					, VO_HOTEN NVARCHAR(255)
					, VO_NGAYSINH DATE
					, VO_DANTOC NVARCHAR(50)
					, VO_QUOCTICH NVARCHAR(50)
					, VO_THANHPHO NVARCHAR(100)
					, VO_QUAN NVARCHAR(100)
					, VO_PHUONG NVARCHAR(100)
					, VO_DIACHI NVARCHAR(255)
					, VO_CMND NVARCHAR(20)
					, VO_CMND_NGAYCAP DATE
					, VO_CMND_NOICAP NVARCHAR(255)
					, CHONG_HOTEN NVARCHAR(255)
					, CHONG_NGAYSINH DATE
					, CHONG_DANTOC NVARCHAR(50)
					, CHONG_QUOCTICH NVARCHAR(50)
					, CHONG_THANHPHO NVARCHAR(100)
					, CHONG_QUAN NVARCHAR(100)
					, CHONG_PHUONG NVARCHAR(100)
					, CHONG_DIACHI NVARCHAR(255)
					, CHONG_CMND NVARCHAR(20)
					, CHONG_CMND_NGAYCAP DATE
					, CHONG_CMND_NOICAP NVARCHAR(255)
					, NGAY_KI DATETIME
					, NGUOI_XULY_HOTEN NVARCHAR(100)
					, nguoi_ky_HOTEN NVARCHAR(100)
					)
AS
	BEGIN
		INSERT @table 
			SELECT 
				GKH.LOAI_GIAYTO_ID
				, GKH.GIAY_HOTICH_MA
				, GKH.GIAY_HOTICH_SOQUYEN
				, VO.CONGDAN_HOVATEN
				, VO.CONGDAN_NGAYSINH
				, VO.CONGDAN_DANTOC
				, VO.CONGDAN_QUOCTICH
				, VO.CONGDAN_THANHPHO
				, VO.CONGDAN_QUAN
				, VO.CONGDAN_PHUONG
				, VO.CONGDAN_DIACHI
				, VO.CONGDAN_CMND
				, VO.CONGDAN_CMND_NGAYCAP
				, VO.CONGDAN_CMND_NOICAP
				, CHONG.CONGDAN_HOVATEN
				, CHONG.CONGDAN_NGAYSINH
				, CHONG.CONGDAN_DANTOC
				, CHONG.CONGDAN_QUOCTICH
				, CHONG.CONGDAN_THANHPHO
				, CHONG.CONGDAN_QUAN
				, CHONG.CONGDAN_PHUONG
				, CHONG.CONGDAN_DIACHI
				, CHONG.CONGDAN_CMND
				, CHONG.CONGDAN_CMND_NGAYCAP
				, CHONG.CONGDAN_CMND_NOICAP
				, GKH.GIAY_HOTICH_NGAY_KY
				, NGUOI_XULY.NGUOIDUNG_HOVATEN
				, NGUOI_KY.NGUOIDUNG_HOVATEN
			FROM 
				(
					SELECT *
					FROM GIAY_KETHON, (
										SELECT *
										FROM GIAY_HOTICH
										WHERE LOAI_GIAYTO_ID = (
																SELECT LOAI_GIAYTO_ID
																FROM LOAI_GIAYTO
																WHERE LOAI_GIAYTO_TEN LIKE N'%kết hôn%'
																)
                					  ) AS HT
					WHERE GIAY_KETHON_ID = @id AND GIAY_KETHON_ID = HT.GIAYTO_ID
				) AS GKH
				INNER JOIN CONGDAN AS VO ON VO.CONGDAN_ID = GKH.VO_ID
				INNER JOIN CONGDAN AS CHONG ON CHONG.CONGDAN_ID = GKH.CHONG_ID
				INNER JOIN NGUOIDUNG AS NGUOI_XULY ON NGUOI_XULY.NGUOIDUNG_ID = GKH.GIAY_HOTICH_NGUOI_XULY
				INNER JOIN NGUOIDUNG AS NGUOI_KY ON NGUOI_KY.NGUOIDUNG_ID = GKH.GIAY_HOTICH_NGUOI_KY
		RETURN
	END
SELECT * FROM Get_Giay_KetHon (1)


--11 Lấy 1 giấy chứng tử từ hộ tịch
DROP FUNCTION Get_Giay_ChungTu
CREATE FUNCTION Get_Giay_ChungTu ( @id int = 0)
RETURNS @table table (
					LOAI_GIAYTO_ID INT
					, MA NVARCHAR(10)
					, SOQUYEN NVARCHAR(10)
					, HOTEN NVARCHAR(255)
					, NGAYSINH DATE
					, DANTOC NVARCHAR(50)
					, QUOCTICH NVARCHAR(50)
					, THANHPHO NVARCHAR(100)
					, QUAN NVARCHAR(100)
					, PHUONG NVARCHAR(100)
					, DIACHI NVARCHAR(255)
					, CMND NVARCHAR(20)
					, CMND_NGAYCAP DATE
					, CMND_NOICAP NVARCHAR(255)
					, NGAYMAT DATE
					, THOIGIANMAT TIME
					, NOIMAT_QUOCGIA NVARCHAR(50)
					, NOIMAT_THANHPHO NVARCHAR(50)
					, NOIMAT_QUAN NVARCHAR(50)
					, NOIMAT_PHUONG NVARCHAR(50)
					, NOIMAT_DIACHI NVARCHAR(255)
					, NGUYENNHAN NVARCHAR(255)
					, NGAY_KI DATETIME
					, NGUOI_XULY_HOTEN NVARCHAR(100)
					, NGUOI_KY_HOTEN NVARCHAR(100))
AS
	BEGIN
		INSERT @table 
			SELECT 
				GCT.LOAI_GIAYTO_ID
				, GCT.GIAY_HOTICH_MA
				, GCT.GIAY_HOTICH_SOQUYEN
				, NGUOIMAT.CONGDAN_HOVATEN
				, NGUOIMAT.CONGDAN_NGAYSINH
				, NGUOIMAT.CONGDAN_DANTOC
				, NGUOIMAT.CONGDAN_QUOCTICH
				, NGUOIMAT.CONGDAN_THANHPHO
				, NGUOIMAT.CONGDAN_QUAN
				, NGUOIMAT.CONGDAN_PHUONG
				, NGUOIMAT.CONGDAN_DIACHI
				, NGUOIMAT.CONGDAN_CMND
				, NGUOIMAT.CONGDAN_CMND_NGAYCAP
				, NGUOIMAT.CONGDAN_CMND_NOICAP
				, GCT.GIAY_CHUNGTU_NGAYMAT
				, GCT.GIAY_CHUNGTU_THOIGIAN
				, GCT.GIAY_CHUNGTU_NOIMAT_QUOCGIA
				, GCT.GIAY_CHUNGTU_NOIMAT_THANHPHO
				, GCT.GIAY_CHUNGTU_NOIMAT_QUAN
				, GCT.GIAY_CHUNGTU_NOIMAT_PHUONG
				, GCT.GIAY_CHUNGTU_NOIMAT_DIACHI
				, GCT.GIAY_CHUNGTU_NGUYENNHAN
				, GCT.GIAY_HOTICH_NGAY_KY
				, NGUOI_XULY.NGUOIDUNG_HOVATEN
				, NGUOI_KY.NGUOIDUNG_HOVATEN
			FROM 
				(
					SELECT *
					FROM GIAY_CHUNGTU, (
										SELECT *
										FROM GIAY_HOTICH
										WHERE LOAI_GIAYTO_ID = (
																SELECT LOAI_GIAYTO_ID
																FROM LOAI_GIAYTO
																WHERE LOAI_GIAYTO_TEN LIKE N'%chứng tử%'
																)
                					  ) AS HT
					WHERE GIAY_CHUNGTU_ID = @id AND GIAY_CHUNGTU_ID = HT.GIAYTO_ID
				) AS GCT
				INNER JOIN CONGDAN AS NGUOIMAT ON NGUOIMAT.CONGDAN_ID = GCT.CONGDAN_ID
				INNER JOIN NGUOIDUNG AS NGUOI_XULY ON NGUOI_XULY.NGUOIDUNG_ID = GCT.GIAY_HOTICH_NGUOI_XULY
				INNER JOIN NGUOIDUNG AS NGUOI_KY ON NGUOI_KY.NGUOIDUNG_ID = GCT.GIAY_HOTICH_NGUOI_KY
		RETURN
	END

SELECT * FROM Get_Giay_ChungTu (3)

--12 Tạo view chứa tất cả hồ sơ đăng ký chưa xử lý
DROP VIEW ALL_HSDK
CREATE VIEW ALL_HSDK AS
		SELECT HOSO_DANGKY_ID,LOAI_DANGKY_TEN,HOSO_DANGKY_MA,HOSO_DANGKY_NGAY_DANGKY,HOSO_DANGKY_NGAY_HETHAN,COQUAN_ID,LOAI_GIAYTO_ID
		FROM HOSO_DANGKY
		INNER JOIN LOAI_DANGKY ON HOSO_DANGKY.LOAI_DANGKY_ID = LOAI_DANGKY.LOAI_DANGKY_ID
		WHERE TRANGTHAI_XULY_ID = ( SELECT TRANGTHAI_XULY_ID
									FROM TRANGTHAI_XULY
									WHERE TRANGTHAI_XULY_TEN like N'Chưa xử lý')

--13 hàm lấy tất cả hồ sơ đăng ký chưa xử lý của 1 cơ quan
DROP PROC GET_HSDK_COQUAN
CREATE PROC GET_HSDK_COQUAN @maCoQuan int
AS
	SELECT *
	FROM ALL_HSDK
	WHERE COQUAN_ID = @maCoQuan
	ORDER BY HOSO_DANGKY_NGAY_HETHAN

EXEC GET_HSDK_COQUAN 1 

--14 hàm lấy tất cả hồ sơ đăng ký chưa xử lý của 1 loại giấy tờ nào đó của 1 cơ quan
DROP PROC GET_HSDK_COQUAN_TUNGLOAI
CREATE PROC GET_HSDK_COQUAN_TUNGLOAI @maCoQuan int,@loaiGiayTo int
AS
	SELECT *
	FROM ALL_HSDK
	WHERE COQUAN_ID = @maCoQuan AND LOAI_GIAYTO_ID = @loaiGiayTo
	ORDER BY HOSO_DANGKY_NGAY_HETHAN

EXEC GET_HSDK_COQUAN_TUNGLOAI 1,1

--15
DROP PROC GET_HOTICH_COQUAN
CREATE PROC GET_HOTICH_COQUAN @maCoQuan int
AS
	SELECT *
	FROM GIAY_HOTICH
	WHERE COQUAN_ID = @maCoQuan
	ORDER BY GIAY_HOTICH_NGAY_KY DESC

EXEC GET_HOTICH_COQUAN 1
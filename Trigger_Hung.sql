USE CSDL_QLHT_Test
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

		INSERT INTO LOAI_DANGKY VALUES (@new,@Id,CONCAT(@newName,' - ', @Name))

		FETCH NEXT FROM cursorHinhThuc INTO @Id, @Name
	END
	CLOSE cursorHinhThuc
	DEALLOCATE cursorHinhThuc
GO

DROP PROC Add_Giay_Khaisinh
CREATE PROC Add_Giay_Khaisinh @maHS_DK int,@nguoi_xuli int, @nguoi_ki int
AS
	DECLARE @hoten nvarchar(255)
			, @gioitinh bit
			, @ngaysinh date
			, @noisinh nvarchar(255)
			, @dantoc nvarchar(50)
			, @quoctich nvarchar(50)
			, @cha_ID int
			, @me_ID int
			, @quequan nvarchar(255)
			, @diachi_quocgia nvarchar(100)
			, @diachi_thanhpho nvarchar(100)
			, @diachi_quan nvarchar(100)
			, @diachi_phuong nvarchar(100)
			, @diachi_chitiet nvarchar(100)
	DECLARE @soquyen nvarchar(10)
	DECLARE @magiay nvarchar(10)

	DECLARE @month int
	SET @month = MONTH(GETDATE())
	IF @month < 10
		SET @soquyen = CONCAT('KS-T0', @month)
	ELSE
		SET @soquyen = CONCAT('KS-T', @month)
	DECLARE @ma int
	SELECT @ma = COUNT(*) +1
	FROM GIAY_KHAISINH ks
	WHERE ks.GIAY_KHAISINH_SOQUYEN = @soquyen
	GROUP BY GIAY_KHAISINH_SOQUYEN
	IF @ma < 10
		SET @magiay = CONCAT('KS000', @ma)
	ELSE
		IF @ma < 100
			SET @magiay = CONCAT('KS00', @ma)
		ELSE
			IF @ma < 1000
				SET @magiay = CONCAT('KS0', @ma)
			ELSE
				SET @magiay = CONCAT('KS', @ma)
	SELECT 
			@hoten = ks.KHAISINH_TEN
			,@gioitinh = ks.KHAISINH_GIOITINH
			,@ngaysinh = ks.KHAISINH_NGAYSINH
			,@noisinh = ks.KHAISINH_NOISINH
			,@dantoc = ks.KHAISINH_DANTOC
			,@quoctich = ks.KHAISINH_QUOCTICH
			,@quequan = ks.KHAISINH_QUEQUAN_THANHPHO
			,@diachi_quocgia = ks.KHAISINH_QUOCGIA
			,@diachi_thanhpho = ks.KHAISINH_THANHPHO
			,@diachi_quan = ks.KHAISINH_QUAN
			,@diachi_phuong = ks.KHAISINH_PHUONG
			,@diachi_chitiet = ks.KHAISINH_DIACHI
			,@cha_ID = cha.CONGDAN_ID
			,@me_ID = me.CONGDAN_ID
	FROM DANGKY_KHAISINH ks,CONGDAN cha, CONGDAN me
	WHERE ks.HOSO_DANGKY_ID = @maHS_DK 
	AND ks.CHA_CMND = cha.CONGDAN_CMND
	AND ks.ME_CMND = me.CONGDAN_CMND

	--SELECT @hoten, @gioitinh, @ngaysinh, @noisinh, @dantoc, @quoctich, @cha_ID, @me_ID, @quequan, @diachi_quocgia, @diachi_thanhpho, @diachi_quan, @diachi_phuong, @diachi_chitiet, @soquyen, @magiay

	INSERT INTO GIAY_KHAISINH
	VALUES (
		@magiay
		,@soquyen
		,@maHS_DK
		,@hoten
		,@gioitinh
		,@ngaysinh
		,@noisinh
		,@dantoc
		,@quoctich
		,@cha_ID
		,@me_ID
		,GETDATE()
		,@nguoi_xuli
		,@nguoi_ki
		,1
	)
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
		,@diachi_quocgia
		,@diachi_thanhpho
		,@diachi_quan
		,@diachi_phuong
		,@diachi_chitiet
		,NULL
		,1
	)
GO
EXEC Add_Giay_Khaisinh 1,1,1
SELECT *
FROM GIAY_KHAISINH
SELECT *
FROM CONGDAN
GO

CREATE PROC Add_Giay_Kethon @maHS_DK int,@nguoi_xuli int, @nguoi_ki int
AS
	DECLARE @vo_ID int
			,@chong_ID int
	DECLARE @soquyen nvarchar(10)
	DECLARE @magiay nvarchar(10)

	DECLARE @month int
	SET @month = MONTH(GETDATE())
	IF @month < 10
		SET @soquyen = CONCAT('KH-T0', @month)
	ELSE
		SET @soquyen = CONCAT('KH-T', @month)
	DECLARE @ma int
	SELECT @ma = COUNT(*) +1
	FROM GIAY_KHAISINH ks
	WHERE ks.GIAY_KHAISINH_SOQUYEN = @soquyen
	GROUP BY GIAY_KHAISINH_SOQUYEN
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
			@vo_ID = vo.CONGDAN_ID
			,@chong_ID = chong.CONGDAN_ID
	FROM HOSO_DANGKY dk,DANGKY_KETHON kh,CONGDAN vo, CONGDAN chong
	WHERE kh.HOSO_DANGKY_ID = @maHS_DK 
	AND kh.KETHON_C_CMND = chong.CONGDAN_CMND
	AND kh.KETHON_V_CMND = vo.CONGDAN_CMND


	INSERT INTO GIAY_KETHON
	VALUES (
		@magiay
		,@soquyen
		,@maHS_DK
		,@vo_ID
		,@chong_ID
		,GETDATE()
		,@nguoi_xuli
		,@nguoi_ki
		,2
	)
GO
EXEC Add_Giay_Kethon 1,1,1
SELECT *
FROM GIAY_KETHON
SELECT *
FROM CONGDAN
GO

IF OBJECT_ID ('Update_CongDan_Honnhan','TR') IS NOT NULL
	DROP TRIGGER Update_CongDan_Honnhan;
GO
CREATE TRIGGER Update_CongDan_Honnhan ON GIAY_KETHON
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





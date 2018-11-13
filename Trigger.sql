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

/*EXED => Thuc thi roi*/ 
CREATE PROCEDURE PROC_ADD_DANGKY_KHAISINH (  @HOSO_DANGKY_ID	int	
											,@NYC_TEN	nvarchar(100)	
											,@NYC_CMND	nvarchar(12)	
											,@NYC_CMND_NGAYCAP	date	
											,@NYC_CMND_NOICAP	nvarchar(255)	
											,@NYC_QUOCTICH	nvarchar(50)	
											,@NYC_THANHPHO	nvarchar(100)	
											,@NYC_QUAN	nvarchar(100)	
											,@NYC_PHUONG	nvarchar(100)	
											,@NYC_DIACHI	nvarchar(255)	
											,@NYC_QUANHE	nvarchar(255)	
											,@KS_TEN	nvarchar(255)	
											,@KS_GIOITINH	bit	
											,@KS_NGAYSINH	date	
											,@KS_DANTOC	nvarchar(50)	
											,@KS_QUOCTICH	nvarchar(50)	
											,@KS_QUEQUAN_QUOCGIA	nvarchar(50)	
											,@KS_QUEQUAN_THANHPHO	nvarchar(50)	
											,@KS_NOISINH	nvarchar(100)	
											,@KS_QUOCGIA	nvarchar(50)	
											,@KS_THANHPHO	nvarchar(50)	
											,@KS_QUAN	nvarchar(50)	
											,@KS_PHUONG	nvarchar(50)	
											,@ME_TEN	nvarchar(255)	
											,@ME_NGAYSINH	date	
											,@ME_DANTOC	nvarchar(50)	
											,@ME_CMND	nvarchar(12)	
											,@ME_CMND_NGAYCAP	date	
											,@ME_CMND_NOICAP	nvarchar(255)	
											,@ME_QUOCTICH	nvarchar(50)	
											,@ME_THANHPHO	nvarchar(100)	
											,@ME_QUAN	nvarchar(100)	
											,@ME_PHUONG	nvarchar(100)	
											,@ME_DIACHI	nvarchar(255)	
											,@CHA_TEN	nvarchar(255)	
											,@CHA_NGAYSINH	date	
											,@CHA_DANTOC	nvarchar(50)	
											,@CHA_CMND	nvarchar(12)	
											,@CHA_CMND_NGAYCAP	date	
											,@CHA_CMND_NOICAP	nvarchar(255)	
											,@CHA_QUOCTICH	nvarchar(50)	
											,@CHA_THANHPHO	nvarchar(100)	
											,@CHA_QUAN	nvarchar(100)	
											,@CHA_PHUONG	nvarchar(100)	
											,@CHA_DIACHI	nvarchar(255)	
											,@FILE_GIAYCHUNGSINH	nvarchar(255))
AS
	INSERT INTO DANGKY_KHAISINH
	VALUES( @HOSO_DANGKY_ID
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
			,@KS_QUEQUAN_QUOCGIA
			,@KS_QUEQUAN_THANHPHO
			,@KS_NOISINH
			,@KS_QUOCGIA
			,@KS_THANHPHO
			,@KS_QUAN
			,@KS_PHUONG
			,@ME_TEN
			,@ME_NGAYSINH
			,@ME_DANTOC
			,@ME_CMND
			,@ME_CMND_NGAYCAP
			,@ME_CMND_NOICAP
			,@ME_QUOCTICH
			,@ME_THANHPHO
			,@ME_QUAN
			,@ME_PHUONG
			,@ME_DIACHI
			,@CHA_TEN
			,@CHA_NGAYSINH
			,@CHA_DANTOC
			,@CHA_CMND
			,@CHA_CMND_NGAYCAP
			,@CHA_CMND_NOICAP
			,@CHA_QUOCTICH
			,@CHA_THANHPHO
			,@CHA_QUAN
			,@CHA_PHUONG
			,@CHA_DIACHI
			,@FILE_GIAYCHUNGSINH
)
GO
/*EXED*/
CREATE PROCEDURE PROC_ADD_DANGKY_KETHON(@HOSO_DANGKY_ID	int	
										,@KH_V_HOTEN	nvarchar(255)	
										,@KH_V_NGAYSINH	date	
										,@KH_V_DANTOC	nvarchar(50)	
										,@KH_V_CMND	nvarchar(12)	
										,@KH_V_CMND_NGAYCAP	date	
										,@KH_V_CMND_NOICAP	nvarchar(255)	
										,@KH_V_QUOCTICH	nvarchar(50)	
										,@KH_V_THANHPHO	nvarchar(100)	
										,@KH_V_QUAN	nvarchar(100)	
										,@KH_V_PHUONG	nvarchar(100)	
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
										,@KH_C_THANHPHO	nvarchar(100)	
										,@KH_C_QUAN	nvarchar(100)	
										,@KH_C_PHUONG	nvarchar(100)	
										,@KH_C_DIACHI	nvarchar(255)	
										,@KH_C_LAN	int	
										,@KH_FILE_C	nvarchar(255)	)
AS
       INSERT INTO DANGKY_KETHON
	   VALUES(	@HOSO_DANGKY_ID
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
GO
/*EXED*/
CREATE PROCEDURE PROC_ADD_DANGKY_CHUNGTU(@HOSO_DANGKY_ID	int	
,@NYC_TEN	nvarchar(255)	
,@NYC_CMND	nvarchar(12)	
,@NYC_CMND_NGAYCAP	date	
,@NYC_CMND_NOICAP	nvarchar(255)	
,@NYC_QUOCTICH	nvarchar(50)	
,@NYC_THANHPHO	nvarchar(100)	
,@NYC_QUAN	nvarchar(100)	
,@NYC_PHUONG	nvarchar(100)	
,@NYC_DIACHI	nvarchar(255)	
,@NYC_QUANHE	nvarchar(255)	
,@KT_TEN	nvarchar(100)	
,@KT_NGAYSINH	date	
,@KT_GIOITINH	bit	
,@KT_DANTOC	nvarchar(50)	
,@KT_CMND	nvarchar(12)	
,@KT_CMND_NGAYCAP	date	
,@KT_CMND_NOICAP	nvarchar(255)	
,@KT_QUOCTICH	nvarchar(50)	
,@KT_THANHPHO	nvarchar(100)	
,@KT_QUAN	nvarchar(100)	
,@KT_PHUONG	nvarchar(100)	
,@KT_DIACHI	nvarchar(255)	
,@KT_NGAYMAT	datetime	
,@KT_NOIMAT	nvarchar(255)	
,@KT_NGUYENNHAN	nvarchar(255)	
,@KT_TENGIAYBAOTU	nvarchar(255)	
,@KT_NGAYCAP	date	
,@KT_NOICAP	nvarchar(255)	
,@FILE_BAOTU_TEN	nvarchar(255)	)
AS
	INSERT INTO DANGKY_CHUNGTU
	VALUES(@HOSO_DANGKY_ID
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
,@KT_TEN
,@KT_NGAYSINH
,@KT_GIOITINH
,@KT_DANTOC
,@KT_CMND
,@KT_CMND_NGAYCAP
,@KT_CMND_NOICAP
,@KT_QUOCTICH
,@KT_THANHPHO
,@KT_QUAN
,@KT_PHUONG
,@KT_DIACHI
,@KT_NGAYMAT
,@KT_NOIMAT
,@KT_NGUYENNHAN
,@KT_TENGIAYBAOTU
,@KT_NGAYCAP
,@KT_NOICAP
,@FILE_BAOTU_TEN
)
GO
/*EXED*/
CREATE PROCEDURE PROC_ADD_DANGKY_TRICHLUC (@HOSO_DANGKY_ID	int	
,@NYC_TEN	nvarchar(255)	
,@NYC_CMND	nvarchar(12)	
,@NYC_CMND_NGAYCAP	date	
,@NYC_CMND_NOICAP	nvarchar(255)	
,@NYC_QUOCTICH	nvarchar(50)	
,@NYC_THANHPHO	nvarchar(100)	
,@NYC_QUAN	nvarchar(100)	
,@NYC_PHUONG	nvarchar(100)	
,@NYC_DIACHI	nvarchar(255)	
,@NYC_QUANHE	nvarchar(255)	
,@BS_TEN	nvarchar(255)	
,@BS_GTXN	nvarchar(255)	
,@BS_GTXN_NGAYCAP	date	
,@BS_GTXN_NOICAP	nvarchar(255)	
,@BS_QUOCTICH	nvarchar(50)	
,@BS_THANHPHO	nvarchar(100)	
,@BS_QUAN	nvarchar(100)	
,@BS_PHUONG	nvarchar(100)	
,@BS_DIACHI	nvarchar(255)	
,@LOAI_GIAYTO_ID	int	
,@BS_SOQUYEN	int	
,@BS_SO	int	
,@BS_SOLUONG	int	)
AS
	INSERT INTO DANGKY_TRICHLUC
	VALUES(@HOSO_DANGKY_ID
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
,@BS_TEN
,@BS_GTXN
,@BS_GTXN_NGAYCAP
,@BS_GTXN_NOICAP
,@BS_QUOCTICH
,@BS_THANHPHO
,@BS_QUAN
,@BS_PHUONG
,@BS_DIACHI
,@LOAI_GIAYTO_ID
,@BS_SOQUYEN
,@BS_SO
,@BS_SOLUONG
)
GO
/*EXED*/

/*Sau khi thảo luận xong. có thể sửa*/
CREATE PROCEDURE PROC_ADD_HOSO_DANGKY (@TenHoSo nvarchar(255), @CoQuanID int, @LoaiDangKyID int)
AS		
	DECLARE @NGAYDK DATETIME, @NGAYHETHAN DATETIME;
	SELECT @NGAYDK= GETDATE();	
	SELECT @NGAYHETHAN = DATEADD(day, 2, @NGAYDK)

	INSERT INTO dbo.HOSO_DANGKY (TRANGTHAI_XULI_ID, HOSO_DANGKY_TEN, HOSO_DANGKY_NGAY_DANGKY, HOSO_DANGKY_NGAY_HETHAN, COQUAN_ID, LOAI_DANGKY_ID)							   
	VALUES(1, @TenHoSo,@NGAYDK,@NGAYHETHAN,@CoQuanID,@LoaiDangKyID )
GO
		 
EXEC PROC_ADD_HOSO_DANGKY 'DANGKYKHAISINH',1,1


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

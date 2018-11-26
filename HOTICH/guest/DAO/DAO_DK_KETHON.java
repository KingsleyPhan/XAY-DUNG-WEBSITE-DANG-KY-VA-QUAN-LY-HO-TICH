package DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import Entities.KetHon.DangKyKetHon;
import Entities.KhaiSinh.DangKyKhaiSinh;

public class DAO_DK_KETHON extends ConnectDAO
{

	public DAO_DK_KETHON(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	 public boolean INSERT_DK_KETHON(int COQUAN_ID, int LOAI_DK_ID, DangKyKetHon DKKH) throws SQLException
	 {
		 Connection();
		 String StrSql = " EXEC ADD_HOSO_DANGKY_KETHON" +
										"			?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?" + 
								 		"			,?";
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setInt(1,1); //Trạng Thái: 1 là trạng thái chưa xử lý
		 statement.setInt(2, COQUAN_ID);
		 statement.setInt(3, LOAI_DK_ID);
		 
		 statement.setString(4,DKKH.getVO().getHOTEN());
		 statement.setDate(5, DKKH.getVO().getNGAYSINH());
		 statement.setString(6, DKKH.getVO().getDANTOC());
		 statement.setString(7, DKKH.getVO().getCMND());
		 statement.setDate(8, DKKH.getVO().getCMND_NGAYCAP());
		 statement.setString(9, DKKH.getVO().getCMND_NOICAP());
		 statement.setString(10,DKKH.getVO().getQUOCTICH());
		 statement.setString(11, DKKH.getVO().getTHANHPHO());
		 statement.setString(12, DKKH.getVO().getQUAN());
		 statement.setString(13,DKKH.getVO().getPHUONG());
		 statement.setString(14,DKKH.getVO().getDIACHI());
		 statement.setInt(15,DKKH.getVO().getLAN());
		 statement.setString(16,"Chưa có");
		 
		 statement.setString(17,DKKH.getCHONG().getHOTEN());
		 statement.setDate(18, DKKH.getCHONG().getNGAYSINH());
		 statement.setString(19, DKKH.getCHONG().getDANTOC());
		 statement.setString(20, DKKH.getCHONG().getCMND());
		 statement.setDate(21, DKKH.getCHONG().getCMND_NGAYCAP());
		 statement.setString(22, DKKH.getCHONG().getCMND_NOICAP());
		 statement.setString(23,DKKH.getCHONG().getQUOCTICH());
		 statement.setString(24, DKKH.getCHONG().getTHANHPHO());
		 statement.setString(25, DKKH.getCHONG().getQUAN());
		 statement.setString(26,DKKH.getCHONG().getPHUONG());
		 statement.setString(27,DKKH.getCHONG().getDIACHI());
		 statement.setInt(28,DKKH.getCHONG().getLAN());
		 statement.setString(29,"Chưa có");
		 
		 statement.executeUpdate();
		 
		 statement.close();
		 DisConnection();
		 return false;
				
	 }

}

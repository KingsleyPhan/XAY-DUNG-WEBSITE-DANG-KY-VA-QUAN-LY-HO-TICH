package DAO;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entities.KhaiSinh.DangKyKhaiSinh;

public class DAO_DK_KHAISINH extends ConnectDAO
{


	public DAO_DK_KHAISINH(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	//int COQUAN_ID, int LOAI_DK_ID, DangKyKhaiSinh DKKS
	 public boolean INSERT_DK_KHAISINH(int COQUAN_ID, int LOAI_DK_ID, String email, String SDT, DangKyKhaiSinh DKKS) throws SQLException
	 {
			 Connection();
		 String StrSql = "EXEC ADD_HOSO_DANGKY_KHAISINH ?,?,?,?,?" + 
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
		 statement.setString(4, email);
		 statement.setString(5, SDT);
		 statement.setString(6, DKKS.getNguoiYeuCau().getHoVaTen());
		 statement.setString(7, DKKS.getNguoiYeuCau().getCMND());
		 statement.setDate(8, DKKS.getNguoiYeuCau().getNgayCap());
		 statement.setString(9, DKKS.getNguoiYeuCau().getNoiCap());
		 statement.setString(10, DKKS.getNguoiYeuCau().getQuocTich());
		 statement.setString(11, DKKS.getNguoiYeuCau().getTP());
		 statement.setString(12, DKKS.getNguoiYeuCau().getQuan());
		 statement.setString(13, DKKS.getNguoiYeuCau().getPhuong());
		 statement.setString(14, DKKS.getNguoiYeuCau().getDiaChi());
		 statement.setString(15, DKKS.getNguoiYeuCau().getQuanHe());
		 
		 statement.setString(16, DKKS.getDoiTuongSinh().getHoVaTen());
		 statement.setString(17, DKKS.getDoiTuongSinh().getGioiTinh());
		 statement.setDate(18, DKKS.getDoiTuongSinh().getNgaySinh());
		 statement.setString(19, DKKS.getDoiTuongSinh().getDanToc());
		 statement.setString(20, DKKS.getDoiTuongSinh().getQuocTich());
		 statement.setString(21, DKKS.getDoiTuongSinh().getTP());
		 statement.setString(22, DKKS.getDoiTuongSinh().getQuan());
		 statement.setString(23, DKKS.getDoiTuongSinh().getPhuong());
		 statement.setString(24, DKKS.getDoiTuongSinh().getDiaChi());
		 statement.setString(25, DKKS.getDoiTuongSinh().getCoSoSinhSan());
		 statement.setString(26, DKKS.getDoiTuongSinh().getQuocTich_CSSS());
		 statement.setString(27, DKKS.getDoiTuongSinh().getTP_CSSS());
		 statement.setString(28, DKKS.getDoiTuongSinh().getQuan_CSSS());
		 statement.setString(29, DKKS.getDoiTuongSinh().getPhuong_CSSS());
		 statement.setString(30, DKKS.getDoiTuongSinh().getDiaChi_CSSS());
		 
		 
		 statement.setString(31, DKKS.getMe().getHoVaTen());
		 statement.setDate(32, DKKS.getMe().getNgaySinh());
		 statement.setString(33, DKKS.getMe().getCMND());
		 statement.setDate(34, DKKS.getMe().getNgayCap());
		 statement.setString(35, DKKS.getMe().getNoiCap());
		 statement.setString(36, DKKS.getMe().getDanToc());
		 statement.setString(37, DKKS.getMe().getQuocTich());
		 statement.setString(38, DKKS.getMe().getTP());
		 statement.setString(39, DKKS.getMe().getQuan());
		 statement.setString(40, DKKS.getMe().getPhuong());
		 statement.setString(41, DKKS.getMe().getDiaChi());
		 
		 statement.setString(42, DKKS.getCha().getHoVaTen());
		 statement.setDate(43, DKKS.getCha().getNgaySinh());
		 statement.setString(44, DKKS.getCha().getCMND());
		 statement.setDate(45, DKKS.getCha().getNgayCap());
		 statement.setString(46, DKKS.getCha().getNoiCap());
		 statement.setString(47, DKKS.getCha().getDanToc());
		 statement.setString(48, DKKS.getCha().getQuocTich());
		 statement.setString(49, DKKS.getCha().getTP());
		 statement.setString(50, DKKS.getCha().getQuan());
		 statement.setString(51, DKKS.getCha().getPhuong());
		 statement.setString(52, DKKS.getCha().getDiaChi());
		 
		 statement.setBinaryStream(53,DKKS.getDoiTuongSinh().getFile_Image());
		 
		 statement.executeUpdate();
		 
		 statement.close();
		 DisConnection();
		 
		return true;
	 }

	
	 public String GetMAHOS() throws SQLException
	 {
		 String state="";
		
		   String sql = "  SELECT HOSO_DANGKY_MA FROM HOSO_DANGKY WHERE HOSO_DANGKY_ID =(Select IDENT_CURRENT('HOSO_DANGKY'))";
	    			
     
		    Connection();
		    
		 
		    PreparedStatement statement = DBConnection.prepareStatement(sql);
		  
		 
		     
		    ResultSet resultSet = statement.executeQuery();
		    
		    while(resultSet.next())
		      {
		    	  state = resultSet.getString(1);
		      	
		      }
		    
		    return state;
	 }

}

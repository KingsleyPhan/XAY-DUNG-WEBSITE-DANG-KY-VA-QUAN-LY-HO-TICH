package DAO;


import java.sql.PreparedStatement;
import java.sql.SQLException;

import Entities.KhaiSinh.DangKyKhaiSinh;

public class DAO_DK_KHAISINH extends ConnectDAO
{


	public DAO_DK_KHAISINH(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	//int COQUAN_ID, int LOAI_DK_ID, DangKyKhaiSinh DKKS
	 public boolean INSERT_DK_KHAISINH(int COQUAN_ID, int LOAI_DK_ID, DangKyKhaiSinh DKKS) throws SQLException
	 {
			 Connection();
		 String StrSql = "EXEC ADD_HOSO_DANGKY_KHAISINH ?,?,?" + 
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
		 statement.setString(4, DKKS.getNguoiYeuCau().getHoVaTen());
		 statement.setString(5, DKKS.getNguoiYeuCau().getCMND());
		 statement.setDate(6, DKKS.getNguoiYeuCau().getNgayCap());
		 statement.setString(7, DKKS.getNguoiYeuCau().getNoiCap());
		 statement.setString(8, DKKS.getNguoiYeuCau().getQuocTich());
		 statement.setString(9, DKKS.getNguoiYeuCau().getTP());
		 statement.setString(10, DKKS.getNguoiYeuCau().getQuan());
		 statement.setString(11, DKKS.getNguoiYeuCau().getPhuong());
		 statement.setString(12, DKKS.getNguoiYeuCau().getDiaChi());
		 statement.setString(13, DKKS.getNguoiYeuCau().getQuanHe());
		 
		 statement.setString(14, DKKS.getDoiTuongSinh().getHoVaTen());
		 statement.setString(15, DKKS.getDoiTuongSinh().getGioiTinh());
		 statement.setDate(16, DKKS.getDoiTuongSinh().getNgaySinh());
		 statement.setString(17, DKKS.getDoiTuongSinh().getDanToc());
		 statement.setString(18, DKKS.getDoiTuongSinh().getQuocTich());
		 statement.setString(19, DKKS.getDoiTuongSinh().getTP());
		 statement.setString(20, DKKS.getDoiTuongSinh().getQuan());
		 statement.setString(21, DKKS.getDoiTuongSinh().getPhuong());
		 statement.setString(22, DKKS.getDoiTuongSinh().getDiaChi());
		 statement.setString(23, DKKS.getDoiTuongSinh().getCoSoSinhSan());
		 statement.setString(24, DKKS.getDoiTuongSinh().getQuocTich_CSSS());
		 statement.setString(25, DKKS.getDoiTuongSinh().getTP_CSSS());
		 statement.setString(26, DKKS.getDoiTuongSinh().getQuan_CSSS());
		 statement.setString(27, DKKS.getDoiTuongSinh().getPhuong_CSSS());
		 statement.setString(28, DKKS.getDoiTuongSinh().getDiaChi_CSSS());
		 
		 
		 statement.setString(29, DKKS.getMe().getHoVaTen());
		 statement.setDate(30, DKKS.getMe().getNgaySinh());
		 statement.setString(31, DKKS.getMe().getCMND());
		 statement.setDate(32, DKKS.getMe().getNgayCap());
		 statement.setString(33, DKKS.getMe().getNoiCap());
		 statement.setString(34, DKKS.getMe().getDanToc());
		 statement.setString(35, DKKS.getMe().getQuocTich());
		 statement.setString(36, DKKS.getMe().getTP());
		 statement.setString(37, DKKS.getMe().getQuan());
		 statement.setString(38, DKKS.getMe().getPhuong());
		 statement.setString(39, DKKS.getMe().getDiaChi());
		 
		 statement.setString(40, DKKS.getCha().getHoVaTen());
		 statement.setDate(41, DKKS.getCha().getNgaySinh());
		 statement.setString(42, DKKS.getCha().getCMND());
		 statement.setDate(43, DKKS.getCha().getNgayCap());
		 statement.setString(44, DKKS.getCha().getNoiCap());
		 statement.setString(45, DKKS.getCha().getDanToc());
		 statement.setString(46, DKKS.getCha().getQuocTich());
		 statement.setString(47, DKKS.getCha().getTP());
		 statement.setString(48, DKKS.getCha().getQuan());
		 statement.setString(49, DKKS.getCha().getPhuong());
		 statement.setString(50, DKKS.getCha().getDiaChi());
		 
		 statement.setString(51, "Chua co");
		 
		 statement.executeUpdate();
		 
		 statement.close();
		 DisConnection();
		 
		return true;
	 }

	

}

package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Entities.HoSo.HoSoDangKy;

public class DAO_HOSODANGKY extends ConnectDAO {

	public DAO_HOSODANGKY(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	public HoSoDangKy Get_TraCuuHoSo(String MaGiay, String MaHoso) throws SQLException
	{
		HoSoDangKy HSDK = new HoSoDangKy();
		Connection();
		 
		 String sql = "SELECT * FROM GET_HOSO_TRACUU (?,?)";
		
		 PreparedStatement statement = DBConnection.prepareStatement(sql);
		 
		 statement.setInt(1, Integer.parseInt(MaGiay));
		 statement.setString(2,MaHoso);
		 
	     ResultSet resultSet = statement.executeQuery();
	    
	     while (resultSet.next()) {
		 HSDK.MaHoSo =  resultSet.getString("MaHoSo");
		 HSDK.TenGiayTo =  resultSet.getString("LOAI_DANGKY_TEN");
		 HSDK.NgayDangKy =  resultSet.getDate("HOSO_DANGKY_NGAY_DANGKY");
		 HSDK.Email =  resultSet.getString("HOSO_DANGKY_EMAIL");
		 HSDK.SDT =  resultSet.getString("HOSO_DANGKY_SDT");
		 HSDK.TrangThai =  resultSet.getString("TRANGTHAI_XULY_TEN");
	     }
	     
	
		return HSDK;
	}

}

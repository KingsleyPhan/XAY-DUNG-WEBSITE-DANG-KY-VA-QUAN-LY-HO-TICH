package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entities.KhaiSinh.DangKyKhaiSinh;
import Model.NguoiDung;

public class DAO_NGUOIDUNG extends ConnectDAO {

	public DAO_NGUOIDUNG(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ResultSet loadUser(String MaCoQuan) throws SQLException
	 {
		    int ID = Integer.parseInt(MaCoQuan);
		 
	        String sql = "SELECT * FROM GET_NGUOIDUNG_TABLE(?)";
	         
	        Connection();
	        
	        System.out.println("Hello");
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	       return resultSet;
	      
	 }
	
	 public boolean INSERT_NGUOIDUNG(NguoiDung user) throws SQLException
	 {
			 Connection();
		 String StrSql = "EXEC PROC_THEM_NGUOIDUNG" +
					    "                         ?" + 
				 		"						 ,?" + 
				 		"						 ,?" + 
				 		"						 ,?" + 
				 		"						 ,?" + 
				 		"						 ,?" + 
			 		    "						 ,?" + 
		 		        "			             , ?" + 
				 		"						 , ?" + 
				 		"						 , ?" ;
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,user.getMaCanBo()); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setString(2, user.getHoVaTen());
		 statement.setDate(3,user.getNgaySinh());
		 statement.setString(4,user.getEmail());
		 statement.setString(5, user.getSDT());
		 statement.setString(6, user.getUsername());
		 statement.setString(7, user.getPassword());
		 statement.setInt(8, user.getTrangThai());
		 statement.setString(9, user.getQuyen());
		 statement.setInt(10, user.getCoQuan_ID());
	
		 statement.executeUpdate();
		 
		 statement.close();
		 DisConnection();
		 
		return true;
	 }


}

package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_PHUONG extends ConnectDAO{
	 
	

	public DAO_PHUONG(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public String GET_NAME_PHUONG(String Phuong_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(Phuong_ID);
		 
	        String sql = "SELECT * FROM PHUONG WHERE PHUONG_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("PHUONG_TEN");
	          
	        }
	        return "KHONG TIM THAY PHUONG";
	         
	      
	 }
	
	public String GET_CQ_PHUONG(String Phuong_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(Phuong_ID);
		 
	        String sql = "SELECT * FROM PHUONG WHERE PHUONG_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("PHUONG_TENCOQUAN");
	          
	        }
	        return "KHONG TIM THAY PHUONG";
	         
	      
	 }

}

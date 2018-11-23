package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_DANTOC extends ConnectDAO{
	 
	 

	public DAO_DANTOC(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public String GET_NAME_DANTOC(String DANTOC_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(DANTOC_ID);
		 
	        String sql = "SELECT * FROM DANTOC WHERE DANTOC_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("DANTOC_TEN");
	          
	        }
	        return "KHONG TIM THAY DANTOC";
	         
	      
	 }
}

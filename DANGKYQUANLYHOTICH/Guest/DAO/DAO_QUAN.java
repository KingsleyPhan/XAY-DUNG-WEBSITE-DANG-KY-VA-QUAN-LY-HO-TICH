package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_QUAN extends ConnectDAO{
	
	 
	

	public DAO_QUAN(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public String GET_NAME_QUAN(String QUAN_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(QUAN_ID);
		 
	        String sql = "SELECT * FROM QUAN WHERE QUAN_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("QUAN_TEN");
	          
	        }
	        return "KHONG TIM QUAN";
	         
	      
	 }


}

package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO_THANHPHO extends ConnectDAO
{

	public DAO_THANHPHO(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public String GET_NAME_TP(String ThanhPho_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(ThanhPho_ID);
		 
	        String sql = "SELECT * FROM THANHPHO WHERE THANHPHO_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("THANHPHO_TEN");
	          
	        }
	        return "KHONG TIM THAY THANH PHO";
	         
	      
	 }
	
	public ResultSet  ShowThanhPho()
	{
		try 
		{
			//Kết nối CSDL
			ResultSet rs;
			Connection();
			
			String query ="SELECT * FROM THANHPHO";
			
			Statement statement = DBConnection.createStatement();
			rs = statement.executeQuery(query);
			
			return rs;
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		return null;

	}

}

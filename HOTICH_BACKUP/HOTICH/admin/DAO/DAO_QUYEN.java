package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_QUYEN extends ConnectDAO {

	public DAO_QUYEN(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public ResultSet LoadQuyenNguoiDung() throws SQLException
	 {
		
	        String sql = "SELECT * FROM QUYEN_SUDUNG";
	         
	        Connection();
	        
	        System.out.println("Hello");
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	      
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	       return resultSet;
	      
	 }
	
	public String GET_QUYEN_NAME(String id) throws SQLException
	 {
		     int ID = Integer.parseInt(id);
	        String sql = "SELECT QUYEN_TEN FROM QUYEN_SUDUNG WHERE QUYEN_ID = ?";
	         
	        Connection();
	        
	        System.out.println("Hello");
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	        
	        String name_quyen="";
	        while(resultSet.next())
	        {
	        	name_quyen = resultSet.getString(1);
	        }
	       
	        
	       return name_quyen;
	      
	 }
	
	public String GET_QUYEN_ROLL(String id) throws SQLException
	 {
		     int ID = Integer.parseInt(id);
	        String sql = "SELECT ROLL_TEN FROM QUYEN_SUDUNG WHERE QUYEN_ID = ?";
	         
	        Connection();
	        
	        System.out.println("Hello");
	        PreparedStatement statement = DBConnection.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	        
	        String name_quyen="";
	        while(resultSet.next())
	        {
	        	name_quyen = resultSet.getString(1);
	        }
	       
	        
	       return name_quyen;
	      
	 }
	
}

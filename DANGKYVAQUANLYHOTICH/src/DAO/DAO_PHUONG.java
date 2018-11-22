package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controllers.Consts;

public class DAO_PHUONG {
	protected String URLString;
	protected String DatabaseName;
	protected String DatabasePass;
	protected Connection JDBCConnect;
	
	public DAO_PHUONG(String url, String DatabaseName, String DatabasePass)
	{
		this.URLString = url;
		this.DatabaseName = DatabaseName;
		this.DatabasePass = DatabasePass;
	}
	
	protected void Connection() throws SQLException
	{
		  if (JDBCConnect == null || JDBCConnect.isClosed()) {
	            try 
	            {
	                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            } 
	            catch (ClassNotFoundException e) 
	            {
	                throw new SQLException(e);
	            }
	            JDBCConnect = DriverManager.getConnection(Consts.CONNECTION_STRING);
	        }
	}
	 protected void DisConnection() throws SQLException 
	 {
	        if (JDBCConnect != null && !JDBCConnect.isClosed()) 
	        {
	        	JDBCConnect.close();
	        }
	 }
	 
	 public String GET_NAME_PHUONG(String Phuong_ID) throws SQLException
	 {
		 int ID = Integer.parseInt(Phuong_ID);
		 
	        String sql = "SELECT * FROM PHUONG WHERE PHUONG_ID = ?";
	         
	        Connection();
	         
	        PreparedStatement statement = JDBCConnect.prepareStatement(sql);
	        statement.setInt(1, ID);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	          return resultSet.getString("PHUONG_TEN");
	          
	        }
	        return "KHONG TIM THAY PHUONG";
	         
	      
	 }

}

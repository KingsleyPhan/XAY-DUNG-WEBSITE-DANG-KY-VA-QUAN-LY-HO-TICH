package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class ConnectDAO {
	protected String URL;
	protected String Username;
	protected String Password;
	protected Connection DBConnection;
	
	public ConnectDAO(String URL, String Username, String Password)
	{
		this.URL = URL;
		this.Username = Username;
		this.Password = Password;
	}
	
	public ConnectDAO(Connection DBConnection) {
		this.DBConnection = DBConnection;
	}
	
	protected void Connection() throws SQLException
	{
		if (DBConnection == null || DBConnection.isClosed()) {
	            try 
	            {
	                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            } 
	            catch (ClassNotFoundException e) 
	            {
	                throw new SQLException(e);
	            }
	            DBConnection = DriverManager.getConnection(URL, Username, Password);
	        }
	}
	 protected void DisConnection() throws SQLException 
	 {
	        if (DBConnection != null && !DBConnection.isClosed()) 
	        {
	        	DBConnection.close();
	        }
	 }
}

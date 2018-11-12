package Controllers;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Statement;


public class database 
{
	String sql;
	public database()
	{
	      super();
	      this.sql = Consts.CONNECTION_STRING;
	}
	public Connection connect() throws Exception
	{
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection connect = DriverManager.getConnection(this.sql);
			System.out.println("Connect Sucsessfull");
			return connect;
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	public void ExcuseSQL(String sql) throws Exception 
	{
		Connection connect =connect();
		Statement stmt = connect.createStatement();
		stmt.executeUpdate(sql);
	}
	public ResultSet ChooseData(String sql) throws Exception
	{
		Connection connect = connect();
		Statement stmt = connect.createStatement();
		ResultSet rs =stmt.executeQuery(sql);
		return rs;
	}
	
	public static void main(String[] args) throws Exception {
		database conn = new database();
		System.out.println(conn.connect());
		
		 ResultSet rs = conn.ChooseData("Select * from THANHPHO WHERE THANHPHO_TRANGTHAI=1");
		 while(rs.next())
		 {
			 System.out.println(rs.getString(1));
			 System.out.println(rs.getString(2));
			 System.out.println(rs.getString(3));
		 }
		 
	}
	
	

}

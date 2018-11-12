package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import Controllers.Consts;

public class ConnectDataBase 
{
	String sql;
	
	public ConnectDataBase()
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
	public ResultSet ExcuseService(String sql) throws Exception
	{
		Connection connect = connect();
		Statement stmt = connect.createStatement();
		ResultSet rs =stmt.executeQuery(sql);
		return rs;
	}
	
	public static void main(String[] args) throws Exception {
		ConnectDataBase conn = new ConnectDataBase();
		System.out.println(conn.connect());
		
		 ResultSet rs = conn.ExcuseService("Select * from THANHPHO WHERE THANHPHO_TRANGTHAI=1");
		 while(rs.next())
		 {
			 System.out.println(rs.getString(1));
			 System.out.println(rs.getString(2));
			 System.out.println(rs.getString(3));
		 }
		 
	}

}

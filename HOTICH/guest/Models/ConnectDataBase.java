package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import DAO.ConnectDAO;
import DAO.Consts;

public class ConnectDataBase  extends ConnectDAO
{
	protected String URL;
	protected String Username;
	protected String Password;
	public ConnectDataBase(String URL, String Username, String Password) {
		super(URL, Username, Password);
		this.URL = URL;
		this.Username = Username;
		this.Password = Password;
	}

	String sql;
	

	public Connection connect() throws Exception
	{
		try
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection connect = DriverManager.getConnection(URL, Username, Password);
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
		ConnectDataBase conn = new ConnectDataBase(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		System.out.println(conn.connect());
		
		 ResultSet rs = conn.ExcuseService("Select * from THANHPHO");
		 while(rs.next())
		 {
			 System.out.println(rs.getString(1));
			 System.out.println(rs.getString(2));
			 System.out.println(rs.getString(3));
		 }
		 
	}

}

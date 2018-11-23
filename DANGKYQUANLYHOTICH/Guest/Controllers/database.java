package Controllers;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;

import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import DAO.Consts;
import DAO.DAO_DK_KHAISINH;
import DAO.DAO_THANHPHO;
import Entities.KhaiSinh.DangKyKhaiSinh;



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
	
		
//		DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl,Consts.DatabaseName, Consts.UserName, Consts.Pass);
	
		
	
	}
	
	

}

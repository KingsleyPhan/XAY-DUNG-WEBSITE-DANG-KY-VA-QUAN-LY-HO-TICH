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
import DAO.DAO_HOSODANGKY;
import DAO.DAO_NGUOIDUNG;
import DAO.DAO_QUYEN;
import DAO.DAO_THANHPHO;
import Entities.Decode;
import Entities.NguoiDungA;
import Entities.HoSo.HoSoDangKy;
import Entities.KhaiSinh.DangKyKhaiSinh;
import Models.CreateCode;



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
	
		
		/*
		
        DAO_NGUOIDUNG user  = new DAO_NGUOIDUNG(Consts.ServerUrl,Consts.UserName, Consts.Pass );
        ResultSet result;
        DAO_QUYEN GetQuyen =  new DAO_QUYEN(Consts.ServerUrl,Consts.UserName, Consts.Pass );
       
         	NguoiDungA us = new NguoiDungA();
         	
         	us = user.SeacrhNguoiDung("sac", "sac");
         	
         	String Quyen = GetQuyen.GET_QUYEN_ROLL(us.getQuyen());
         	
         	System.out.println(Quyen);
         	
         	
         	result = user.Get_MACANBO("1");
         	
         	while(result.next())
         	{
         		System.out.println(result.getString(1));
         	}
         	*/
		System.out.println(new SimpleDateFormat("MM-dd-yyyy").format("2012/10/10"));
	}
	
	

}

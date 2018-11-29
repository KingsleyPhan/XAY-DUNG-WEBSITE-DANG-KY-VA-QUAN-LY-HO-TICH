package DAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Consts {
	public static String LocationCap1 = "HỆ THÔNG ĐĂNG KÝ VÀ QUẢN LÝ HỘ TỊCH ONLINE";
	public static String LocationCap2 = "NỘP HỒ SƠ TRỰC TUYẾN";

	//Kết nối 2 máy
	public static String ServerUrl = "jdbc:sqlserver://192.168.8.102:1433;databaseName=CSDL_QLHT_Test_2;";
	//Kết tại máy
	//public static String ServerUrl = "jdbc:sqlserver://localhost:1433;databaseName=CSDL_QLHT_Test_2;";
	public static String UserName = "HOTICHSVR";
	public static String Pass = "123456";
	//Kết nối 2 máy
	public static String CONNECTION_STRING = "jdbc:sqlserver://192.168.8.102:1433;databaseName=CSDL_QLHT_Test_2;user=HOTICHSVR;password=123456;useUnicode=true;characterEncoding=UTF-8;";
	//Kết tại máy
	//public static String CONNECTION_STRING = "jdbc:sqlserver://localhost:1433;databaseName=CSDL_QLHT_Test_2;user=HOTICHSVR;password=123456;useUnicode=true;characterEncoding=UTF-8;";
	
	public static int COQUAN_ID = 1;

	public static int Get_COQUAN_ID()
	{
		return COQUAN_ID;
	}

	//Chuyển từ form vô Entity
	public static java.util.Date ConvertStringToUtilDate(String date) throws ParseException {
		if(date != "") {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			return format.parse(date);
		}
		return null;
	}
	
	//Dùng để đưa biến từ Entity vô SQL
	public static java.sql.Date ConvertUtilToSQLDate(java.util.Date date) throws ParseException {
		if(date != null) {
			return new java.sql.Date(date.getTime()); 
		}
		return null;
	}
	
	//Dùng khi lấy từ SQL ra Entity
	public static java.util.Date ConvertSQLtoUtilDate(java.sql.Date date) throws ParseException
	{
		if(date != null) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			String temp = format.format(date);
			return format.parse(temp);
		}
		return null;
	}
	//Dùng để chuyển từ Entity ra show form
	public static String ConvertUtilToString(java.util.Date date)
	{
		if(date != null){
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			return format.format(date);
		}
		return "";
	}
}

package DAO;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

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
	
	public static int NGUOIDUNG_ID = 53;

	public static boolean OpenWebsite = false;
	
	public static String subject = "Phản hồi hộ tịch";
	
	public static String user = "huuhung9822@gmail.com";
	
	public static String pass = "xoeihcpioupannzz";
	
	public static String urlImage = "E:\\Workspace\\HOTICH\\XAY-DUNG-WEBSITE-DANG-KY-VA-QUAN-LY-HO-TICH\\HOTICH\\WebContent\\CONTENT\\image\\";
	
	public static void removeSession(HttpSession session) {
		session.removeAttribute("message");
		session.removeAttribute("content");
		session.removeAttribute("NYC_HOVATEN_SUBMIT");
		session.removeAttribute("HSDK_MA");
		session.removeAttribute("HSDK_TEN");
		session.removeAttribute("HSDK_LOAI");
		session.removeAttribute("HSDK_ID");
		session.removeAttribute("feedback");
		session.removeAttribute("email");
		session.removeAttribute("sdt");
		session.removeAttribute("lephi");
	}
	
	public static int Get_COQUAN_ID()
	{
		return COQUAN_ID;
	}
	
	@SuppressWarnings("deprecation")
	public static String writeDate(java.util.Date date) {
		return "Ngày "+date.getDate()+" tháng "+(date.getMonth() +1) + " năm "+(date.getYear()+1900);
	}

	//Chuyển từ form vô Entity
	public static java.util.Date ConvertStringToUtilDate(String date) throws ParseException {
		if(date != "") {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
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
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
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
	
	public static BufferedImage resize(BufferedImage img, int height, int width) {
        Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }

}

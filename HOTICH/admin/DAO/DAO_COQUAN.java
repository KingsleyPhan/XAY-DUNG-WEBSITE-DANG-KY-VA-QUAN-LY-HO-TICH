package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entities.CoQuanCongQuyen;
import Entities.NguoiDungA;

public class DAO_COQUAN extends ConnectDAO {

	public DAO_COQUAN(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	
	
	public boolean TrangThaiCoQuan(int TP_ID, int QUAN_ID, int PHUONG_ID) throws SQLException
	{
		int state=0;
		   String sql = "SELECT COQUAN_TRANGTHAI FROM COQUAN   " +
	    			 	"WHERE 					" +
	    				"PHUONG_ID = ?    "+
					   	"AND QUAN_ID = ?    "+
					   	"AND TP_ID = ?    ";
	    			
       
      Connection();
      
      System.out.println("CƠ QUAN ID = " + Consts.COQUAN_ID);
      
      System.out.println("Hello");
      PreparedStatement statement = DBConnection.prepareStatement(sql);
      statement.setInt(1, PHUONG_ID);
	   statement.setInt(2, QUAN_ID);
	   statement.setInt(3, TP_ID);
   
       
      ResultSet resultSet = statement.executeQuery();
      
   
      
      while(resultSet.next())
      {
    	  state = resultSet.getInt(1);
      	
      }
    
      
      if(state==1)
      {
    	  return true;
      }
		
		
		
		return false;
		
	}
	
	public int GET_COQUAN_ID(int TP, int QUAN, int PHUONG) throws SQLException
	{
		int ID=0;
		   String sql = "SELECT COQUAN_ID FROM COQUAN   " +
	    			 	"WHERE 					" +
	    			 	"PHUONG_ID = ?    "+
					   	"AND QUAN_ID = ?    "+
					   	"AND TP_ID = ?    ";
	    			
    
		   Connection();
		   
		   System.out.println("CƠ QUAN ID = " + Consts.COQUAN_ID);
		   
		   System.out.println("Hello");
		   PreparedStatement statement = DBConnection.prepareStatement(sql);
		   statement.setInt(1, PHUONG);
		   statement.setInt(2, QUAN);
		   statement.setInt(3, TP);
		
		    
		   ResultSet resultSet = statement.executeQuery();
		   
		  
		   
		   while(resultSet.next())
		   {
		 	  ID = resultSet.getInt(1);
		   	
		   }
		return ID;
 
	}
	
	public boolean Update_DiaChi_CoQuan(String DiaChi) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_DIACHI=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,DiaChi); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public CoQuanCongQuyen Get_CoQuan() throws SQLException
	{
		 String sql = "SELECT * FROM COQUAN WHERE COQUAN_ID = ? ";
 			 	
 			

	   Connection();
	   
	   System.out.println("CƠ QUAN ID = " + Consts.COQUAN_ID);
	   
	   System.out.println("Hello");
	   PreparedStatement statement = DBConnection.prepareStatement(sql);
	   statement.setInt(1, Consts.COQUAN_ID);
	
	    
	   ResultSet resultSet = statement.executeQuery();
	   
	  CoQuanCongQuyen CQ = new CoQuanCongQuyen();
	   
	   while(resultSet.next())
	   {
	 	 
		   CQ.setCoQuan_Ten(resultSet.getString("COQUAN_TEN"));
		   CQ.setCoQuan_SDT(resultSet.getString("COQUAN_SDT"));
		   CQ.setCoQuan_Email(resultSet.getString("COQUAN_EMAIL"));
		   CQ.setCoQuan_DiaChi(resultSet.getString("COQUAN_DIACHI"));
		   System.out.println("DIACHILA: " + resultSet.getString("COQUAN_DIACHI"));
		   CQ.setCoQuan_GioiThieu(resultSet.getString("COQUAN_GIOITHIEU"));
		   CQ.setCoQuan_Phuong(resultSet.getInt("PHUONG_ID"));
		   CQ.setCoQuan_Quan(resultSet.getInt("QUAN_ID"));
		   CQ.setCoQuan_Tp(resultSet.getInt("TP_ID"));
		   CQ.setCoQuan_TR_TEN(resultSet.getString("COQUAN_TR_TEN"));
		   CQ.setCoQuan_TR_Sdt(resultSet.getString("COQUAN_TR_SDT"));
		   CQ.setCoQuan_TR_Email(resultSet.getString("COQUAN_TR_EMAIL"));
		   CQ.setCoQuan_PR_TEN(resultSet.getString("COQUAN_PR_TEN"));
		   CQ.setCoQuan_PR_Sdt(resultSet.getString("COQUAN_PR_SDT"));
		   CQ.setCoQuan_PR_Email(resultSet.getString("COQUAN_PR_EMAIL"));
		  
		   
	   	
	   }
		return CQ;
		
	}
	
	public boolean Update_SDT_CoQuan(String SDT) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_SDT=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,SDT); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_EMAIL_CoQuan(String EMAIL) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_EMAIL=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,EMAIL); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_GT_CoQuan(String GT) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_GIOITHIEU=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,GT); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_PR_TEN_CoQuan(String PR_TEN) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_PR_TEN=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,PR_TEN); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_PR_EMAIL_CoQuan(String PR_EMAIL) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_PR_EMAIL=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,PR_EMAIL); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_PR_SDT_CoQuan(String PR_SDT) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_PR_SDT=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,PR_SDT); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	public boolean Update_TR_TEN_CoQuan(String TR_TEN) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_TR_TEN=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,TR_TEN); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_TR_EMAIL_CoQuan(String TR_EMAIL) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_TR_EMAIL=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,TR_EMAIL); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	
	public boolean Update_TR_SDT_CoQuan(String TR_SDT) throws SQLException
	{
		
		 Connection();
		 String StrSql = "update COQUAN set COQUAN_TR_SDT=? where COQUAN_ID=?";
		 		
		 
		 PreparedStatement statement = DBConnection.prepareStatement(StrSql);
		 statement.setString(1,TR_SDT); //Trạng Thái: 1 là trạng thái chưa xử lý	
		 statement.setInt(2, Consts.COQUAN_ID);
		
		 System.out.println("sql: " + statement.toString());

	     statement.executeUpdate();
		
	
			 
		 statement.close();
		 DisConnection();
		 
	
		
		return false;
		
	}
	



}

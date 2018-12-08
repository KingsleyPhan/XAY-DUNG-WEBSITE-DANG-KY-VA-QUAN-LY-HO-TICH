package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	


}

package Models;

import java.sql.ResultSet;
import java.util.ArrayList;

import Entities.QUAN;

public class CapQuanService 
{
	ConnectDataBase Connect = new ConnectDataBase();
	
	public CapQuanService()
	{
		
	}
	
	public ArrayList<QUAN> SearchThanhPhoOfQuan(String THANHPHO_ID)
	{
		System.out.println("QUAN_SVR: " + THANHPHO_ID);
		//Kết nối CSDL
		ResultSet rs;
		try {
			Connect.connect();
			
			String ID =THANHPHO_ID.trim();
			
			String query ="SELECT * FROM QUAN WHERE THANHPHO_ID = "+ ID;
			
			rs = Connect.ExcuseService(query);
			
			ArrayList<QUAN> QUANLST = new ArrayList<QUAN>();
			
			while(rs.next())
			{
				QUAN Q = new QUAN(rs.getString(1),rs.getString(3));
				QUANLST.add(Q);
			}
			
			
			System.out.println(QUANLST.size());
		return QUANLST;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	public ResultSet ShowQuan(String City)
	{
		try 
		{
			//Kết nối CSDL
			ResultSet rs;
			Connect.connect();
			
			String query ="SELECT * FROM QUAN WHERE THANHPHO_ID=" + SearchThanhPhoOfQuan(City);
			
			rs = Connect.ExcuseService(query);
			
			return rs;
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		return null;
	}

}

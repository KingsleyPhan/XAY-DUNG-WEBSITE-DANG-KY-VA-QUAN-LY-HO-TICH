package Models;

import java.sql.ResultSet;
import java.util.ArrayList;

import Entities.PHUONG;

public class CapPhuongService 
{

ConnectDataBase Connect = new ConnectDataBase();
	
	public CapPhuongService()
	{
		
	}
	
	public ArrayList<PHUONG> SearchPHUONGOFQUAN(String QUAN_ID)
	{
		System.out.println("QUAN_SVR: " + QUAN_ID);
		//Kết nối CSDL
		ResultSet rs;
		try {
			Connect.connect();
			
			String ID =QUAN_ID.trim();
			
			String query ="SELECT * FROM PHUONG WHERE QUAN_ID = "+ ID;
			
			rs = Connect.ExcuseService(query);
			
			ArrayList<PHUONG> PHUONGLST = new ArrayList<PHUONG>();
			
			while(rs.next())
			{
				PHUONG Q = new PHUONG(rs.getString(1),rs.getString(4));
				PHUONGLST.add(Q);
			}
			
			
			System.out.println(PHUONGLST.size());
		return PHUONGLST;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
}

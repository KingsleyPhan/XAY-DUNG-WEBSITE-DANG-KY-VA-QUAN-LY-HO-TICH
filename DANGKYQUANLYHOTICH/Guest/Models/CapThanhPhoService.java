package Models;

import java.sql.ResultSet;

public class CapThanhPhoService 
{
	ConnectDataBase Connect = new ConnectDataBase();
	
	public CapThanhPhoService()
	{
		
	}
	
	public ResultSet  ShowThanhPho()
	{
		
		try 
		{
			//Kết nối CSDL
			ResultSet rs;
			Connect.connect();
			
			String query ="SELECT * FROM THANHPHO";
			
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

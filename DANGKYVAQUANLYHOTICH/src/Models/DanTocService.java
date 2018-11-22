package Models;

import java.sql.ResultSet;

public class DanTocService {
ConnectDataBase Connect = new ConnectDataBase();
	
	public ResultSet  ShowDanToc()
	{
		
		try 
		{
			//Kết nối CSDL
			ResultSet rs;
			Connect.connect();
			
			String query ="SELECT * FROM DANTOC";
			
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

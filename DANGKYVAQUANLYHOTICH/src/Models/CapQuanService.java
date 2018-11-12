package Models;

import java.sql.ResultSet;

public class CapQuanService 
{
	ConnectDataBase Connect = new ConnectDataBase();
	
	public CapQuanService()
	{
		
	}
	
	public String SearchThanhPhoOfQuan(String NameCity)
	{
		//Kết nối CSDL
		ResultSet rs;
		try {
			Connect.connect();
			
			String cityName = NameCity.trim();
			
			String query ="SELECT THANHPHO_ID FROM THANHPHO WHERE THANHPHO_TEN = "+ cityName;
			
			rs = Connect.ExcuseService(query);
			
			if(rs.wasNull() == false)
			{
				return rs.getString(1);
			}
			
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

package Models;

import java.sql.ResultSet;

import DAO.Consts;

public class CapThanhPhoService 
{
	ConnectDataBase Connect = new ConnectDataBase(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	
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
			
			String query ="SELECT * FROM GET_THANHPHO";
			
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

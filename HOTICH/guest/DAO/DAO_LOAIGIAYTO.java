package DAO;

import java.sql.ResultSet;
import java.sql.Statement;

public class DAO_LOAIGIAYTO  extends ConnectDAO
{

	public DAO_LOAIGIAYTO(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	public ResultSet Get_Loai_GiayTo()
	{
		try 
		{
			//Kết nối CSDL
			ResultSet rs;
			Connection();
			
			String query ="SELECT LOAI_DANGKY_ID, LOAI_DANGKY_TEN FROM LOAI_DANGKY";
			
			Statement statement = DBConnection.createStatement();
			rs = statement.executeQuery(query);
			
			return rs;
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		return null;
	}

}

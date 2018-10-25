package motel;

import java.sql.ResultSet;



public class DBUser {
  database dal;
	
	public DBUser()
	{
		dal = new database() ;
	}
	
	public ResultSet getListUser() throws Exception
	{
		return dal.ChooseData("Select * From THANHPHO WHERE maTP IS NOT NULL");
	}
}

package Models;

import java.sql.ResultSet;

import DAO.Consts;
import DAO.DAO_LOAIGIAYTO;

public class LoaiGiayToService 
{
	
	public LoaiGiayToService ()
	{
		
	}
	
	
	public ResultSet Get_GiayTo_Name()
	{
		DAO_LOAIGIAYTO TypePaper = new DAO_LOAIGIAYTO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		ResultSet rs = TypePaper.Get_Loai_GiayTo();
		
		return rs;
	}
	

}

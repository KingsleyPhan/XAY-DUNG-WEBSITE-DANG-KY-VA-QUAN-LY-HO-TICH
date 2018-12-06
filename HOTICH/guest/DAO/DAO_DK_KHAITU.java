package DAO;

import java.sql.SQLException;

import Entities.KhaiSinh.DangKyKhaiSinh;

public class DAO_DK_KHAITU extends ConnectDAO {

	public DAO_DK_KHAITU(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}
	
	 public boolean INSERT_DK_KHAITU(int COQUAN_ID, int LOAI_DK_ID, String email, String SDT, DangKyKhaiSinh DKKS) throws SQLException
	 {
		return false;
		 
	 }

}

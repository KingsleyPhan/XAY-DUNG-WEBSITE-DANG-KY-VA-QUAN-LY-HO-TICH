package Entities.HoSo;

import java.sql.Date;

public class HoSoDangKy 
{
	
	public String MaHoSo;
	public String TenGiayTo;
	public Date NgayDangKy;
	public String Email;
	public String SDT;
	public String TrangThai;
	
	public HoSoDangKy()
	{
		
	}
	
	public void ShowImfot()
	{
		System.out.println("MaHoSo "+MaHoSo);
		System.out.println("TenGiayTo "+TenGiayTo);
		System.out.println("NgayDangKy "+NgayDangKy);
		System.out.println("Email "+Email);
		System.out.println("SDT "+SDT);
		System.out.println("TrangThai "+TrangThai);
		
		
	}

}

package Entities;

public class THANHPHO 
{
	private int ThanhPho_ID;
	private String ThanhPho_Ten;
	private int ThanhPho_TrangThai;
	
	public THANHPHO(int ID, String Ten,int TrangThai)
	{
		this.ThanhPho_ID = ID;
		this.ThanhPho_Ten = Ten;
		this.ThanhPho_TrangThai =TrangThai;
	}
	
	public THANHPHO()
	{
		
	}
}

package Entities;

public class QUAN 
{
	private int Quan_ID;
	private String Quan_Ten;
	private int Quan_TrangThai;
	
	public int getQuan_ID() {
		return Quan_ID;
	}

	public void setQuan_ID(int quan_ID) {
		Quan_ID = quan_ID;
	}

	public String getQuan_Ten() {
		return Quan_Ten;
	}

	public void setQuan_Ten(String quan_Ten) {
		Quan_Ten = quan_Ten;
	}

	public int getQuan_TrangThai() {
		return Quan_TrangThai;
	}

	public void setQuan_TrangThai(int quan_TrangThai) {
		Quan_TrangThai = quan_TrangThai;
	}

	public QUAN(int ID, String Ten,int TrangThai)
	{
		this.Quan_ID = ID;
		this.Quan_Ten = Ten;
		this.Quan_TrangThai =TrangThai;
	}
	
	public QUAN(String ID, String Ten)
	{
		this.Quan_ID = Integer.parseInt(ID);;
		this.Quan_Ten = Ten;
	}

}

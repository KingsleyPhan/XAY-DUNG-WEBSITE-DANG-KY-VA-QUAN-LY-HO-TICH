package Entities;

public class PHUONG 
{
	private int Phuong_ID;
	public int getPhuong_ID() {
		return Phuong_ID;
	}

	public void setPhuong_ID(int phuong_ID) {
		Phuong_ID = phuong_ID;
	}

	public String getPhuong_Ten() {
		return Phuong_Ten;
	}

	public void setPhuong_Ten(String phuong_Ten) {
		Phuong_Ten = phuong_Ten;
	}

	public int getPhuong_TrangThai() {
		return Phuong_TrangThai;
	}

	public void setPhuong_TrangThai(int phuong_TrangThai) {
		Phuong_TrangThai = phuong_TrangThai;
	}

	private String Phuong_Ten;
	private String Phuong_TenCQ;
	public String getPhuong_TenCQ() {
		return Phuong_TenCQ;
	}

	public void setPhuong_TenCQ(String phuong_TenCQ) {
		Phuong_TenCQ = phuong_TenCQ;
	}

	private int Phuong_TrangThai;
	
	public PHUONG(int ID, String Ten,int TrangThai)
	{
		this.Phuong_ID = ID;
		this.Phuong_Ten = Ten;
		this.Phuong_TrangThai =TrangThai;
	}
	
	public PHUONG(String ID, String Ten, String TenCQ)
	{
		this.Phuong_ID = Integer.parseInt(ID);
		this.Phuong_Ten = Ten;
		this.Phuong_TenCQ = TenCQ;
	}
}

package Entities;

public class DiaChi {
	private String thanhPho;
	private String quan;
	private String phuong;
	private String soDuong;
	public String getThanhPho() {
		return thanhPho;
	}
	public String getQuan() {
		return quan;
	}
	public String getPhuong() {
		return phuong;
	}
	public String getSoDuong() {
		return soDuong;
	}
	public DiaChi(String thanhPho, String quan, String phuong, String soDuong) {
		super();
		this.thanhPho = thanhPho;
		this.quan = quan;
		this.phuong = phuong;
		this.soDuong = soDuong;
	}
	private DiaChi() {
		super();
	}
}

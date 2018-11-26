package Entities;

public class DiaChi {
	private String quocGia;
	private String thanhPho;
	private String quan;
	private String phuong;
	private String soDuong;
	public String getQuocGia() {
		return quocGia;
	}
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
	
	public DiaChi(String quocGia, String thanhPho, String quan, String phuong, String soDuong) {
		super();
		this.quocGia = quocGia;
		this.thanhPho = thanhPho;
		this.quan = quan;
		this.phuong = phuong;
		this.soDuong = soDuong;
	}
	private DiaChi() {
		super();
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("Quốc gia : " + quocGia);
		wrkStr.append("\r\n");
		wrkStr.append("Thành phố : " + thanhPho);
		wrkStr.append("\r\n");
		wrkStr.append("Quận : " + quan);
		wrkStr.append("\r\n");
		wrkStr.append("Phường : " + phuong);
		wrkStr.append("\r\n");
		wrkStr.append("Địa chỉ chi tiết : " + soDuong);
		return wrkStr.toString();
	}
}

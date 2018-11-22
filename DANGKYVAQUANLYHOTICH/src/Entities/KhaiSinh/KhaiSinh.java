package Entities.KhaiSinh;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class KhaiSinh {

	private String HoVaTen;
	private String GioiTinh;
	private Date NgaySinh;
	private String DanToc;
	private String QuocTich;
	private String TP;
	private String Quan;
	private String Phuong;
	private String DiaChi;
	private String CoSoSinhSan;
	private String QuocTich_CSSS;
	private String TP_CSSS;
	private String Quan_CSSS;
	private String Phuong_CSSS;
	private String DiaChi_CSSS;

	public String getHoVaTen() {
		return HoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}

	public String getGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return NgaySinh;
	}

	public void setNgaySinh(String ngaySinh) throws ParseException {
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = fmd.parse(ngaySinh);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
		NgaySinh = sqlStartDate;
	}

	public String getDanToc() {
		return DanToc;
	}

	public void setDanToc(String danToc) {
		DanToc = danToc;
	}

	public String getQuocTich() {
		return QuocTich;
	}

	public void setQuocTich(String quocTich) {
		QuocTich = quocTich;
	}

	public String getTP() {
		return TP;
	}

	public void setTP(String tP) {
		TP = tP;
	}

	public String getQuan() {
		return Quan;
	}

	public void setQuan(String quan) {
		Quan = quan;
	}

	public String getPhuong() {
		return Phuong;
	}

	public void setPhuong(String huyen) {
		Phuong = huyen;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getCoSoSinhSan() {
		return CoSoSinhSan;
	}

	public void setCoSoSinhSan(String coSoSinhSan) {
		CoSoSinhSan = coSoSinhSan;
	}

	public String getQuocTich_CSSS() {
		return QuocTich_CSSS;
	}

	public void setQuocTich_CSSS(String quocTich_CSSS) {
		QuocTich_CSSS = quocTich_CSSS;
	}

	public String getTP_CSSS() {
		return TP_CSSS;
	}

	public void setTP_CSSS(String tP_CSSS) {
		TP_CSSS = tP_CSSS;
	}

	public String getQuan_CSSS() {
		return Quan_CSSS;
	}

	public void setQuan_CSSS(String quan_CSSS) {
		Quan_CSSS = quan_CSSS;
	}

	public String getPhuong_CSSS() {
		return Phuong_CSSS;
	}

	public void setPhuong_CSSS(String huyen_CSSS) {
		Phuong_CSSS = huyen_CSSS;
	}

	public String getDiaChi_CSSS() {
		return DiaChi_CSSS;
	}

	public void setDiaChi_CSSS(String diaChi_CSSS) {
		DiaChi_CSSS = diaChi_CSSS;
	}
	
	public void showImfor()
	{
		System.out.println("NGƯỜI ĐƯỢC KHAI SINH");
		System.out.println("Ten: "+ this.HoVaTen);
		System.out.println("NgSinh  : "+ this.NgaySinh);
		System.out.println("Gioi Tinh  : "+ this.GioiTinh);
		System.out.println("Dan Toc  : "+ this.DanToc);
		System.out.println("Quoc Tich  : "+ this.QuocTich);
		System.out.println("Thanh Pho  : "+ this.TP);
		System.out.println("Quan  : "+ this.Quan);
		System.out.println("Phuong  : "+ this.Phuong);
		System.out.println("Dia Chi  : "+ this.DiaChi);
		System.out.println("CSSS  : "+ this.CoSoSinhSan);
		System.out.println("Quoc gia Sinh  : "+ this.QuocTich_CSSS);
		System.out.println("Tp  : "+ this.TP_CSSS);
		System.out.println("Quan  : "+ this.Quan_CSSS);
		System.out.println("Phuong  : "+ this.Phuong_CSSS);
		System.out.println("Dia Chi  : "+ this.DiaChi_CSSS);
	}

}

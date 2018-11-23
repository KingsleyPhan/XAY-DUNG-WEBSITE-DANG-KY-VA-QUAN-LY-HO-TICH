package Entities.KhaiSinh;


import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class NguoiYeuCau {
	private String HoVaTen;
	private String CMND;
	private String NoiCap;
	private Date NgayCap;
	private String QuanHe;
	private String QuocTich;
	private String TP;
	private String Quan;
	private String Phuong;
	private String DiaChi;

	public String getHoVaTen() {
		return HoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}

	public String getCMND() {
		return CMND;
	}

	public void setCMND(String cMND) {
		CMND = cMND;
	}

	public String getNoiCap() {
		return NoiCap;
	}

	public void setNoiCap(String noiCap) {
		NoiCap = noiCap;
	}

	public Date getNgayCap() {
		return NgayCap;
	}

	public void setNgayCap(String ngayCap) throws ParseException {
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = fmd.parse(ngayCap);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
		NgayCap = sqlStartDate;
	}

	public String getQuanHe() {
		return QuanHe;
	}

	public void setQuanHe(String quanHe) {
		QuanHe = quanHe;
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
	
	public void showImfor()
	{
		System.out.println("Ten: " + this.HoVaTen);
		System.out.println("CMND: " + this.CMND);
		System.out.println("Ngay: " +this.NgayCap);
		System.out.println("Noi: " +this.NoiCap);
		System.out.println("QH: " + this.QuanHe);
		System.out.println("QTICH: "+ this.QuocTich);
		System.out.println("TP: " +this.TP);
		System.out.println("Quan " +this.Quan);
		System.out.println("Phuong: " +this.Phuong);
		System.out.println("Dia chi: " +this.DiaChi);
		
	}

}

package Entities.KhaiSinh;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class NguoiThan 
{
	
	private String  HoVaTen;
	private Date  NgaySinh;
	private String  CMND;
	private String  NoiCap;
	private Date  NgayCap;
	private String  DanToc;
	private String  QuocTich;
	private String  TP;
	private String  Quan;
	private String  Phuong;
	private String  DiaChi;
	
	public String getHoVaTen() {
		return HoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
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
		NgayCap =sqlStartDate;
	}
	public String getDanToc() {
		return DanToc;
	}
	public void setDanToc(String dantoc) {
		DanToc = dantoc;
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
	public void setPhuong(String phuong) {
		Phuong = phuong;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	
	public void showImfor()
	{
		System.out.println("Ten :"+this.HoVaTen);
		System.out.println("CMND :"+this.CMND);
		System.out.println("Ngay :"+this.NgayCap);
		System.out.println("Noi :"+this.NoiCap);
		System.out.println("DanToc :"+this.DanToc);
		System.out.println("QT :"+this.QuocTich);
		System.out.println("TP :"+this.TP);
		System.out.println("Q :"+this.Quan);
		System.out.println(" P:"+this.Phuong);
		System.out.println(" DC:"+this.DiaChi);
	}
	

}

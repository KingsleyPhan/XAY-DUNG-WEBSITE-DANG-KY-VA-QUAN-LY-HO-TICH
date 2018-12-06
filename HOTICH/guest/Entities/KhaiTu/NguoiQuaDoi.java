package Entities.KhaiTu;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class NguoiQuaDoi 
{
	private String  HoVaTen;
	private Date  NgaySinh;
	private String GioiTinh;
	private String  CMND;
	private String  NoiCap;
	private String  NgayCap;
	private String  DanToc;
	private String  QuocTich;
	private String  TP;
	private String  Quan;
	private String  Phuong;
	private String  DiaChi;
	
	private String NgayMat;
	private String ThoiGianMat;
	private String NoiMat;
	private String NguyenNhan;
	private String NoiMat_QuocGia;
	private String  NoiMat_TP;
	private String  NoiMat_Quan;
	private String  NoiMat_Phuong;
	private String  NoiMat_DiaChi;
	public String getHoVaTen() {
		return HoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}
	public Date getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date;
		try {
			date = fmd.parse(ngaySinh);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
			NgaySinh = sqlStartDate;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String string) {
		GioiTinh = string;
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
	public String getNgayCap() {
		return NgayCap;
	}
	public void setNgayCap(String ngayCap) {
		NgayCap = ngayCap;
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
	public void setPhuong(String phuong) {
		Phuong = phuong;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getNgayMat() {
		return NgayMat;
	}
	public void setNgayMat(String ngayMat) {
		NgayMat = ngayMat;
	}
	public String getThoiGianMat() {
		return ThoiGianMat;
	}
	public void setThoiGianMat(String thoiGianMat) {
		ThoiGianMat = thoiGianMat;
	}
	public String getNoiMat() {
		return NoiMat;
	}
	public void setNoiMat(String noiMat) {
		NoiMat = noiMat;
	}
	public String getNguyenNhan() {
		return NguyenNhan;
	}
	public void setNguyenNhan(String nguyenNhan) {
		NguyenNhan = nguyenNhan;
	}
	public String getNoiMat_QuocGia() {
		return NoiMat_QuocGia;
	}
	public void setNoiMat_QuocGia(String noiMat_QuocGia) {
		NoiMat_QuocGia = noiMat_QuocGia;
	}
	public String getNoiMat_TP() {
		return NoiMat_TP;
	}
	public void setNoiMat_TP(String noiMat_TP) {
		NoiMat_TP = noiMat_TP;
	}
	public String getNoiMat_Quan() {
		return NoiMat_Quan;
	}
	public void setNoiMat_Quan(String noiMat_Quan) {
		NoiMat_Quan = noiMat_Quan;
	}
	public String getNoiMat_Phuong() {
		return NoiMat_Phuong;
	}
	public void setNoiMat_Phuong(String noiMat_Phuong) {
		NoiMat_Phuong = noiMat_Phuong;
	}
	public String getNoiMat_DiaChi() {
		return NoiMat_DiaChi;
	}
	public void setNoiMat_DiaChi(String noiMat_DiaChi) {
		NoiMat_DiaChi = noiMat_DiaChi;
	}
	
	
	
	
	

}

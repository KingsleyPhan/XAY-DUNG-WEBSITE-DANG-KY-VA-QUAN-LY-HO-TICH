package Entities;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class PhanHoi {
	private int ID;
	private HSDK hsdk;
	private String email;
	private String sdt;
	private NGUOIDUNG ngPhanHoi;
	private String noiDung;
	private COQUAN coQuan;
	private Date thoiGian;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public HSDK getHsdk() {
		return hsdk;
	}
	public void setHsdk(HSDK hsdk) {
		this.hsdk = hsdk;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public NGUOIDUNG getNgPhanHoi() {
		return ngPhanHoi;
	}
	public void setNgPhanHoi(NGUOIDUNG ngPhanHoi) {
		this.ngPhanHoi = ngPhanHoi;
	}
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	public COQUAN getCoQuan() {
		return coQuan;
	}
	public void setCoQuan(COQUAN coQuan) {
		this.coQuan = coQuan;
	}
	public Date getThoiGian() {
		return thoiGian;
	}
	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}
	public PhanHoi(int iD, HSDK hsdk, String email, String sdt, NGUOIDUNG ngPhanHoi, String noiDung, COQUAN coQuan,
			Date thoiGian) {
		super();
		this.ID = iD;
		this.hsdk = hsdk;
		this.email = email;
		this.sdt = sdt;
		this.ngPhanHoi = ngPhanHoi;
		this.noiDung = noiDung;
		this.coQuan = coQuan;
		this.thoiGian = thoiGian;
	}
	
	public Map<Object,Object> toMap(){
		Map<Object,Object> phanHoi = new HashMap<Object, Object>();
		phanHoi.put("id", this.ID);
		phanHoi.put("maHSDK", this.hsdk.getHoSoDangKyMa());
		phanHoi.put("email", this.email);
		phanHoi.put("sdt", this.sdt);
		phanHoi.put("ngPhanHoi", this.ngPhanHoi.getHoVaTen());
		phanHoi.put("noiDung",this.noiDung);
		phanHoi.put("thoiGian", this.thoiGian);
		return phanHoi;
	}
}

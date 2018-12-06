package Entities;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import DAO.Consts;

public class HSDK {
	private int hoSoDangKyId;
	private String hoSoDangKyTen;
	private String hoSoDangKyMa;
	private Date ngayDangKy;
	private Date ngayHetHan;
	private int loaiGiayToId;
	public int getHoSoDangKyId() {
		return hoSoDangKyId;
	}
	public String getHoSoDangKyTen() {
		return hoSoDangKyTen;
	}
	public String getHoSoDangKyMa() {
		return hoSoDangKyMa;
	}
	public Date getNgayDangKy() {
		return ngayDangKy;
	}
	public String getNgayDangKyString() {
		return Consts.ConvertUtilToString(ngayDangKy);
	}
	public Date getNgayHetHan() {
		return ngayHetHan;
	}
	public String getNgayHetHanString() {
		return Consts.ConvertUtilToString(ngayHetHan);
	}
	public int getLoaiGiayToId() {
		return loaiGiayToId;
	}

	public HSDK(int hoSoDangKyId, String hoSoDangKyTen, String hoSoDangKyMa, Date ngayDangKy, Date ngayHetHan,
			int loaiGiayToId) {
		super();
		this.hoSoDangKyId = hoSoDangKyId;
		this.hoSoDangKyTen = hoSoDangKyTen;
		this.hoSoDangKyMa = hoSoDangKyMa;
		this.ngayDangKy = ngayDangKy;
		this.ngayHetHan = ngayHetHan;
		this.loaiGiayToId = loaiGiayToId;
	}
	
	
	public HSDK(int hoSoDangKyId, int loaiGiayToId) {
		super();
		this.hoSoDangKyId = hoSoDangKyId;
		this.loaiGiayToId = loaiGiayToId;
	}
	
	private HSDK() {
		super();
	}
	
	public HSDK getHSDK()
	{
		return this;
	}
	
	/*@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("Id : " + hoSoDangKyId);
		wrkStr.append("\r\n");
		wrkStr.append("Tên : " + hoSoDangKyTen);
		wrkStr.append("\r\n");
		wrkStr.append("Mã : " + hoSoDangKyMa);
		wrkStr.append("\r\n");
		if(ngayDangKy!=null) {
			wrkStr.append("Ngày đăng ký : " + Consts.ConvertUtilToString(ngayDangKy));
			wrkStr.append("\r\n");
		}
		if(ngayHetHan!=null) {
			wrkStr.append("Ngày hết hạn : " + Consts.ConvertUtilToString(ngayHetHan));
			wrkStr.append("\r\n");
		}
		wrkStr.append("Loại giấy tờ Id : "+loaiGiayToId);
		return wrkStr.toString();
	}*/
	
	public Map<Object,Object> toMap(){
		Map<Object,Object> hsdk = new HashMap<Object,Object>();
		hsdk.put("stt", "");
		hsdk.put("id", this.hoSoDangKyId);
		hsdk.put("ten", this.hoSoDangKyTen);
		hsdk.put("ma", this.hoSoDangKyMa);
		hsdk.put("ngayDangKy", Consts.ConvertUtilToString(this.ngayDangKy));
		hsdk.put("ngayHetHan", Consts.ConvertUtilToString(this.ngayHetHan));
		hsdk.put("loaiGiayTo", this.loaiGiayToId);
		return hsdk;
		
	}
}

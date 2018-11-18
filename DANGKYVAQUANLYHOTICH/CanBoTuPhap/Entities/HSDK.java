package Entities;

import java.util.Date;

public class HSDK {
	private int hoSoDangKyId;
	private String hoSoDangKyTen;
	private String hoSoDangKyMa;
	private Date ngayDangKy;
	private Date ngayHetHan;
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
	public Date getNgayHetHan() {
		return ngayHetHan;
	}
	public HSDK(int hoSoDangKyId, String hoSoDangKyTen, String hoSoDangKyMa, Date ngayDangKy, Date ngayHetHan) {
		super();
		this.hoSoDangKyId = hoSoDangKyId;
		this.hoSoDangKyTen = hoSoDangKyTen;
		this.hoSoDangKyMa = hoSoDangKyMa;
		this.ngayDangKy = ngayDangKy;
		this.ngayHetHan = ngayHetHan;
	}
	private HSDK() {
		super();
	}
	
	public HSDK getHSDK()
	{
		return this;
	}
}

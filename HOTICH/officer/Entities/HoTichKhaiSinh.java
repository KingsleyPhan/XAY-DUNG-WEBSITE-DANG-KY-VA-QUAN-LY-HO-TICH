package Entities;

import java.util.Date;

import DAO.Consts;

public class HoTichKhaiSinh {
	private String ma;
	private String soQuyen;
	private CongDan doiTuongKhaiSinh;
	private CoSoYTe noiSinh;
	private CongDan cha;
	private CongDan me;
	private Date ngayKy;
	private String coQuan;
	private String ngXuLy;
	private String ngKy;
	private String ngYeuCau_Ten;
	
	public String getMa() {
		return ma;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getSoQuyen() {
		return soQuyen;
	}
	public void setSoQuyen(String soQuyen) {
		this.soQuyen = soQuyen;
	}
	public CongDan getDoiTuongKhaiSinh() {
		return doiTuongKhaiSinh;
	}
	public void setDoiTuongKhaiSinh(CongDan doiTuongKhaiSinh) {
		this.doiTuongKhaiSinh = doiTuongKhaiSinh;
	}
	public CoSoYTe getNoiSinh() {
		return noiSinh;
	}
	public void setNoiSinh(CoSoYTe noiSinh) {
		this.noiSinh = noiSinh;
	}
	public CongDan getCha() {
		return cha;
	}
	public void setCha(CongDan cha) {
		this.cha = cha;
	}
	public CongDan getMe() {
		return me;
	}
	public void setMe(CongDan me) {
		this.me = me;
	}
	public Date getNgayKy() {
		return ngayKy;
	}
	public String getNgayKySring() {
		return Consts.ConvertUtilToString(ngayKy);
	}
	public void setNgayKy(Date ngayKy) {
		this.ngayKy = ngayKy;
	}
	public String getNgXuLy() {
		return ngXuLy;
	}
	public void setNgXuLy(String ngXuLy) {
		this.ngXuLy = ngXuLy;
	}
	public String getNgKy() {
		return ngKy;
	}
	public void setNgKy(String ngKy) {
		this.ngKy = ngKy;
	}
	
	
	public String getCoQuan() {
		return coQuan;
	}
	public void setCoQuan(String coQuan) {
		this.coQuan = coQuan;
	}
	public String getNgYeuCau_Ten() {
		return ngYeuCau_Ten;
	}
	public void setNgYeuCau_Ten(String ngYeuCau_Ten) {
		this.ngYeuCau_Ten = ngYeuCau_Ten;
	}
	public HoTichKhaiSinh(String ma, String soQuyen, CongDan doiTuongKhaiSinh, CoSoYTe noiSinh, CongDan cha, CongDan me,
			Date ngayKy, String coQuan, String ngXuLy, String ngKy, String ngYeuCau_Ten) {
		super();
		this.ma = ma;
		this.soQuyen = soQuyen;
		this.doiTuongKhaiSinh = doiTuongKhaiSinh;
		this.noiSinh = noiSinh;
		this.cha = cha;
		this.me = me;
		this.ngayKy = ngayKy;
		this.coQuan = coQuan;
		this.ngXuLy = ngXuLy;
		this.ngKy = ngKy;
		this.ngYeuCau_Ten = ngYeuCau_Ten;
	}
}

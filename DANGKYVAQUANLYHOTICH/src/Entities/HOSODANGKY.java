package Entities;

public class HOSODANGKY {
	
	private int HoSo_ID;
	private int TrangThai_ID;
	private String NgayDangKy;
	private String NgayHetHan;
	private COQUAN CoQuan;
	private LOAIDANGKY LoaiDangKy;
	
	public int getHoSo_ID() {
		return HoSo_ID;
	}
	public void setHoSo_ID(int hoSo_ID) {
		HoSo_ID = hoSo_ID;
	}
	public int getTrangThai_ID() {
		return TrangThai_ID;
	}
	public void setTrangThai_ID(int trangThai_ID) {
		TrangThai_ID = trangThai_ID;
	}
	public String getNgayDangKy() {
		return NgayDangKy;
	}
	public void setNgayDangKy(String ngayDangKy) {
		NgayDangKy = ngayDangKy;
	}
	public String getNgayHetHan() {
		return NgayHetHan;
	}
	public void setNgayHetHan(String ngayHetHan) {
		NgayHetHan = ngayHetHan;
	}
	
	public COQUAN getCoQuan() {
		return CoQuan;
	}
	public void setCoQuan(COQUAN coQuan) {
		CoQuan = coQuan;
	}
	public LOAIDANGKY getLoaiDangKy() {
		return LoaiDangKy;
	}
	public void setLoaiDangKy(LOAIDANGKY loaiDangKy) {
		LoaiDangKy = loaiDangKy;
	}
	
	

}

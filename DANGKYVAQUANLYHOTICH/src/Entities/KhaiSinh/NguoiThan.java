package Entities.KhaiSinh;

public class NguoiThan 
{
	
	private String  HoVaTen;
	private String  NgaySinh;
	private String  CMND;
	private String  NoiCap;
	private String  NgayCap;
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
	public String getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
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
		System.out.println(this.HoVaTen);
		System.out.println(this.CMND);
		System.out.println(this.NgayCap);
		System.out.println(this.NoiCap);
		System.out.println(this.DanToc);
		System.out.println(this.QuocTich);
		System.out.println(this.TP);
		System.out.println(this.Quan);
		System.out.println(this.Phuong);
		System.out.println(this.DiaChi);
	}
	

}

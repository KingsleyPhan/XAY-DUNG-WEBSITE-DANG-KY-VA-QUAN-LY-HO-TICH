package Entities.KhaiSinh;

public class NguoiYeuCau {
	private String HoVaTen;
	private String CMND;
	private String NoiCap;
	private String NgayCap;
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

	public String getNgayCap() {
		return NgayCap;
	}

	public void setNgayCap(String ngayCap) {
		NgayCap = ngayCap;
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
		System.out.println(this.HoVaTen);
		System.out.println(this.CMND);
		System.out.println(this.NgayCap);
		System.out.println(this.NoiCap);
		System.out.println(this.QuanHe);
		System.out.println(this.QuocTich);
		System.out.println(this.TP);
		System.out.println(this.Quan);
		System.out.println(this.Phuong);
		System.out.println(this.DiaChi);
		
	}

}

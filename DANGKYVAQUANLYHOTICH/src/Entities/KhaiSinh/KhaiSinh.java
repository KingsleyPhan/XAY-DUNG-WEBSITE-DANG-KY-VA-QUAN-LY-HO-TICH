package Entities.KhaiSinh;

public class KhaiSinh {

	private String HoVaTen;
	private String GioiTinh;
	private String NgaySinh;
	private String DanToc;
	private String QuocTich;
	private String TP;
	private String Quan;
	private String Phuong;
	private String DiaChi;
	private String CoSoSinhSan;
	private String QuocTich_CSSS;
	private String TP_CSSS;
	private String Quan_CSSS;
	private String Phuong_CSSS;
	private String DiaChi_CSSS;

	public String getHoVaTen() {
		return HoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}

	public String getGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public String getNgaySinh() {
		return NgaySinh;
	}

	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
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

	public void setPhuong(String huyen) {
		Phuong = huyen;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getCoSoSinhSan() {
		return CoSoSinhSan;
	}

	public void setCoSoSinhSan(String coSoSinhSan) {
		CoSoSinhSan = coSoSinhSan;
	}

	public String getQuocTich_CSSS() {
		return QuocTich_CSSS;
	}

	public void setQuocTich_CSSS(String quocTich_CSSS) {
		QuocTich_CSSS = quocTich_CSSS;
	}

	public String getTP_CSSS() {
		return TP_CSSS;
	}

	public void setTP_CSSS(String tP_CSSS) {
		TP_CSSS = tP_CSSS;
	}

	public String getQuan_CSSS() {
		return Quan_CSSS;
	}

	public void setQuan_CSSS(String quan_CSSS) {
		Quan_CSSS = quan_CSSS;
	}

	public String getPhuong_CSSS() {
		return Phuong_CSSS;
	}

	public void setPhuong_CSSS(String huyen_CSSS) {
		Phuong_CSSS = huyen_CSSS;
	}

	public String getDiaChi_CSSS() {
		return DiaChi_CSSS;
	}

	public void setDiaChi_CSSS(String diaChi_CSSS) {
		DiaChi_CSSS = diaChi_CSSS;
	}
	
	public void showImfor()
	{
		System.out.println("NGƯỜI ĐƯỢC KHAI SINH");
		System.out.println(this.HoVaTen);
		System.out.println(this.NgaySinh);
		System.out.println(this.GioiTinh);
		System.out.println(this.DanToc);
		System.out.println(this.QuocTich);
		System.out.println(this.TP);
		System.out.println(this.Quan);
		System.out.println(this.Phuong);
		System.out.println(this.DiaChi);
		System.out.println(this.CoSoSinhSan);
		System.out.println(this.QuocTich_CSSS);
		System.out.println(this.TP_CSSS);
		System.out.println(this.Quan_CSSS);
		System.out.println(this.Phuong_CSSS);
		System.out.println(this.DiaChi_CSSS);
	}

}

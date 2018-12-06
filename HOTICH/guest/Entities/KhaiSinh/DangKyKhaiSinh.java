package Entities.KhaiSinh;

public class DangKyKhaiSinh 
{
	
	public KhaiSinh getDoiTuongSinh() {
		return DoiTuongSinh;
	}

	public void setDoiTuongSinh(KhaiSinh doiTuongSinh) {
		DoiTuongSinh = doiTuongSinh;
	}

	public NguoiYeuCau getNguoiYeuCau() {
		return NguoiYeuCau;
	}

	public void setNguoiYeuCau(NguoiYeuCau nguoiYeuCau) {
		NguoiYeuCau = nguoiYeuCau;
	}

	public NguoiThan getCha() {
		return Cha;
	}

	public void setCha(NguoiThan cha) {
		Cha = cha;
	}

	public NguoiThan getMe() {
		return Me;
	}

	public void setMe(NguoiThan me) {
		Me = me;
	}
	
	private KhaiSinh DoiTuongSinh;
	private NguoiYeuCau NguoiYeuCau;
	private NguoiThan Cha;
	private NguoiThan Me;
	
	public boolean IsEmty = true;
	
	public DangKyKhaiSinh()
	{
	   DoiTuongSinh = new  KhaiSinh();
	   NguoiYeuCau = new NguoiYeuCau();
	   Cha = new NguoiThan();
	   Me = new NguoiThan();
	}
	
	public DangKyKhaiSinh(NguoiYeuCau NYC, KhaiSinh KS, NguoiThan CHA, NguoiThan ME)
	{
	   this.NguoiYeuCau = NYC;
	   this.DoiTuongSinh = KS;
	   this.Cha = CHA;
	   this.Me = ME;
	}
	
	public void ShowDangKyKhaiSinh()
	{
		NguoiYeuCau.showImfor();
		DoiTuongSinh.showImfor();
		Cha.showImfor();
		Me.showImfor();
	}
}

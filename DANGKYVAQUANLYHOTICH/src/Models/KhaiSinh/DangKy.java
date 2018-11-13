package Models.KhaiSinh;

public class DangKy 
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

	public Parents getCha() {
		return Cha;
	}

	public void setCha(Parents cha) {
		Cha = cha;
	}

	public Parents getMe() {
		return Me;
	}

	public void setMe(Parents me) {
		Me = me;
	}
	
	private KhaiSinh DoiTuongSinh;
	private NguoiYeuCau NguoiYeuCau;
	private Parents Cha;
	private Parents Me;
	
	public DangKy()
	{
	   DoiTuongSinh = new  KhaiSinh();
	   NguoiYeuCau = new NguoiYeuCau();
	   Cha = new Parents();
	   Me = new Parents();
	}
	
	
	public void ShowDangKyKhaiSinh()
	{
//		DoiTuongSinh.Show();
//		NguoiYeuCau.Show();
//		Cha.Show();
//		Me.Show();
	}
}

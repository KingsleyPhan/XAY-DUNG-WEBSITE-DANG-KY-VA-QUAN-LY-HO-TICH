package Entities.TrichLuc;
import Entities.KhaiSinh.NguoiYeuCau;

public class DangKyTrichLuc 
{
	NguoiYeuCau NYC;
	TrichLuc TrichLuc;
	
	public DangKyTrichLuc(NguoiYeuCau nguoiyeucau, TrichLuc trichluc)
	{
		this.NYC = nguoiyeucau;
		this.TrichLuc = trichluc;
	}

}

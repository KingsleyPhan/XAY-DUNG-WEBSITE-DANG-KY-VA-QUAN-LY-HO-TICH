package Entities.KhaiTu;
import Entities.KhaiSinh.NguoiYeuCau;

public class DangKyKhaiTu 
{
	 private NguoiYeuCau NYC;
	 private NguoiQuaDoi NQD;
	 
	 public DangKyKhaiTu(NguoiYeuCau nguoiyeucau, NguoiQuaDoi nguoiquadoi)
	 {
		 this.NQD = nguoiquadoi;
		 this.NYC = nguoiyeucau;
	 }

}

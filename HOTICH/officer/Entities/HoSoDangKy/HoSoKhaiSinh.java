package Entities.HoSoDangKy;

import Entities.CoSoYTe;
import Entities.CongDan;
import Entities.HSDK;

public class HoSoKhaiSinh {
	private HSDK hsdk;
	private CongDan ngYeuCau;
	private String quanHe;
	private CongDan doiTuongKhaiSinh;
	private CoSoYTe noiSinh;
	private CongDan cha;
	private CongDan me;
	private byte[] fileGiayChungSinh;

	public HSDK getHsdk() {
		return hsdk;
	}

	public CongDan getNgYeuCau() {
		return ngYeuCau;
	}

	public CongDan getDoiTuongKhaiSinh() {
		return doiTuongKhaiSinh;
	}

	public CongDan getCha() {
		return cha;
	}

	public CongDan getMe() {
		return me;
	}
	public String getQuanHe() {
		return quanHe;
	}
	
	public CoSoYTe getNoiSinh() {
		return noiSinh;
	}

	public byte[] getFileGiayChungSinh() {
		return fileGiayChungSinh;
	}
	
	

	public HoSoKhaiSinh(HSDK hsdk, CongDan ngYeuCau, String quanHe, CongDan doiTuongKhaiSinh, CoSoYTe noiSinh,
			CongDan cha, CongDan me, byte[] fileGiayChungSinh) {
		super();
		this.hsdk = hsdk;
		this.ngYeuCau = ngYeuCau;
		this.quanHe = quanHe;
		this.doiTuongKhaiSinh = doiTuongKhaiSinh;
		this.noiSinh = noiSinh;
		this.cha = cha;
		this.me = me;
		this.fileGiayChungSinh = fileGiayChungSinh;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		if(hsdk != null) {
			wrkStr.append("Hồ sơ đăng ký : " + hsdk.toString());
			wrkStr.append("\r\n");
		}
		if(ngYeuCau != null) {
			wrkStr.append("Người yêu cầu : " + ngYeuCau.toString());
			wrkStr.append("\r\n");
		}
		wrkStr.append("Quan hệ : " + quanHe);
		wrkStr.append("\r\n");
		if(doiTuongKhaiSinh != null) {
			wrkStr.append("Đối tượng khai sinh : " + doiTuongKhaiSinh.toString());
			wrkStr.append("\r\n");
		}
		if(cha != null) {
			wrkStr.append("Cha : " + cha.toString());
			wrkStr.append("\r\n");
		}
		if(me!= null) {
			wrkStr.append("Mẹ : "+me.toString());
			wrkStr.append("\r\n");
		}
		wrkStr.append("File giấy chứng sinh : "+fileGiayChungSinh);
		return wrkStr.toString();
	}
}

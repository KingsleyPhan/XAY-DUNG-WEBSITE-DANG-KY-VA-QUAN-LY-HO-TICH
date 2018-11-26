package Entities;

import java.util.Date;

import DAO.Consts;

public class CongDan {
	private String hoVaTen;
	private Date ngaySinh;
	private Boolean gioiTinh;
	private String queQuan;
	private String quocTich;
	private String danToc;
	private CMND cmnd;
	private DiaChi diaChi;
	private CoSoYTe noiSinh;
	private DiaChi queQuanKhaiSinh;

	public String getHoVaTen() {
		return hoVaTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public Boolean getGioiTinh() {
		return gioiTinh;
	}

	public String getQueQuan() {
		return queQuan;
	}

	public String getQuocTich() {
		return quocTich;
	}

	public String getDanToc() {
		return danToc;
	}

	public CMND getCmnd() {
		return cmnd;
	}

	public DiaChi getDiaChi() {
		return diaChi;
	}

	public CoSoYTe getNoiSinh() {
		return noiSinh;
	}

	public DiaChi getQueQuanKhaiSinh() {
		return queQuanKhaiSinh;
	}

	// Dùng để hứng dữ liệu của con - giấy khai sinh
	public CongDan(String hoVaTen, Date ngaySinh, Boolean gioiTinh, String quocTich, String danToc) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
	}

	// Dùng để hứng dữ liệu của cha, mẹ - giấy khai sinh
	public CongDan(String hoVaTen, String quocTich, String danToc) {
		super();
		this.hoVaTen = hoVaTen;
		this.quocTich = quocTich;
		this.danToc = danToc;
	}

	// Dùng để hứng dữ liệu vợ, chồng
	// Dùng để hứng dữ liệu cha, mẹ hồ sơ đăng ký khai sinh
	public CongDan(String hoVaTen, Date ngaySinh, String danToc, CMND cmnd, String quocTich, DiaChi diaChi) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
		this.cmnd = cmnd;
		this.diaChi = diaChi;
	}

	// Dùng để hứng dữ liệu của người mất
	public CongDan(String hoVaTen, Date ngaySinh, Boolean gioiTinh, String quocTich, String danToc, CMND cmnd,
			DiaChi diaChi) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
		this.cmnd = cmnd;
		this.diaChi = diaChi;
	}
	
	// Dùng để hứng dữ liệu người yêu cầu
	public CongDan(String hoVaTen, CMND cmnd, String quocTich, DiaChi diaChi) {
		super();
		this.hoVaTen = hoVaTen;
		this.quocTich = quocTich;
		this.cmnd = cmnd;
		this.diaChi = diaChi;
	}

	//Dùng để hứng đối tượng khai sinh - hồ sơ đăng ký khai sinh
	public CongDan(String hoVaTen, Boolean gioiTinh, Date ngaySinh, String danToc, String quocTich, DiaChi queQuanKhaiSinh,
			CoSoYTe noiSinh) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
		this.noiSinh = noiSinh;
		this.queQuanKhaiSinh = queQuanKhaiSinh;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("Họ và tên : " + hoVaTen);
		wrkStr.append("\r\n");
		if(ngaySinh!=null) {
			wrkStr.append("Ngày sinh : " + Consts.ConvertUtilToString(ngaySinh));
			wrkStr.append("\r\n");
		}
		wrkStr.append("Giới tính : " + gioiTinh);
		wrkStr.append("\r\n");
		wrkStr.append("Quê quán : " + queQuan);
		wrkStr.append("\r\n");
		wrkStr.append("Quốc tịch : " + quocTich);
		wrkStr.append("\r\n");
		wrkStr.append("Dân tộc : "+danToc);
		wrkStr.append("\r\n");
		if (cmnd != null){
			wrkStr.append("CMND : "+cmnd.toString());
			wrkStr.append("\r\n");
		}
		if(diaChi != null) {
			wrkStr.append("Địa chỉ : "+diaChi.toString());
			wrkStr.append("\r\n");
		}
		if(noiSinh != null) {
			wrkStr.append("Nơi sinh : "+noiSinh.toString());
			wrkStr.append("\r\n");
		}
		if(queQuanKhaiSinh != null) {
			wrkStr.append("Quê quán khai sinh : "+queQuanKhaiSinh.toString());
		}
		return wrkStr.toString();
	}

	
}

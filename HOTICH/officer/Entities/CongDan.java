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
	private int id;
	private int tinhTrangHonNhan;
	private Boolean conSong;

	public String getHoVaTen() {
		return hoVaTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}
	
	public String getNgaySinhString() {
		return Consts.ConvertUtilToString(ngaySinh);
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
	
	public int getId() {
		return id;
	}
	
	public int getTinhTrangHonNhan() {
		return tinhTrangHonNhan;
	}

	public Boolean getConSong() {
		return conSong;
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
	
	public CongDan(String hoVaTen, Date ngaySinh, Boolean gioiTinh, String queQuan, String quocTich, String danToc,
			CMND cmnd, DiaChi diaChi, int id, int tinhTrangHonNhan) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.queQuan = queQuan;
		this.quocTich = quocTich;
		this.danToc = danToc;
		this.cmnd = cmnd;
		this.diaChi = diaChi;
		this.id = id;
		this.tinhTrangHonNhan = tinhTrangHonNhan;
		this.conSong = true;
	}
	
	public String toStringBuilder() {
		StringBuilder congDan = new StringBuilder();
		congDan.append("{");
		congDan.append("\"id\":\""+this.id+"\",");
		congDan.append("\"hoVaTen\":\""+this.hoVaTen+"\",");
		congDan.append("\"ngaySinh\":\""+Consts.ConvertUtilToString(this.ngaySinh)+"\",");
		if(this.gioiTinh){
			congDan.append("\"gioiTinh\":\""+1+"\",");
		}
		else {
			congDan.append("\"gioiTinh\":\""+0+"\",");
		}
		congDan.append("\"queQuan\":\""+this.queQuan+"\",");
		congDan.append("\"quocTich\":\""+this.quocTich+"\",");
		congDan.append("\"danToc\":\""+this.danToc+"\",");
		congDan.append("\"cmndSo\":\""+this.cmnd.getSo()+"\",");
		congDan.append("\"cmndNgayCap\":\""+Consts.ConvertUtilToString(this.cmnd.getNgayCap())+"\",");
		congDan.append("\"cmndNoiCap\":\""+this.cmnd.getNoiCap()+"\",");
		congDan.append("\"thanhPho\":\""+this.diaChi.getThanhPho()+"\",");
		congDan.append("\"quan\":\""+this.diaChi.getQuan()+"\",");
		congDan.append("\"phuong\":\""+this.diaChi.getPhuong()+"\",");
		congDan.append("\"diachi\":\""+this.diaChi.getSoDuong()+"\",");
		congDan.append("\"tinhTrangHonNhan\":\""+this.tinhTrangHonNhan+"\",");
		congDan.append("\"conSong\":\""+this.conSong.toString()+"\"");
		congDan.append("}");
		return congDan.toString();
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

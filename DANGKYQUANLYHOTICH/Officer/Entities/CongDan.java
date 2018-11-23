package Entities;

import java.util.Date;

public class CongDan {
	private String hoVaTen;
	private Date ngaySinh;
	private String gioiTinh;
	private String queQuan;
	private String quocTich;
	private String danToc;
	private CMND cmnd;
	private DiaChi diaChi;
	public String getHoVaTen() {
		return hoVaTen;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public String getGioiTinh() {
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
	
	//Dùng để hứng dữ liệu của con - khái sinh
	public CongDan(String hoVaTen, Date ngaySinh, String gioiTinh, String quocTich, String danToc) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
	}
	//Dùng để hứng dữ liệu của cha, mẹ - khái sinh
	public CongDan(String hoVaTen, String quocTich, String danToc) {
		super();
		this.hoVaTen = hoVaTen;
		this.quocTich = quocTich;
		this.danToc = danToc;
	}
	// Dùng để hứng dữ liệu vợ, chồng
	public CongDan(String hoVaTen, Date ngaySinh, String quocTich, String danToc, CMND cmnd, DiaChi diaChi) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.quocTich = quocTich;
		this.danToc = danToc;
		this.cmnd = cmnd;
		this.diaChi = diaChi;
	}
	//Dùng để hứng dữ liệu của người mất
	private CongDan(String hoVaTen, Date ngaySinh, String gioiTinh, String quocTich, String danToc, CMND cmnd,
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
	
	
	
	
	
}

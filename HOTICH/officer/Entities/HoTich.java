package Entities;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import DAO.Consts;

public class HoTich {
	
	private int ID;
	private int giayToID;
	private int hoSoDangKyID;
	private COQUAN coQuan;
	private int loaiGiayToID;
	private String ma;
	private String soQuyen;
	private Date ngayKy;
	private NGUOIDUNG nguoiXuLy;
	private NGUOIDUNG nguoiKy;
	public int getID() {
		return ID;
	}
	public int getGiayToID() {
		return giayToID;
	}
	public int getHoSoDangKyID() {
		return hoSoDangKyID;
	}
	
	public int getLoaiGiayToID() {
		return loaiGiayToID;
	}
	public String getMa() {
		return ma;
	}
	public String getSoQuyen() {
		return soQuyen;
	}
	public Date getNgayKy() {
		return ngayKy;
	}
	
	public COQUAN getCoQuan() {
		return coQuan;
	}
	public NGUOIDUNG getNguoiXuLy() {
		return nguoiXuLy;
	}
	public NGUOIDUNG getNguoiKy() {
		return nguoiKy;
	}
	
	public HoTich(int iD, int giayToID, int hoSoDangKyID, COQUAN coQuan, int loaiGiayToID, String ma, String soQuyen,
			Date ngayKy, NGUOIDUNG nguoiXuLy, NGUOIDUNG nguoiKy) {
		super();
		ID = iD;
		this.giayToID = giayToID;
		this.hoSoDangKyID = hoSoDangKyID;
		this.coQuan = coQuan;
		this.loaiGiayToID = loaiGiayToID;
		this.ma = ma;
		this.soQuyen = soQuyen;
		this.ngayKy = ngayKy;
		this.nguoiXuLy = nguoiXuLy;
		this.nguoiKy = nguoiKy;
	}
	
	/*public String toJson() {
		StringBuilder hoTich = new StringBuilder();
		hoTich.append("{");
		hoTich.append("\"stt\":\"\",");
		hoTich.append("\"id\":\""+this.ID+"\",");
		hoTich.append("\"giayToID\":\""+this.giayToID+"\",");
		hoTich.append("\"hoSoDangKyID\":\""+this.hoSoDangKyID+"\",");
		hoTich.append("\"coQuanID\":\""+this.coQuan.getCoQuan_ID()+"\",");
		hoTich.append("\"loaiGiayToID\":\""+this.loaiGiayToID+"\",");
		hoTich.append("\"ma\":\""+this.ma+"\",");
		hoTich.append("\"soQuyen\":\""+this.soQuyen+"\",");
		hoTich.append("\"ngayKy\":\""+Consts.ConvertUtilToString(this.ngayKy)+"\",");
		hoTich.append("\"nguoiXuLy\":\""+this.nguoiXuLy.getHoVaTen()+"\",");
		hoTich.append("\"nguoiKy\":\""+this.nguoiKy.getHoVaTen()+"\"");
		hoTich.append("}");
		return hoTich.toString();
	}*/
	
	public Map<Object,Object> toMap(){
		Map<Object,Object> hotich = new HashMap<Object,Object>();
		hotich.put("stt", "");
		hotich.put("id", this.ID);
		hotich.put("giayToID", this.giayToID);
		hotich.put("hoSoDangKyID", this.hoSoDangKyID);
		hotich.put("coQuanID", this.coQuan.getCoQuan_ID());
		hotich.put("loaiGiayToID", this.loaiGiayToID);
		hotich.put("ma", this.ma);
		hotich.put("soQuyen", this.soQuyen);
		hotich.put("ngayKy", Consts.ConvertUtilToString(this.ngayKy));
		hotich.put("nguoiXuLy", this.nguoiXuLy.getHoVaTen());
		hotich.put("nguoiKy", this.nguoiKy.getHoVaTen());
		return hotich;
	}
	
	/*@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("ID : " + ID);
		wrkStr.append("\r\n");
		wrkStr.append("Giấy tờ hộ tịch ID : " + giayToID);
		wrkStr.append("\r\n");
		wrkStr.append("Hồ sơ đăng ký ID : " + hoSoDangKyID);
		wrkStr.append("\r\n");
		wrkStr.append("Cơ quan ID : "+coQuan.getCoQuan_ID());
		wrkStr.append("\r\n");
		wrkStr.append("Loại giấy tờ ID : "+loaiGiayToID);
		wrkStr.append("\r\n");
		wrkStr.append("Mã : "+ma);
		wrkStr.append("\r\n");
		wrkStr.append("Số quyển : "+soQuyen);
		wrkStr.append("\r\n");
		wrkStr.append("Ngày ký : "+Consts.ConvertUtilToString(ngayKy));
		wrkStr.append("\r\n");
		wrkStr.append("Người xử lý : "+nguoiXuLy.getHoVaTen());
		wrkStr.append("\r\n");
		wrkStr.append("Người ký : "+nguoiKy.getHoVaTen());
		wrkStr.append("\r\n");
		return wrkStr.toString();
	}*/
}

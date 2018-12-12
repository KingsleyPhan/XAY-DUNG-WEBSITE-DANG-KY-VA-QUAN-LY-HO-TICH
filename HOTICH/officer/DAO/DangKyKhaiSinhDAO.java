package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;

import Entities.CMND;
import Entities.CoSoYTe;
import Entities.CongDan;
import Entities.DiaChi;
import Entities.HSDK;
import Entities.HoSoDangKy.HoSoKhaiSinh;
import Entities.KhaiSinh.DangKyKhaiSinh;

public class DangKyKhaiSinhDAO extends ConnectDAO {

	public DangKyKhaiSinhDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
		// TODO Auto-generated constructor stub
	}

	public HoSoKhaiSinh getHSDKKhaiSinh(int id) throws SQLException, ParseException {
		Connection();
		String sql = "SELECT * FROM GET_HOSO_DANGKY_KHAISINH(?)";
		PreparedStatement pstm = DBConnection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery();
		if (rs.next()) {
			HSDK hsdk = new HSDK(id,1);
			
			String ngYeuCau_Ten = rs.getString(2);
			String ngYeuCau_CMND = rs.getString(3);
			Date ngYeuCau_CMND_NgayCap = rs.getDate(4);
			String ngYeuCau_CMND_NoiCap = rs.getString(5);
			String ngYeuCau_QuocTich = rs.getString(6);
			
			//Địa chỉ người yêu cầu
			String ngYeuCau_ThanhPho = rs.getString(7);
			String ngYeuCau_Quan = rs.getString(8);
			String ngYeuCau_Phuong = rs.getString(9);
			String ngYeuCau_DiaChi = rs.getString(10);
			
			String ngYeuCau_QuanHe = rs.getString(11);

			String doiTuongKhaiSinh_Ten = rs.getString(12);
			Boolean doiTuongKhaiSinh_GioiTinh = rs.getBoolean(13);
			Date doiTuongKhaiSinh_NgaySinh = rs.getDate(14);
			String doiTuongKhaiSinh_DanToc = rs.getString(15);
			String doiTuongKhaiSinh_QuocTich = rs.getString(16);

			//Quê quán
			String doiTuongKhaiSinh_QueQuan_ThanhPho = rs.getString(17);
			String doiTuongKhaiSinh_QueQuan_Quan = rs.getString(18); 
			String doiTuongKhaiSinh_QueQuan_Phuong = rs.getString(19);
			String doiTuongKhaiSinh_QueQuan_DiaChi = rs.getString(20);

			//Nơi sinh
			String doiTuongKhaiSinh_NoiSinh = rs.getString(21);
			String doiTuongKhaiSinh_NoiSinh_QuocGia = rs.getString(22);
			String doiTuongKhaiSinh_NoiSinh_ThanhPho = rs.getString(23); 
			String doiTuongKhaiSinh_NoiSinh_Quan = rs.getString(24);
			String doiTuongKhaiSinh_NoiSinh_Phuong = rs.getString(25); 
			String doiTuongKhaiSinh_NoiSinh_DiaChi = rs.getString(26); 

			String me_Ten = rs.getString(27);
			Date me_NgaySinh = rs.getDate(28);
			String me_DanToc = rs.getString(29);
			String me_CMND = rs.getString(30);
			Date me_CMND_NgayCap = rs.getDate(31);
			String me_CMND_NoiCap = rs.getString(32);
			String me_QuocTich = rs.getString(33);
			//Địa chỉ của mẹ
			String me_ThanhPho = rs.getString(34);
			String me_Quan = rs.getString(35);
			String me_Phuong = rs.getString(36);
			String me_DiaChi = rs.getString(37);

			String cha_Ten = rs.getString(38);
			Date cha_NgaySinh = rs.getDate(39);
			String cha_DanToc = rs.getString(40);
			String cha_CMND = rs.getString(41);
			Date cha_CMND_NgayCap = rs.getDate(42);
			String cha_CMND_NoiCap = rs.getString(43);
			String cha_QuocTich = rs.getString(44);
			//Địa chỉ của cha
			String cha_ThanhPho = rs.getString(45);
			String cha_Quan = rs.getString(46);
			String cha_Phuong = rs.getString(47);
			String cha_DiaChi = rs.getString(48);

			byte[] FILE_GIAYCHUNGSINH = rs.getBytes(49);
			
			CongDan ngYeuCau = 
					new CongDan(
							ngYeuCau_Ten
							, new CMND(ngYeuCau_CMND, ngYeuCau_CMND_NgayCap, ngYeuCau_CMND_NoiCap)
							, ngYeuCau_QuocTich
							, new DiaChi(ngYeuCau_ThanhPho, ngYeuCau_Quan, ngYeuCau_Phuong, ngYeuCau_DiaChi)
							);
			CongDan doiTuongKhaiSinh = 
					new CongDan(
							doiTuongKhaiSinh_Ten
							, doiTuongKhaiSinh_GioiTinh
							, doiTuongKhaiSinh_NgaySinh
							, doiTuongKhaiSinh_DanToc
							, doiTuongKhaiSinh_QuocTich
							, new DiaChi(doiTuongKhaiSinh_QueQuan_ThanhPho, doiTuongKhaiSinh_QueQuan_Quan, doiTuongKhaiSinh_QueQuan_Phuong, doiTuongKhaiSinh_QueQuan_DiaChi)
							);
			CoSoYTe noiSinh = new CoSoYTe(doiTuongKhaiSinh_NoiSinh, new DiaChi(doiTuongKhaiSinh_NoiSinh_QuocGia, doiTuongKhaiSinh_NoiSinh_ThanhPho, doiTuongKhaiSinh_NoiSinh_Quan, doiTuongKhaiSinh_NoiSinh_Phuong, doiTuongKhaiSinh_NoiSinh_DiaChi));
			CongDan me = null;
			
			if (me_Ten != null && !me_Ten.trim().equals("")) {
				me = new CongDan(
						me_Ten
						, me_NgaySinh
						, me_DanToc
						, new CMND(me_CMND, me_CMND_NgayCap, me_CMND_NoiCap)
						, me_QuocTich
						, new DiaChi(me_ThanhPho, me_Quan, me_Phuong, me_DiaChi)
						);
			}
			CongDan cha = null;
			if (cha_Ten != null && !cha_Ten.trim().equals("") ) {
				cha = new CongDan(
						cha_Ten
						, cha_NgaySinh
						, cha_DanToc
						, new CMND(cha_CMND, cha_CMND_NgayCap, cha_CMND_NoiCap)
						, cha_QuocTich
						, new DiaChi(cha_ThanhPho, cha_Quan, cha_Phuong, cha_DiaChi)
						);
			}
			
			return new HoSoKhaiSinh(hsdk, ngYeuCau, ngYeuCau_QuanHe, doiTuongKhaiSinh,noiSinh, cha, me,FILE_GIAYCHUNGSINH);
		}
		return null;
	}

	public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
		DangKyKhaiSinhDAO dangKyKhaiSinhDAO = new DangKyKhaiSinhDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		System.out.println(dangKyKhaiSinhDAO.getHSDKKhaiSinh(3).toString());
	}
}

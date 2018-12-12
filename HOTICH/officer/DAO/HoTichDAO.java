package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Entities.COQUAN;
import Entities.CoSoYTe;
import Entities.CongDan;
import Entities.DiaChi;
import Entities.HoTich;
import Entities.HoTichKhaiSinh;
import Entities.NGUOIDUNG;

public class HoTichDAO extends ConnectDAO{

	public HoTichDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}
	
	public HoTichDAO(Connection DBConnection) {
		super(DBConnection);
	}
	
	/*public List<HoTich> getAllHoTichCoQuan(int coQuanID) throws ClassNotFoundException, SQLException, ParseException {
		List<HoTich> DSHoTich = new ArrayList<>();
		Connection();
		String sql = "{CALL GET_HOTICH_COQUAN(?)}";
		CallableStatement cstm = DBConnection.prepareCall(sql);
		// Truyền tham số vào hàm (CoQuan_ID)
		cstm.setInt(1, coQuanID);
		ResultSet rs = cstm.executeQuery();
		while (rs.next()) {
			DSHoTich.add(
					new HoTich(rs.getInt(1)
							,rs.getInt(2)
							,rs.getInt(3)
							,new COQUAN(rs.getInt(4))
							,rs.getInt(5)
							,rs.getString(6)
							,rs.getString(7)
							,Consts.ConvertSQLtoUtilDate(rs.getDate(8))
							,new NGUOIDUNG(rs.getInt(9), rs.getString(11))
							,new NGUOIDUNG(rs.getInt(10), rs.getString(12))
							)
					);
		}
		cstm.close();
		DisConnection();
		return DSHoTich;
	}*/
	
	

	public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
		HoTichDAO hoTichDAO = new HoTichDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		try {
			System.out.println(hoTichDAO.insertHoTich(3, 1, 1, 1).toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Boolean insertHoTich(int idHSDK, int loai, int ngXuLy, int ngKy) throws Exception {
		try {
			String sql = "";
			switch (loai)
			{
			case 1:
				sql = "EXEC Add_Giay_Khaisinh ?,?,?";
				break;
			case 2:
				sql = "EXEC Add_Giay_Kethon ?,?,?";
				break;
			case 3:
				sql = "EXEC Add_Giay_Chungtu ?,?,?";
				break;
			default:
					return false;
			}
			PreparedStatement pstm = DBConnection.prepareStatement(sql);
			pstm.setInt(1, idHSDK);
			pstm.setInt(2, ngXuLy);
			pstm.setInt(3, ngKy);
			int result = pstm.executeUpdate();
			if(result != 0)
			{
				return true;
			}
			throw new Exception("Thêm không thành công, kiểm tra lại hệ thống");
		}catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	public List<Map<Object,Object>> getAllHoTich(int coQuanID) throws SQLException, ParseException{
		List<Map<Object,Object>> listHoTich = new ArrayList<Map<Object,Object>>();
		
		Connection();
		
		String sql = "{CALL GET_HOTICH_COQUAN(?)}";
		
		CallableStatement cstm = DBConnection.prepareCall(sql);
		
		cstm.setInt(1, coQuanID);
		
		ResultSet rs = cstm.executeQuery();
		
		while (rs.next()) {
			listHoTich.add(
					new HoTich(rs.getInt(1)
							,rs.getInt(2)
							,rs.getInt(3)
							,new COQUAN(rs.getInt(4))
							,rs.getInt(5)
							,rs.getString(6)
							,rs.getString(7)
							,Consts.ConvertSQLtoUtilDate(rs.getDate(8))
							,new NGUOIDUNG(rs.getInt(9), rs.getString(11))
							,new NGUOIDUNG(rs.getInt(10), rs.getString(12))
							).toMap()
					);
		}
		return listHoTich;
	}
	
	public HoTichKhaiSinh getGiayKhaiSinh(String ma, String soQuyen) {
		HoTichKhaiSinh giayKhaiSinh = null;
		try {
			Connection();
			
			String wrkSql = "EXEC TimKiem_HoTich ?,?";
			
			PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
			
			pstm.setString(1, ma);
			pstm.setString(2, soQuyen);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				int LOAI_ID = rs.getInt(1);
				String MA = rs.getString(2);
				String SOQUYEN = rs.getString(3);
				String HOTEN = rs.getString(4);
				Boolean GIOITINH = rs.getBoolean(5);
				Date NGAYSINH = Consts.ConvertSQLtoUtilDate(rs.getDate(6));
				String QUEQUAN = rs.getString(7);
				String NOISINH = rs.getString(8);
				String DANTOC = rs.getString(9);
				String QUOCTICH = rs.getString(10);
				String CHA_HOVATEN = rs.getString(11);
				String CHA_DANTOC = rs.getString(12);
				String CHA_QUOCTICH = rs.getString(13);
				String CHA_THANHPHO = rs.getString(14);
				String CHA_QUAN = rs.getString(15);
				String CHA_PHUONG = rs.getString(16);
				String CHA_DIACHI = rs.getString(17);
				String ME_HOVATEN = rs.getString(18);
				String ME_DANTOC = rs.getString(19);
				String ME_QUOCTICH = rs.getString(20);
				String ME_THANHPHO = rs.getString(21);
				String ME_QUAN = rs.getString(22);
				String ME_PHUONG = rs.getString(23);
				String ME_DIACHI = rs.getString(24);
				Date NGAY_KY = Consts.ConvertSQLtoUtilDate(rs.getDate(25));
				String NGUOI_XULY = rs.getString(26);
				String NGUOI_KY = rs.getString(27);
				String NOISINH_QUOCGIA = rs.getString(28);
				String NOISINH_THANHPHO = rs.getString(29);
				String NOISINH_QUAN = rs.getString(30);
				String NOISINH_PHUONG = rs.getString(31);
				String NOISINH_DIACHI = rs.getString(32);
				Date ME_NGAYSINH =Consts.ConvertSQLtoUtilDate(rs.getDate(33));
				Date CHA_NGAYSINH = Consts.ConvertSQLtoUtilDate(rs.getDate(34));
				String COQUAN_TEN = rs.getString(35);
				String NGUOIYEUCAU_TEN = rs.getString(36);
				
				
				
				giayKhaiSinh = new HoTichKhaiSinh(MA
												, SOQUYEN
												, new CongDan(HOTEN,NGAYSINH,GIOITINH, QUEQUAN, QUOCTICH, DANTOC)
												, new CoSoYTe(NOISINH, 
														new DiaChi(NOISINH_QUOCGIA, NOISINH_THANHPHO, NOISINH_QUAN, NOISINH_PHUONG, NOISINH_DIACHI))
												, new CongDan(CHA_HOVATEN,ME_NGAYSINH, CHA_QUOCTICH, CHA_DANTOC, 
														new DiaChi(CHA_THANHPHO, CHA_QUAN, CHA_PHUONG, CHA_DIACHI))
												, new CongDan(ME_HOVATEN,ME_NGAYSINH, ME_QUOCTICH, ME_DANTOC,
														new DiaChi(ME_THANHPHO, ME_QUAN, ME_PHUONG, ME_DIACHI))
												, NGAY_KY
												, COQUAN_TEN
												, NGUOI_XULY
												, NGUOI_KY
												,NGUOIYEUCAU_TEN);
				return giayKhaiSinh;
			}
		} catch (SQLException | ParseException e) {
			e.printStackTrace();
			return giayKhaiSinh;
		}
		return giayKhaiSinh;
	}
}

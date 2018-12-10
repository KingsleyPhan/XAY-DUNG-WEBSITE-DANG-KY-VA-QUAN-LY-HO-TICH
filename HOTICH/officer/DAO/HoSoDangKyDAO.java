package DAO;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import DAO.ConnectDAO;
import Entities.HSDK;

public class HoSoDangKyDAO extends ConnectDAO {

	public HoSoDangKyDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}
	
	public HoSoDangKyDAO(Connection DBConnection) {
		super(DBConnection);
	}

	/*public List<HSDK> getAllHSDKCoQuan(int coQuanID) throws ClassNotFoundException, SQLException {
		List<HSDK> DSHSDK = new ArrayList<>();
		// Lấy ra kết nối tới cơ sở dữ liệu.
		Connection();
		// Câu lệnh gọi thủ tục (***)
		String sql = "{CALL GET_HSDK_COQUAN(?)}";
		// Tạo một đối tượng CallableStatement.
		CallableStatement cstm = DBConnection.prepareCall(sql);
		// Truyền tham số vào hàm (CoQuan_ID)
		// (Là dấu chấm hỏi thứ 1 trên câu lệnh sql ***)
		cstm.setInt(1, coQuanID);
		// Thực thi câu lệnh
		ResultSet rs = cstm.executeQuery();
		while (rs.next()) {
			DSHSDK.add(
					new HSDK(rs.getInt("HOSO_DANGKY_ID")
							, rs.getString("LOAI_DANGKY_TEN")
							, rs.getString("HOSO_DANGKY_MA")
							, rs.getDate("HOSO_DANGKY_NGAY_DANGKY")
							, rs.getDate("HOSO_DANGKY_NGAY_HETHAN")
							, rs.getInt("LOAI_GIAYTO_ID")));
		}
		cstm.close();
		// Đóng kết nối
		DisConnection();
		return DSHSDK;
	}
	
	//Không dùng tới, được xử lý bởi datatable search
	public List<HSDK> getHSDKLoaiGiayTo(int coQuanID,int loaiGiayTo) throws ClassNotFoundException, SQLException {
		List<HSDK> DSHSDK = new ArrayList<>();
		// Lấy ra kết nối tới cơ sở dữ liệu.
		Connection();
		// Câu lệnh gọi thủ tục (***)
		String sql = "{CALL GET_HSDK_COQUAN_TUNGLOAI(?,?)}";
		// Tạo một đối tượng CallableStatement.
		CallableStatement cstm = DBConnection.prepareCall(sql);
		// Truyền tham số vào hàm (CoQuan_ID)
		// (Là dấu chấm hỏi thứ 1 trên câu lệnh sql ***)
		cstm.setInt(1, coQuanID);
		cstm.setInt(2, loaiGiayTo);
		// Thực thi câu lệnh
		ResultSet rs = cstm.executeQuery();
		while (rs.next()) {
			DSHSDK.add(
					new HSDK(rs.getInt("HOSO_DANGKY_ID")
							, rs.getString("LOAI_DANGKY_TEN")
							, rs.getString("HOSO_DANGKY_MA")
							, rs.getDate("HOSO_DANGKY_NGAY_DANGKY")
							, rs.getDate("HOSO_DANGKY_NGAY_HETHAN")
							, rs.getInt("LOAI_GIAYTO_ID")));
		}
		cstm.close();
		// Đóng kết nối
		DisConnection();
		return DSHSDK;
	}*/

	public List<Map<Object,Object>> getAllHSDK(int coQuanID) throws SQLException{
		List<Map<Object,Object>> listHSDK = new ArrayList<Map<Object,Object>>();
		
		Connection();
		
		String sql = "{CALL GET_HSDK_COQUAN(?)}";
		
		CallableStatement cstm = DBConnection.prepareCall(sql);
		
		cstm.setInt(1, coQuanID);
		
		ResultSet rs = cstm.executeQuery();
		
		while (rs.next()) {
			listHSDK.add(
					new HSDK(rs.getInt(1)
							, rs.getString(2)
							, rs.getString(3)
							, rs.getDate(4)
							, rs.getDate(5)
							, rs.getInt(7)).toMap());
		}
		return listHSDK;
	}
	
	//Dùng khi truyền connection từ ngoài vào
	public Boolean UpdateTrangThaiXuLy(int idHSDK, String trangThai) {
		try {
			String wrkSql = UpdateTrangThaiXuLy();
			PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
			pstm.setString(1, trangThai);
			pstm.setInt(2, idHSDK);
			int result = pstm.executeUpdate();
			if(result == 0)
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public String UpdateTrangThaiXuLy() {
		StringBuilder wrkSql = new StringBuilder();
		wrkSql.append("UPDATE HOSO_DANGKY ");
		wrkSql.append("SET TRANGTHAI_XULY_ID = ( ");
		wrkSql.append("							SELECT ");
		wrkSql.append("TRANGTHAI_XULY_ID ");
		wrkSql.append("FROM ");
		wrkSql.append("TRANGTHAI_XULY ");
		wrkSql.append("WHERE ");
		wrkSql.append("TRANGTHAI_XULY_TEN ");
		wrkSql.append("LIKE ? ) ");
		wrkSql.append("WHERE ");
		wrkSql.append("HOSO_DANGKY_ID = ?");
		return wrkSql.toString();
	}
	
	public Map<Object,Object> getMoreInfo(int id, int loai){
		Map<Object,Object> info = new HashMap<>();
		try {
			Connection();
			String wrkSql = "SELECT HOSO_DANGKY_EMAIL,HOSO_DANGKY_SDT,LOAI_DANGKY_LEPHI FROM HOSO_DANGKY,LOAI_DANGKY WHERE HOSO_DANGKY_ID = ? AND HOSO_DANGKY.LOAI_DANGKY_ID = LOAI_DANGKY.LOAI_DANGKY_ID";
			PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
			pstm.setInt(1, id);
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				String email = rs.getString(1);
				String sdt = rs.getString(2);
				float lephi = rs.getFloat(3);
				info.put("email", email);
				info.put("sdt", sdt);
				info.put("lephi", lephi);
				return info;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}
}

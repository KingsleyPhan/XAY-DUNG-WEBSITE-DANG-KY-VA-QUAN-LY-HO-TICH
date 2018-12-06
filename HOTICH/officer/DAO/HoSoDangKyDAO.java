package DAO;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import DAO.ConnectDAO;
import Entities.HSDK;

public class HoSoDangKyDAO extends ConnectDAO {

	public HoSoDangKyDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
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
}

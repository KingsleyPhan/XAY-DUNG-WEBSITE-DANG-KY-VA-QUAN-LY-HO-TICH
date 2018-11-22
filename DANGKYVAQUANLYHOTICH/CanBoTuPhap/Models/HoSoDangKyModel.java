package Models;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Controller.ConnectionUtils;
import Entities.HSDK;

public class HoSoDangKyModel {

	public List<HSDK> getAllHSDKCoQuan(int coQuanID) throws ClassNotFoundException, SQLException {
		List<HSDK> DSHSDK = new ArrayList<>();
		// Lấy ra kết nối tới cơ sở dữ liệu.
		Connection connection = ConnectionUtils.getMyConnection();
		// Câu lệnh gọi thủ tục (***)
		String sql = "{CALL GETALL_HSDK(?)}";
		// Tạo một đối tượng CallableStatement.
		CallableStatement cstm = connection.prepareCall(sql);
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
		connection.close();
		return DSHSDK;
	}
	
	//Không dùng tới, được xử lý bởi datatable search
	public List<HSDK> getHSDKLoaiGiayTo(int coQuanID,int loaiGiayTo) throws ClassNotFoundException, SQLException {
		List<HSDK> DSHSDK = new ArrayList<>();
		// Lấy ra kết nối tới cơ sở dữ liệu.
		Connection connection = ConnectionUtils.getMyConnection();
		// Câu lệnh gọi thủ tục (***)
		String sql = "{CALL GET_HSDK_TUNGLOAI(?,?)}";
		// Tạo một đối tượng CallableStatement.
		CallableStatement cstm = connection.prepareCall(sql);
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
		connection.close();
		return DSHSDK;
	}
}

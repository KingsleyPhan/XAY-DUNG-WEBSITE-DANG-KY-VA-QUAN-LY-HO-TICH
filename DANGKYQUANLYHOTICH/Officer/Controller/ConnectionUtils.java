package Controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionUtils {
	public static Connection getMyConnection() throws SQLException, ClassNotFoundException {
		// Sử dụng SQL Server
		// Bạn có thể thay thế bởi Database nào đó.
				return SQLServerConnUtils.getSQLServerConnection();
			}

		//
		// Test Connection ...
		//
			public static void main(String[] args) throws SQLException, ClassNotFoundException {

				System.out.println("Get connection ... ");

		// Lấy ra đối tượng Connection kết nối vào database.
				Connection conn = ConnectionUtils.getMyConnection();

				System.out.println("Get connection " + conn);

				System.out.println("Done!");

				// Tạo đối tượng Statement.
				Statement statement = conn.createStatement();

				String sql = "Select * from LOAI_GIAYTO";

				// Thực thi câu lệnh SQL trả về đối tượng ResultSet.
				ResultSet rs = statement.executeQuery(sql);

				// Duyệt trên kết quả trả về.
				while (rs.next()) {// Di chuyển con trỏ xuống bản ghi kế tiếp.
					int loaiGiayToId = rs.getInt("LOAI_GIAYTO_ID");
					String loaiGiayToTen = rs.getString("LOAI_GIAYTO_TEN");
					System.out.println("--------------------");
					System.out.println("loaiGiayToId : " + loaiGiayToId);
					System.out.println("loaiGiayToTen : " + loaiGiayToTen);
				}
				
				
//				ResultSet rs = statement.executeQuery("Select * from THANHPHO WHERE THANHPHO_TRANGTHAI=1");
//				 while(rs.next())
//				 {
//					 System.out.println(rs.getString(1));
//					 System.out.println(rs.getString(2));
//					 System.out.println(rs.getString(3));
//				 }
				// Đóng kết nối
				conn.close();

//				// -----------------
//				// Lấy ra kết nối tới cơ sở dữ liệu.
//				conn = ConnectionUtils.getMyConnection();
		//
////				statement = conn.createStatement();
		//
//				// Câu lệnh gọi thủ tục (***)
//				sql = "{call TimKiem_HoTich(?,?)}";
		//
//				// Tạo một đối tượng CallableStatement.
//				CallableStatement cstm = conn.prepareCall(sql);
		//
//				// Sét đặt giá trị tham số thứ nhất (Dấu ? thứ nhất)
//				cstm.setString("ma", "KS0004");
//				// Sét đặt giá trị tham số thứ hai (Dấu ? thứ hai)
//				cstm.setString("soquyen", "KS-T11");
//				// Thực thi câu lệnh.
//				rs = cstm.executeQuery();
		//
//				// Duyệt trên kết quả trả về.
//				while (rs.next()) {// Di chuyển con trỏ xuống bản ghi kế tiếp.
//					int loaiGiayToId = rs.getInt("LOAI_GIAYTO_ID");
//					String ma = rs.getString("MA");
//					System.out.println("--------------------");
//					System.out.println("loaiGiayToId : " + loaiGiayToId);
//					System.out.println("ma : " + ma);
//				}
			}
}

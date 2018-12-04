package DAO;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import DAO.ConnectDAO;
import Entities.COQUAN;
import Entities.HoTich;
import Entities.NGUOIDUNG;

public class HoTichDAO extends ConnectDAO{

	public HoTichDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}
	
	public List<HoTich> getAllHoTichCoQuan(int coQuanID) throws ClassNotFoundException, SQLException, ParseException {
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
	}
	
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
		PreparedStatement pstm = null;
		try {
			Connection();
			DBConnection.setAutoCommit(false);
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
			
			pstm = DBConnection.prepareStatement(sql);
			pstm.setInt(1, idHSDK);
			pstm.setInt(2, ngXuLy);
			pstm.setInt(3, ngKy);
			int result = pstm.executeUpdate();
			System.out.println("Commiting data here....");
			DBConnection.commit();
			if(result != 0)
			{
				return true;
			}
			throw new Exception("Thêm không thành công, kiểm tra lại hệ thống");
		}catch (SQLException se) {
			//https://www.tutorialspoint.com/jdbc/commit-rollback.htm
			//Handle errors for JDBC
			se.printStackTrace();
		    // If there is an error then rollback the changes.
		    System.out.println("Rolling back data here....");
			try{
				if(DBConnection!=null)
					DBConnection.rollback();
				return false;
		      }catch(SQLException se2){
		         se2.printStackTrace();
		      }//end try
			throw new Exception(se);
		}
		finally{
			try {
				pstm.close();
				DisConnection();
			} catch (SQLException e) {
				return false;
			}
		}
	}

}

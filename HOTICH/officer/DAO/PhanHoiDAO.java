package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Entities.COQUAN;

public class PhanHoiDAO extends ConnectDAO{
	
	public PhanHoiDAO(Connection DBConnection) {
		super(DBConnection);
	}

	public Boolean insertPhanHoi(int idHSDK,String email,String sdt, int ngPhanHoi,  String noiDung, int coQuan) {
		try {
			String wrkSql = insertPhanHoi();
			PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
			pstm.setInt(1, idHSDK);
			pstm.setString(2, email);
			pstm.setString(3, sdt);
			pstm.setInt(4, ngPhanHoi);
			pstm.setString(5, noiDung);
			pstm.setInt(6, coQuan);
			int result = pstm.executeUpdate();
			if(result == 0)
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public String insertPhanHoi() {
		StringBuilder wrkSql = new StringBuilder();
		wrkSql.append("INSERT INTO PHANHOI ( ");
		wrkSql.append("		HOSO_DANGKY_ID");
		wrkSql.append("		,PHANHOI_EMAIL");
		wrkSql.append("		,PHANHOI_SDT");
		wrkSql.append("		,NGUOIDUNG_ID");
		wrkSql.append("		,PHANHOI_NOIDUNG");
		wrkSql.append("		,COQUAN_ID");
		wrkSql.append("		,PHANHOI_THOIGIAN ) ");
		wrkSql.append("VALUES ( ?, ?, ?, ?, ?, ?, GETDATE() )");
		return wrkSql.toString();
	}
	
}

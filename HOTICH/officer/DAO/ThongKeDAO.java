package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class ThongKeDAO extends ConnectDAO{

	public ThongKeDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}
	
	public String getHSDK_Thang(int thang, int coQuanID) throws SQLException {
		Gson gson = new Gson();
		List<Map<Object,Object>> listData = new ArrayList<Map<Object,Object>>();
		Map<Object,Object> data = null;
		Connection();
		
		String wrkSql = "SELECT * FROM GET_THONGKE_HSDK_THANG(?,?)";
		PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
		pstm.setInt(1, coQuanID);
		pstm.setInt(2, thang);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			int rs_thang = rs.getInt(1);
			int soLuong = rs.getInt(3);
			String ten = "Giấy " + rs.getString(4);
			int tong = rs.getInt(5);
			
			String pattern = "###.##";
			DecimalFormat decimalFormat = new DecimalFormat(pattern);
 
			String persent = decimalFormat.format((float)soLuong/tong*100);
			
			data = new HashMap<Object,Object>();
			data.put("y", persent);
			data.put("name", ten);
			listData.add(data);
		}
		return gson.toJson(listData);
	}

}

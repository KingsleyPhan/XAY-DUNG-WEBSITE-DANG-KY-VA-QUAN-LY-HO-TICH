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
	
	public String getHSDK_Nam(int nam, int coQuanID) throws SQLException {
		int loai = 0;
		String ten = "";
		Gson gson = new Gson();
		
		List<Map<Object,Object>> chart = new ArrayList<Map<Object,Object>>();
		Map<Object,Object> object = new HashMap<Object,Object>();
		
		List<Map<Object,Object>> datas = null;
		Map<Object,Object> data = null;
		
		Connection();
		
		String wrkSql = "SELECT * FROM GET_HOSO_DANGKY_NAM(?,?)";
		PreparedStatement pstm = DBConnection.prepareStatement(wrkSql);
		pstm.setInt(1, nam);
		pstm.setInt(2, coQuanID);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			int loaiGiayToID = rs.getInt(1);
			String loaiGiayToTen = rs.getString(2);
			int thang = rs.getInt(3);
			int soLuong = rs.getInt(4);
			if(loai == 0) {
				if(loai != loaiGiayToID) {
					loai = loaiGiayToID;
					ten = loaiGiayToTen;
					datas = new ArrayList<Map<Object,Object>>();
					
					data = new HashMap<Object,Object>();
					
					data.put("label","Tháng "+thang);
					data.put("y", soLuong);
					
					datas.add(data);
				}
			}else {
				if(loai != loaiGiayToID) {
					object = new HashMap<Object,Object>();
					
					object.put("type", "column");
					object.put("name","Giấy "+ ten);
					object.put("showInLegend", true);
					object.put("yValueFormatString", "#,###");
					object.put("dataPoints", datas);
					
					chart.add(object);
					
					
					
					loai = loaiGiayToID;
					ten = loaiGiayToTen;
					datas = new ArrayList<Map<Object,Object>>();
					
					data = new HashMap<Object,Object>();
					
					data.put("label","Tháng "+thang);
					data.put("y", soLuong);
					
					datas.add(data);
				}else {
					data = new HashMap<Object,Object>();
					
					data.put("label","Tháng "+thang);
					data.put("y", soLuong);
					
					datas.add(data);
				}
			}
			
		}
		object = new HashMap<Object,Object>();
		
		object.put("type", "column");
		object.put("name","Giấy "+ ten);
		object.put("showInLegend", true);
		object.put("yValueFormatString", "#,###");
		object.put("dataPoints", datas);
		
		chart.add(object);
		return gson.toJson(chart);
	}

}

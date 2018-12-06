package Service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import DAO.CongDanDAO;
import DAO.Consts;
import Entities.CongDan;

public class HoSoDangKyService {
	
	public String getCheckKhaiSinhService(String cmndNgYeuCau, String cmndCha, String cmndMe) throws SQLException, ParseException {
		Gson gsonObj = new Gson();
		
		List<Map<Object,Object>> listCongDan = new ArrayList<Map<Object,Object>>();
		
		CongDanDAO congDanDAO = new CongDanDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		CongDan ngYeuCau = congDanDAO.getCongDan(cmndNgYeuCau);
		listCongDan.add(ngYeuCau.toMap());
		
		CongDan cha = congDanDAO.getCongDan(cmndCha);
		listCongDan.add(cha.toMap());
		
		CongDan me = congDanDAO.getCongDan(cmndMe);
		listCongDan.add(me.toMap());
		
		return gsonObj.toJson(listCongDan);
	}
	
	public String getCheckCongDanService(String cmnd) throws SQLException, ParseException {
		Gson gsonObj = new Gson();
		
		CongDanDAO congDanDAO = new CongDanDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		CongDan congDan = congDanDAO.getCongDan(cmnd);
		
		return gsonObj.toJson(congDan.toMap());
	}
}

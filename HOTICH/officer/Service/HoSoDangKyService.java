package Service;

import java.sql.SQLException;
import java.text.ParseException;

import DAO.CongDanDAO;
import DAO.Consts;
import Entities.CongDan;

public class HoSoDangKyService {
	
	public String getCheckKhaiSinhService(String cmndNgYeuCau, String cmndCha, String cmndMe) throws SQLException, ParseException {
		StringBuilder info = new StringBuilder();
		CongDanDAO congDanDAO = new CongDanDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		info.append("{\"khaisinh\":[");
		CongDan ngYeuCau = congDanDAO.getCongDan(cmndNgYeuCau);
		info.append(ngYeuCau.toStringBuilder().toString());
		info.append(",");
		CongDan cha = congDanDAO.getCongDan(cmndCha);
		info.append(cha.toStringBuilder().toString());
		info.append(",");
		CongDan me = congDanDAO.getCongDan(cmndMe);
		info.append(me.toStringBuilder().toString());
		info.append("]}");
		return info.toString();
	}
	
	public String getCheckCongDanService(String cmnd) throws SQLException, ParseException {
		StringBuilder info = new StringBuilder();
		CongDanDAO congDanDAO = new CongDanDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		CongDan ngYeuCau = congDanDAO.getCongDan(cmnd);
		info.append(ngYeuCau.toStringBuilder().toString());
		return info.toString();
	}
}

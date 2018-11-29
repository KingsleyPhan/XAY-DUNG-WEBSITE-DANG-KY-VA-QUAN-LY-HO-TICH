package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;

import Entities.CMND;
import Entities.CongDan;
import Entities.DiaChi;

public class CongDanDAO extends ConnectDAO{

	public CongDanDAO(String URL, String Username, String Password) {
		super(URL, Username, Password);
	}

	public CongDan getCongDan(String CMND) throws SQLException, ParseException {
		Connection();
		String sql = "select * from TIMKIEM_CONGDAN(?)";
		PreparedStatement pstm = DBConnection.prepareStatement(sql);
		pstm.setString(1, CMND);
		ResultSet rs = pstm.executeQuery();
		if(rs.next())
		{
			String hoVaTen = rs.getString(1);
			Date ngaySinh = Consts.ConvertSQLtoUtilDate(rs.getDate(2));
			Boolean gioiTinh = rs.getBoolean(3);
			String queQuan = rs.getString(4);
			String quocTich = rs.getString(5);
			String danToc = rs.getString(6);
			String cmnd_So = rs.getString(7);
			Date cmnd_NgayCap = Consts.ConvertSQLtoUtilDate(rs.getDate(8));
			String cmnd_NoiCap = rs.getString(9);
			String thanhPho = rs.getString(10);
			String quan = rs.getString(11);
			String phuong = rs.getString(12);
			String diaChi = rs.getString(13);
			int tinhTrangHonNhan = rs.getInt(14);
			int id = rs.getInt(16);
			return new CongDan(hoVaTen, ngaySinh, gioiTinh, queQuan, quocTich, danToc,cmnd_So == null?null:new CMND(cmnd_So, cmnd_NgayCap, cmnd_NoiCap), new DiaChi(thanhPho, quan, phuong, diaChi), id, tinhTrangHonNhan);
		}
		return null;
	}
	
	public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
		CongDanDAO congDanDAO = new CongDanDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		System.out.println(congDanDAO.getCongDan("321564307").toString());
	}
}

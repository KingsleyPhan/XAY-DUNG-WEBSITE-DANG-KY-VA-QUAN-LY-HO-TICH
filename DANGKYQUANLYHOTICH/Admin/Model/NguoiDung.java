package Model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import DAO.Consts;
import DAO.DAO_NGUOIDUNG;

public class NguoiDung 
{
	private int ID;
	private String MaCanBo;
	private String HoVaTen;
	private Date NgaySinh;
	private String Email;
	private String SDT;
	private String Username;
	private String Password;
	private int TrangThai;
	private String Quyen;
	private int CoQuan_ID;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getMaCanBo() {
		return MaCanBo;
	}
	public void setMaCanBo(String maCanBo) {
		MaCanBo = maCanBo;
	}
	public String getHoVaTen() {
		return HoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}
	public Date getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) throws ParseException {
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = fmd.parse(ngaySinh);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
		NgaySinh = sqlStartDate;
		
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public int getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(String trangThai) {
		TrangThai = Integer.parseInt(trangThai) ;
	}
	public String getQuyen() {
		return Quyen;
	}
	public void setQuyen(String quyen) {
		Quyen = quyen;
	}
	public int getCoQuan_ID() {
		return CoQuan_ID;
	}
	public void setCoQuan_ID(int coQuan_ID) {
		CoQuan_ID = coQuan_ID;
	}
	
	public NguoiDung ()
	{
		DAO_NGUOIDUNG NGUOIDUNG  = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.Pass, Consts.UserName);
	}
	
	
	
}

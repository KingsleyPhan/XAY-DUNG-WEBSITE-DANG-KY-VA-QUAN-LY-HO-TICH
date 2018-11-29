package Entities;

public class NGUOIDUNG 
{
	private int NguoiDung_ID;
	private String MaCanBo ;
	private String HoVaTen;
	private String NgaySinh;
	private String Email;
	private String SDT;
	private String Username;
	private String Password;
	private int  TrangThai;
	private int Quyen;
	private int CoQuan_ID;
	
	public int getNguoiDung_ID() {
		return NguoiDung_ID;
	}
	public void setNguoiDung_ID(int nguoiDung_ID) {
		NguoiDung_ID = nguoiDung_ID;
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
	public String getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
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
	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}
	public int getQuyen() {
		return Quyen;
	}
	public void setQuyen(int quyen) {
		Quyen = quyen;
	}
	public int getCoQuan_ID() {
		return CoQuan_ID;
	}
	public void setCoQuan_ID(int coQuan_ID) {
		CoQuan_ID = coQuan_ID;
	}
	public NGUOIDUNG(int nguoiDung_ID, String hoVaTen) {
		super();
		NguoiDung_ID = nguoiDung_ID;
		HoVaTen = hoVaTen;
	}
	
	
	

}

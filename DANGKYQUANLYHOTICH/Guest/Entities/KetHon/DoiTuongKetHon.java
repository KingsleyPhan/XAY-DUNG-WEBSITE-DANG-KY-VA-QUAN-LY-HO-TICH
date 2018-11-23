package Entities.KetHon;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DoiTuongKetHon 
{
	private int HOSO_DANGKY_ID;		
	private String HOTEN;	
	private Date	NGAYSINH;	
	private String	DANTOC;	
	private String CMND;		
	private Date CMND_NGAYCAP;		
	private String CMND_NOICAP;	
	private String	QUOCTICH;	
	private String THANHPHO;		
	private String QUAN;	
	private String PHUONG;	
	private String DIACHI;
	private int LAN;
	
	public int getHOSO_DANGKY_ID() {
		return HOSO_DANGKY_ID;
	}
	public void setHOSO_DANGKY_ID(int hOSO_DANGKY_ID) {
		HOSO_DANGKY_ID = hOSO_DANGKY_ID;
	}
	public String getHOTEN() {
		return HOTEN;
	}
	public void setHOTEN(String hOTEN) {
		HOTEN = hOTEN;
	}
	public Date getNGAYSINH() {
		return NGAYSINH;
	}
	public void setNGAYSINH(String nGAYSINH) throws ParseException {
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = fmd.parse(nGAYSINH);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
		NGAYSINH = sqlStartDate;
		
	}
	public String getDANTOC() {
		return DANTOC;
	}
	public void setDANTOC(String dANTOC) {
		DANTOC = dANTOC;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public Date getCMND_NGAYCAP() {
		return CMND_NGAYCAP;
	}
	public void setCMND_NGAYCAP(String cMND_NGAYCAP) throws ParseException {
		SimpleDateFormat fmd = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = fmd.parse(cMND_NGAYCAP);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
		CMND_NGAYCAP  = sqlStartDate;
		
	}
	public String getCMND_NOICAP() {
		return CMND_NOICAP;
	}
	public void setCMND_NOICAP(String cMND_NOICAP) {
		CMND_NOICAP = cMND_NOICAP;
	}
	public String getQUOCTICH() {
		return QUOCTICH;
	}
	public void setQUOCTICH(String qUOCTICH) {
		QUOCTICH = qUOCTICH;
	}
	public String getTHANHPHO() {
		return THANHPHO;
	}
	public void setTHANHPHO(String tHANHPHO) {
		THANHPHO = tHANHPHO;
	}
	public String getQUAN() {
		return QUAN;
	}
	public void setQUAN(String qUAN) {
		QUAN = qUAN;
	}
	public String getPHUONG() {
		return PHUONG;
	}
	public void setPHUONG(String pHUONG) {
		PHUONG = pHUONG;
	}
	public String getDIACHI() {
		return DIACHI;
	}
	public void setDIACHI(String dIACHI) {
		DIACHI = dIACHI;
	}
	public int getLAN() {
		return LAN;
	}
	public void setLAN(String lAN) {
		LAN = Integer.parseInt(lAN);
	}
	
	public void ShowImFor()
	{
		System.out.println("ĐỐI TƯỢNG");
		System.out.println(HOTEN);
		System.out.println(NGAYSINH);
		System.out.println(DANTOC);
		System.out.println(CMND);
		System.out.println(CMND_NGAYCAP);
		System.out.println(CMND_NOICAP);
		System.out.println(QUOCTICH);
		
		System.out.println(THANHPHO);
		System.out.println(QUAN);
		System.out.println(PHUONG);
		System.out.println(DIACHI);
		System.out.println(LAN);
	}
	
	

}

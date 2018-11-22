package Entities;

import java.util.Date;

public class CMND {
	private String so;
	private String noiCap;
	private Date ngayCap;
	public String getSo() {
		return so;
	}
	public String getNoiCap() {
		return noiCap;
	}
	public Date getNgayCap() {
		return ngayCap;
	}
	public CMND(String so, String noiCap, Date ngayCap) {
		super();
		this.so = so;
		this.noiCap = noiCap;
		this.ngayCap = ngayCap;
	}
	private CMND() {
		super();
	}
	
	
}

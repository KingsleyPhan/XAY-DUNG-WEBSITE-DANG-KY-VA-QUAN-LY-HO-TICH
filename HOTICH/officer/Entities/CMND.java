package Entities;

import java.util.Date;

import DAO.Consts;

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
	
	public String getNgayCapString() {
		return Consts.ConvertUtilToString(ngayCap);
	}

	public CMND(String so, Date ngayCap, String noiCap) {
		super();
		this.so = so;
		this.noiCap = noiCap;
		this.ngayCap = ngayCap;
	}

	private CMND() {
		super();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("Số : " + so);
		wrkStr.append("\r\n");
		wrkStr.append("Nơi cấp : " + noiCap);
		if(ngayCap != null) {
			wrkStr.append("\r\n");
			wrkStr.append("Ngày cấp : " + Consts.ConvertUtilToString(ngayCap));
		}
		return wrkStr.toString();
	}
}

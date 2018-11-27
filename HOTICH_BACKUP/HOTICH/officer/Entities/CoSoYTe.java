package Entities;

public class CoSoYTe {
	private String tenCoSoYTe;
	private DiaChi diaChi;
	public String getTenCoSoYTe() {
		return tenCoSoYTe;
	}
	public DiaChi getDiaChi() {
		return diaChi;
	}
	public CoSoYTe(String tenCoSoYTe, DiaChi diaChi) {
		super();
		this.tenCoSoYTe = tenCoSoYTe;
		this.diaChi = diaChi;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		StringBuilder wrkStr = new StringBuilder();
		wrkStr.append("Tên cơ sở y tế : " + tenCoSoYTe);
		wrkStr.append("\r\n");
		if(diaChi != null) {
			wrkStr.append("Địa chỉ : " + diaChi.toString());
		}
		return wrkStr.toString();
	}
}

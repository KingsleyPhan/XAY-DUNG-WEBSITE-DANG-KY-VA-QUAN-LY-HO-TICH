package Entities.KetHon;

public class DangKyKetHon 
{
	private DoiTuongKetHon VO;
    public DoiTuongKetHon getVO() {
		return VO;
	}

	public void setVO(DoiTuongKetHon vO) {
		VO = vO;
	}

	public DoiTuongKetHon getCHONG() {
		return CHONG;
	}

	public void setCHONG(DoiTuongKetHon cHONG) {
		CHONG = cHONG;
	}

	private DoiTuongKetHon CHONG;
    
    public DangKyKetHon(DoiTuongKetHon vo, DoiTuongKetHon chong)
    {
    	
    	this.VO = vo;
    	this.CHONG = chong;
    	
    }
}

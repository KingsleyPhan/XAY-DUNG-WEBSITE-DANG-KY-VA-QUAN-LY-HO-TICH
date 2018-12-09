package Service;

import java.sql.Connection;
import java.sql.SQLException;

import DAO.Consts;
import DAO.HoSoDangKyDAO;
import DAO.HoTichDAO;
import DAO.PhanHoiDAO;

public class HoTichService {
	
	public final static String ChuaXuLy = "Chưa xử lý";
	public final static String DaXuLy = "Đã xử lý";
	public final static String TuChoi = "Từ chối";
	
	ServiceDAO service = null;
	
	Connection DBConnection = null;
	
	HoTichDAO hoTichDAO = null;
	
	PhanHoiDAO phanHoiDAO = null;
	
	HoSoDangKyDAO hoSoDangKyDAO = null;
	
	public HoTichService(){
		service = null;
		DBConnection = null;
		hoTichDAO = null;
		phanHoiDAO = null;
		hoSoDangKyDAO = null;
	}
	
	public Boolean XacNhanHoTich(int idHSDK, int loai, int ngXuLy, int ngKy, String email, String sdt,String noiDung,int coQuan) throws Exception{
		try {	
			service = new ServiceDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
			
			DBConnection = service.getConnection();
			
			DBConnection.setAutoCommit(false);
			
			hoTichDAO = new HoTichDAO(DBConnection);
			
			hoSoDangKyDAO = new HoSoDangKyDAO(DBConnection);
			
			phanHoiDAO = new PhanHoiDAO(DBConnection);
			
			if(!hoSoDangKyDAO.UpdateTrangThaiXuLy(idHSDK, DaXuLy)) {
				throw new Exception("Thay đổi trạng thành công");
			}
			
			if(!hoTichDAO.insertHoTich(idHSDK, loai, ngXuLy, ngKy)) {
				throw new Exception("Insert Ho tich lỗi");
			}
			
			if(!phanHoiDAO.insertPhanHoi(idHSDK, email, sdt, ngXuLy, noiDung, coQuan)) {
				throw new Exception("Insert Ho tich lỗi");
			}
			
			SendMail.send(email,Consts.subject, noiDung, Consts.user, Consts.pass);
			
			System.out.println("Commiting data here....");
			
			DBConnection.commit();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		    System.out.println("Rolling back data here....");
			try {
				if (DBConnection != null)
					DBConnection.rollback();
				return false;
			} catch (SQLException se2) {
				se2.printStackTrace();
				throw new Exception("Lỗi rollback...");
			}
		}
		finally{
			if (DBConnection != null && !DBConnection.isClosed()) 
	        {
	        	DBConnection.close();
	        }
		}
	}
	
	public Boolean TuChoiHoTich(int idHSDK ,int ngXuLy, String email, String sdt,String noiDung,int coQuan) throws Exception {
		try {	
			
			service = new ServiceDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
			
			DBConnection = service.getConnection();
			
			DBConnection.setAutoCommit(false);
			
			hoSoDangKyDAO = new HoSoDangKyDAO(DBConnection);
			
			phanHoiDAO = new PhanHoiDAO(DBConnection);
		
			if(!hoSoDangKyDAO.UpdateTrangThaiXuLy(idHSDK, TuChoi)) {
				throw new Exception("Thay đổi trạng thành công");
			}
			
			if(!phanHoiDAO.insertPhanHoi(idHSDK, email, sdt, ngXuLy, noiDung, coQuan)) {
				throw new Exception("Insert Ho tich lỗi");
			}
			try {
			SendMail.send(email,Consts.subject, noiDung, Consts.user, Consts.pass);
			}catch (Exception e) {
				throw new Exception("Lỗi gửi mail");
			}
			
			System.out.println("Commiting data here....");
			
			DBConnection.commit();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		    System.out.println("Rolling back data here....");
			try {
				if (DBConnection != null)
					DBConnection.rollback();
				return false;
			} catch (SQLException se) {
				se.printStackTrace();
				throw new Exception("Lỗi rollback...");
			}
		}
		finally{
			if (DBConnection != null && !DBConnection.isClosed()) 
	        {
	        	DBConnection.close();
	        }
		}
	}
}

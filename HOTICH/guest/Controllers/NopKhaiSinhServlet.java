package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DAO_DANTOC;
import DAO.DAO_DK_KHAISINH;
import DAO.DAO_PHUONG;
import DAO.DAO_QUAN;
import DAO.DAO_THANHPHO;
import Entities.KhaiSinh.DangKyKhaiSinh;
import Entities.KhaiSinh.KhaiSinh;
import Entities.KhaiSinh.NguoiThan;
import Entities.KhaiSinh.NguoiYeuCau;
import Models.StoreEntity;

/**
 * Servlet implementation class NopKhaiSinhServlet
 */
@WebServlet("/NopKhaiSinh.php")
public class NopKhaiSinhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NopKhaiSinhServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		DAO_THANHPHO TP = new DAO_THANHPHO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		DAO_QUAN QUAN  = new DAO_QUAN(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		DAO_PHUONG PHUONG = new DAO_PHUONG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		DAO_DANTOC DANTOC = new DAO_DANTOC(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		NguoiYeuCau NYC = new NguoiYeuCau();
		KhaiSinh KS = new KhaiSinh();
		NguoiThan ME = new NguoiThan();
	    NguoiThan CHA = new NguoiThan();
	    
		NYC.setHoVaTen(request.getParameter("NYC_HOVATEN"));
		NYC.setCMND(request.getParameter("NYC_CMND"));
		NYC.setNoiCap(request.getParameter("NYC_NOICAP"));
		try {
			NYC.setNgayCap(request.getParameter("NYC_NGAYCAP"));
		} catch (ParseException e2) {
		
			// TODO Auto-generated catch block
			System.out.println("NGAY CAP NYC: "+ request.getParameter("NYC_NGAYCAP"));
		}
		
		NYC.setQuanHe(request.getParameter("NYC_QUANHE"));
		if (NYC.getQuanHe().trim()=="")
		     NYC.setQuanHe(request.getParameter("NYC_QUANHEKHAC"));
		NYC.setQuocTich(request.getParameter("NYC_QUOCTICH"));
		
		String ID_THANHPHO = request.getParameter("ComboTHANHPHO");
		String ID_QUAN  = request.getParameter("NYC_QUAN");
		String ID_PHUONG = request.getParameter("NYC_PHUONG");
	
		try 
		{
			NYC.setTP(TP.GET_NAME_TP(ID_THANHPHO));
			NYC.setQuan(QUAN.GET_NAME_QUAN(ID_QUAN));
			NYC.setPhuong(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
		} 
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}
	
		NYC.setDiaChi(request.getParameter("NYC_DIACHI"));
		
		//NYC.showImfor();
		
		
		
		KS.setHoVaTen(request.getParameter("KS_HOVATEN"));
		KS.setGioiTinh(request.getParameter("gender"));
		try {
			KS.setNgaySinh(request.getParameter("KS_NGAYSINH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAY SINH CON " + request.getParameter("KS_NGAYSINH"));
		}
		String DanTocValue = request.getParameter("KS_DANTOC");
		try {
			KS.setDanToc(DANTOC.GET_NAME_DANTOC(DanTocValue));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		KS.setQuocTich(request.getParameter("KS_QUOCTICH"));
		
		 ID_THANHPHO = request.getParameter("KS_THANHPHO");
		 ID_QUAN  = request.getParameter("KS_QUAN");
		 ID_PHUONG = request.getParameter("KS_PHUONG");
		
		try {
			KS.setTP(TP.GET_NAME_TP(ID_THANHPHO));
			KS.setQuan(QUAN.GET_NAME_QUAN(ID_QUAN));
			KS.setPhuong(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		KS.setDiaChi(request.getParameter("KS_DIACHI"));
		KS.setCoSoSinhSan(request.getParameter("KS_CSSS"));
		KS.setQuocTich_CSSS(request.getParameter("KS_QUOCGIA_CSSS"));
		
		 ID_THANHPHO = request.getParameter("KS_THANHPHO_CSSS");
		 ID_QUAN  = request.getParameter("KS_QUAN_CSSS");
		 ID_PHUONG = request.getParameter("KS_PHUONG_CSSS");
		
		try {
			KS.setTP_CSSS(TP.GET_NAME_TP(ID_THANHPHO));
			KS.setQuan_CSSS(QUAN.GET_NAME_QUAN(ID_QUAN));
			KS.setPhuong_CSSS(PHUONG.GET_NAME_PHUONG(ID_QUAN));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		KS.setDiaChi_CSSS(request.getParameter("KS_DIACHI_CSSS"));
		
		KS.showImfor();
		
	
		ME.setHoVaTen(request.getParameter("ME_HOVATEN"));
		try {
			ME.setNgaySinh(request.getParameter("ME_NGAYSINH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAY SINH ME" + request.getParameter("ME_NGAYSINH"));
		}
		ME.setCMND(request.getParameter("ME_CMND"));
		ME.setNoiCap(request.getParameter("ME_NOICAP"));
		try {
			ME.setNgayCap(request.getParameter("ME_NGAYCAP"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAY CAP ME " + request.getParameter("ME_NGAYCAP"));
		}
		
		
		DanTocValue = request.getParameter("ME_DANTOC");
		try {
			ME.setDanToc(DANTOC.GET_NAME_DANTOC(DanTocValue));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		ME.setQuocTich(request.getParameter("ME_QUOCTICH"));
		
		 ID_THANHPHO = request.getParameter("ME_THANHPHO");
		 ID_QUAN  = request.getParameter("ME_QUAN");
		 ID_PHUONG = request.getParameter("ME_PHUONG");
		
		try {
			ME.setTP(TP.GET_NAME_TP(ID_THANHPHO));
			ME.setQuan(QUAN.GET_NAME_QUAN(ID_QUAN));
			ME.setPhuong(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	
		ME.setDiaChi(request.getParameter("ME_DIACHI"));
		
       
		
		CHA.setHoVaTen(request.getParameter("CHA_HOVATEN"));
		try {
			CHA.setNgaySinh(request.getParameter("CHA_NGAYSINH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAYSINH CHA: " + request.getParameter("CHA_NGAYSINH"));
		}
		CHA.setCMND(request.getParameter("CHA_CMND"));
		CHA.setNoiCap(request.getParameter("CHA_NOICAP"));
	 try {
			CHA.setNgayCap(request.getParameter("CHA_NGAYCAP"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("Ngay Cap Cha" + request.getParameter("CHA_NGAYCAP"));
		}
		
		DanTocValue = request.getParameter("CHA_DANTOC");
		try {
			CHA.setDanToc(DANTOC.GET_NAME_DANTOC(DanTocValue));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		CHA.setQuocTich(request.getParameter("CHA_QUOCTICH"));
		
		 ID_THANHPHO = request.getParameter("CHA_THANHPHO");
		 ID_QUAN  = request.getParameter("CHA_QUAN");
		 ID_PHUONG = request.getParameter("CHA_PHUONG");
		 try {
				CHA.setTP(TP.GET_NAME_TP(ID_THANHPHO));
				CHA.setQuan(QUAN.GET_NAME_QUAN(ID_QUAN));
				CHA.setPhuong(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
	
		CHA.setDiaChi(request.getParameter("CHA_DIACHI"));
		
		
	
		
		DangKyKhaiSinh DK = new DangKyKhaiSinh(NYC, KS,CHA, ME);
		
		StoreEntity Store = new  StoreEntity();
		
		Store.DKKS  = DK;
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/XacNhanDangKy_1.jsp");
		dispatcher.forward(request, response);
		
	
	}

}

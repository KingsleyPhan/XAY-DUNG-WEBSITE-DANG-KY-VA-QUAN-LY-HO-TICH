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

import DAO.DAO_DK_KHAISINH;
import DAO.DAO_PHUONG;
import DAO.DAO_QUAN;
import DAO.DAO_THANHPHO;
import Entities.KhaiSinh.DangKyKhaiSinh;
import Entities.KhaiSinh.KhaiSinh;
import Entities.KhaiSinh.NguoiYeuCau;
import Entities.KhaiSinh.NguoiThan;

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
		
		DAO_THANHPHO TP = new DAO_THANHPHO(Consts.ServerUrl, Consts.DatabaseName, Consts.DatabasePass);
		DAO_QUAN QUAN  = new DAO_QUAN(Consts.ServerUrl, Consts.DatabaseName, Consts.DatabasePass);
		DAO_PHUONG PHUONG = new DAO_PHUONG(Consts.ServerUrl, Consts.DatabaseName, Consts.DatabasePass);
		DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl, Consts.DatabaseName, Consts.DatabasePass);
		
		NguoiYeuCau NYC = new NguoiYeuCau();
		
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
		
	//	NYC.showImfor();
		
		KhaiSinh KS = new KhaiSinh();
		
		KS.setHoVaTen(request.getParameter("KS_HOVATEN"));
		KS.setGioiTinh(request.getParameter("gender"));
	//	try {
	//		KS.setNgaySinh(request.getParameter("KS_NGAYSINH"));
	//	} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAY SINH CON " + request.getParameter("KS_NGAYSINH"));
		//}
		KS.setDanToc(request.getParameter("KS_DANTOC"));
		KS.setQuocTich(request.getParameter("KS_QUOCTICH"));
		KS.setTP(request.getParameter("KS_THANHPHO"));
		KS.setQuan(request.getParameter("KS_QUAN"));
		KS.setPhuong(request.getParameter("KS_PHUONG"));
		KS.setDiaChi(request.getParameter("KS_DIACHI"));
		KS.setCoSoSinhSan(request.getParameter("KS_CSSS"));
		KS.setQuocTich_CSSS(request.getParameter("KS_QUOCGIA_CSSS"));
		KS.setTP_CSSS(request.getParameter("KS_THANHPHO_CSSS"));
		KS.setQuan_CSSS(request.getParameter("KS_QUAN_CSSS"));
		KS.setPhuong_CSSS(request.getParameter("KS_PHUONG_CSSS"));
		KS.setDiaChi_CSSS(request.getParameter("KS_DIACHI_CSSS"));
		
		KS.showImfor();
		
		NguoiThan ME = new NguoiThan();
		
		ME.setHoVaTen(request.getParameter("ME_HOVATEN"));
	//	try {
	//		ME.setNgaySinh(request.getParameter("ME_NGAYSINH"));
	//	} catch (ParseException e1) {
		//	// TODO Auto-generated catch block
			System.out.println("NGAY SINH ME" + request.getParameter("ME_NGAYSINH"));
		//}
		ME.setCMND(request.getParameter("ME_CMND"));
		ME.setNoiCap(request.getParameter("ME_NOICAP"));
	//	try {
	//		ME.setNgayCap(request.getParameter("ME_NGAYCAP"));
	//	} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAY CAP ME " + request.getParameter("ME_NGAYCAP"));
		//}
		ME.setDanToc(request.getParameter("ME_DANTOC"));
		ME.setQuocTich(request.getParameter("ME_QUOCTICH"));
		ME.setTP(request.getParameter("ME_THANHPHO"));
		ME.setQuan(request.getParameter("ME_QUAN"));
		ME.setPhuong(request.getParameter("ME_PHUONG"));
		ME.setDiaChi(request.getParameter("ME_DIACHI"));
		
        NguoiThan CHA = new NguoiThan();
		
		CHA.setHoVaTen(request.getParameter("CHA_HOVATEN"));
	///	try {
			//CHA.setNgaySinh(request.getParameter("CHA_NGAYSINH"));
	//	} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("NGAYSINH CHA: " + request.getParameter("CHA_NGAYSINH"));
		//}
		CHA.setCMND(request.getParameter("CHA_CMND"));
		CHA.setNoiCap(request.getParameter("CHA_NOICAP"));
	// {
	//		CHA.setNgayCap(request.getParameter("CHA_NGAYCAP"));
	//	} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("Ngay Cap Cha" + request.getParameter("CHA_NGAYCAP"));
	//	}
		CHA.setDanToc(request.getParameter("CHA_DANTOC"));
		CHA.setQuocTich(request.getParameter("CHA_QUOCTICH"));
		CHA.setTP(request.getParameter("CHA_THANHPHO"));
		CHA.setQuan(request.getParameter("CHA_QUAN"));
		CHA.setPhuong(request.getParameter("CHA_PHUONG"));
		CHA.setDiaChi(request.getParameter("CHA_DIACHI"));
		
		DangKyKhaiSinh DK = new DangKyKhaiSinh(NYC, KS,CHA, ME);
		
	   // DK.ShowDangKyKhaiSinh();
		
	
		
	
		
		try {
			if( DKKS.INSERT_DK_KHAISINH())
			System.out.println("Successsssssssssssssssssssssssssss");
			else
				System.out.println("failllllllllllllllllllllllllllll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/XacNhanDangKy.jsp");
		dispatcher.forward(request, response);
		
	
	}

}

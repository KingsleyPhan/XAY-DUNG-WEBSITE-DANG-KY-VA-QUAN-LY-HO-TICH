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
import DAO.DAO_DK_KETHON;
import DAO.DAO_DK_KHAISINH;
import DAO.DAO_PHUONG;
import DAO.DAO_QUAN;
import DAO.DAO_THANHPHO;
import Entities.KetHon.DangKyKetHon;
import Entities.KetHon.DoiTuongKetHon;
import Entities.KhaiSinh.DangKyKhaiSinh;
import Entities.KhaiSinh.KhaiSinh;
import Entities.KhaiSinh.NguoiThan;
import Entities.KhaiSinh.NguoiYeuCau;

/**
 * Servlet implementation class NopKhaiSinhServlet
 */
@WebServlet("/NopKetHon.php")
public class NopKetHonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NopKetHonServlet() 
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
		DAO_DK_KETHON DKKH = new DAO_DK_KETHON(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		DAO_DANTOC DANTOC = new DAO_DANTOC(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		DoiTuongKetHon CHONG = new  DoiTuongKetHon();
		
		CHONG.setHOTEN(request.getParameter("CHONG_HOVATEN"));
		
		try {
			CHONG.setNGAYSINH(request.getParameter("CHONG_NGAYSINH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("CHONG_NGAYSINH: " + request.getParameter("CHONG_NGAYSINH"));
		}
		
		CHONG.setCMND(request.getParameter("CHONG_CMND"));
		CHONG.setCMND_NOICAP(request.getParameter("CHONG_NOICAP"));
		

		try {
			CHONG.setCMND_NGAYCAP(request.getParameter("CHONG_NGAYCAP"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("CHONG_NGAYCAP: " + request.getParameter("CHONG_NGAYCAP"));
		}
		
		String DanTocValue = request.getParameter("CHONG_DANTOC");
		try {
			CHONG.setDANTOC(DANTOC.GET_NAME_DANTOC(DanTocValue));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		CHONG.setQUOCTICH(request.getParameter("CHONG_QUOCTICH"));
		CHONG.setLAN(request.getParameter("CHONG_SOLANKETHON"));
		
		String ID_THANHPHO = request.getParameter("CHONG_THANHPHO");
		String ID_QUAN  = request.getParameter("CHONG_QUAN");
		String ID_PHUONG = request.getParameter("CHONG_PHUONG");
	
		try 
		{
			CHONG.setTHANHPHO(TP.GET_NAME_TP(ID_THANHPHO));
			CHONG.setQUAN(QUAN.GET_NAME_QUAN(ID_QUAN));
			CHONG.setPHUONG(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
		} 
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}
	
		CHONG.setDIACHI(request.getParameter("CHONG_DIACHI"));
		
		
DoiTuongKetHon VO = new  DoiTuongKetHon();
		
		VO.setHOTEN(request.getParameter("VO_HOVATEN"));
		
		try {
			VO.setNGAYSINH(request.getParameter("VO_NGAYSINH"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("VO_NGAYSINH: " + request.getParameter("VO_NGAYSINH"));
		}
		
		VO.setCMND(request.getParameter("VO_CMND"));
		VO.setCMND_NOICAP(request.getParameter("VO_NOICAP"));
		

		try {
			VO.setCMND_NGAYCAP(request.getParameter("VO_NGAYCAP"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			System.out.println("VO_NGAYCAP: " + request.getParameter("VO_NGAYCAP"));
		}
		
		 DanTocValue = request.getParameter("VO_DANTOC");
		try {
			VO.setDANTOC(DANTOC.GET_NAME_DANTOC(DanTocValue));
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		VO.setQUOCTICH(request.getParameter("VO_QUOCTICH"));
		VO.setLAN(request.getParameter("VO_SOLANKETHON"));
		
		 ID_THANHPHO = request.getParameter("VO_THANHPHO");
		  ID_QUAN  = request.getParameter("VO_QUAN");
		  ID_PHUONG = request.getParameter("VO_PHUONG");
	
		try 
		{
			VO.setTHANHPHO(TP.GET_NAME_TP(ID_THANHPHO));
			VO.setQUAN(QUAN.GET_NAME_QUAN(ID_QUAN));
			VO.setPHUONG(PHUONG.GET_NAME_PHUONG(ID_PHUONG));
		} 
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}
	
		VO.setDIACHI(request.getParameter("VO_DIACHI"));
		
		CHONG.ShowImFor();
		VO.ShowImFor();
		
		DangKyKetHon KH  = new DangKyKetHon(VO, CHONG);
		
		try {
			DKKH.INSERT_DK_KETHON(1, 5, KH);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/XacNhanDangKy_1.jsp");
		dispatcher.forward(request, response);
		
	
	}

}

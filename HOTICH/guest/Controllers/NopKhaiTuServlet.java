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
import DAO.DAO_DK_KHAITU;
import DAO.DAO_PHUONG;
import DAO.DAO_QUAN;
import DAO.DAO_THANHPHO;
import Entities.KhaiSinh.DangKyKhaiSinh;
import Entities.KhaiSinh.KhaiSinh;
import Entities.KhaiSinh.NguoiThan;
import Entities.KhaiSinh.NguoiYeuCau;

/**
 * Servlet implementation class NopKhaiSinhServlet
 */
@WebServlet("/NopKhaiTu.php")
public class NopKhaiTuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NopKhaiTuServlet() 
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
		DAO_DK_KHAITU DKKT = new DAO_DK_KHAITU(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		DAO_DANTOC DANTOC = new DAO_DANTOC(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
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
		
		
	   NYC.setQuanHe(request.getParameter("NYC_QUANHEKHAC"));
		if (NYC.getQuanHe() == null || NYC.getQuanHe().trim()=="")
			NYC.setQuanHe(request.getParameter("NYC_QUANHE"));
		
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
		
		NYC.showImfor();
		
		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/XacNhanDangKy.jsp");
		dispatcher.forward(request, response);
		
	
	}

}

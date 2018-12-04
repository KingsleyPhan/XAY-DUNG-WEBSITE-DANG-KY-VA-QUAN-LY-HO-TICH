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
		DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		DAO_DANTOC DANTOC = new DAO_DANTOC(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/XacNhanDangKy.jsp");
		dispatcher.forward(request, response);
		
	
	}

}

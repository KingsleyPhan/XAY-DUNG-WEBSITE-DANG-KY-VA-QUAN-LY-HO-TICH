package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Consts;
import DAO.HoTichDAO;
import Service.HoTichService;
import Service.SendMail;

@WebServlet({"/PhanHoiEmail"})
public class PhanHoiCongDan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HoTichService hoTichService;
	
    public PhanHoiCongDan() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoTichService = new HoTichService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("NYC_EMAIL") ;
		
		String sdt = request.getParameter("NYC_SDT"); //mặc định là pass
		
		String noiDung = request.getParameter("NOIDUNG");
		
		
		
		SendMail.send("phanvanphuocthinh@gmail.com","Testcheking", noiDung, email,sdt);
		
		response.sendRedirect("DangNhap.php");
	}

}

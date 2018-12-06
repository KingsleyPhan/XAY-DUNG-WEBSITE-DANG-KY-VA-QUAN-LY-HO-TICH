package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.HoTichDAO;
import DAO.ThongKeDAO;

@WebServlet("/ThongKe")
public class ThongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ThongKeDAO thongKeDAO ;
       
    public ThongKeServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		thongKeDAO = new ThongKeDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String page = "";
		page = "/CONTENT/jsp/officer/ThongKe.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		int thang = Integer.parseInt(request.getParameter("thang"));
		
		PrintWriter out = response.getWriter();
		try {
			out.print(thongKeDAO.getHSDK_Thang(thang, 1));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}

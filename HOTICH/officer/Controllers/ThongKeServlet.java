package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.ThongKeDAO;

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
		
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "Loai1":
			getLoai1(request,response);
			break;
		case "Loai2":
			getLoai2(request,response);
			break;
			default :
				break;
		}
		
		
		
	}

	private void getLoai1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int thang = Integer.parseInt(request.getParameter("thang"));
		
		PrintWriter out = response.getWriter();
		try {
			out.print(thongKeDAO.getHSDK_Thang(thang, Consts.Get_COQUAN_ID()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void getLoai2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int nam = Integer.parseInt(request.getParameter("nam"));
		
		PrintWriter out = response.getWriter();
		try {
			out.print(thongKeDAO.getHSDK_Nam(nam, Consts.Get_COQUAN_ID()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

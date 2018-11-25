package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DangKyKhaiSinhDAO;
import Entities.HoSoDangKy.HoSoKhaiSinh;

/**
 * Servlet implementation class GiayHoTichServlet
 */
public class GiayHoTichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GiayHoTichServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	DangKyKhaiSinhDAO dangKyKhaiSinhDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		int id = 0;
		ServletContext context = getServletContext();
		context.setAttribute("ID_HSDK", id);
		dangKyKhaiSinhDAO = new DangKyKhaiSinhDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			kiemDuyet(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void kiemDuyet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, ParseException {
		ServletContext context = getServletContext();
		int id = (Integer) context.getAttribute("ID_HSDK");
		if(id != 0) {
			context.setAttribute("ID_HSDK", 0);
			HoSoKhaiSinh hoSoKhaiSinh = dangKyKhaiSinhDAO.getHSDKKhaiSinh(id);
			request.setAttribute("khaisinh", hoSoKhaiSinh);
			
			String action = "KiemDuyet";
			request.setAttribute("action", action);
			String page = "";
			page = "/CONTENT/jsp/DangKyKhaiSinh.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
			return;
		}
		String page = "";
		page = "DangKyKhaiSinh.php";
		response.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub

		String action = request.getRequestURI();
		String[] words = action.split("/");
		switch (words[words.length - 1]) {
		case "setID":
			setID(request);
			break;
		default:
			break;
		}
	}
	
	private void setID(HttpServletRequest request) {
		ServletContext context = getServletContext();
		int id = Integer.parseInt(request.getParameter("id"));
		context.setAttribute("ID_HSDK", id);
	}

}

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
public class HoSoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HoSoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	DangKyKhaiSinhDAO dangKyKhaiSinhDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		int id = 0;
		int loai = 0;
		ServletContext context = getServletContext();
		context.setAttribute("ID_HSDK", id);
		context.setAttribute("LoaiGiay", loai);
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
		String action = request.getRequestURI();
		String[] words=action.split("/");
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
		int loai = (Integer) context.getAttribute("LoaiGiay");
		String page = "";
		if(id != 0) {
			context.setAttribute("ID_HSDK", 0);
			context.setAttribute("LoaiGiay", 0);
			switch (loai) {
			case 1:
				HoSoKhaiSinh hoSoKhaiSinh = dangKyKhaiSinhDAO.getHSDKKhaiSinh(id);
				if(hoSoKhaiSinh != null) {
					request.setAttribute("khaisinh", hoSoKhaiSinh);
					System.out.println(hoSoKhaiSinh.toString());
					String action = "KiemDuyet";
					request.setAttribute("action", action);
					page = "/CONTENT/jsp/DangKyKhaiSinh.jsp";
					RequestDispatcher dispatcher = request.getRequestDispatcher(page);
					dispatcher.forward(request, response);
					return;
				}
				
				page = "HoSoDangKy";
				response.sendRedirect(page);
				return;
			case 2:

				break;
			case 3:

				break;
			default:
				page = "HoSoDangKy";
				response.sendRedirect(page);
				return;
			}
		}
		page = "DangKyKhaiSinh.php";
		response.sendRedirect(page);
		return;
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
		int loai = Integer.parseInt(request.getParameter("loai"));
		context.setAttribute("ID_HSDK", id);
		context.setAttribute("LoaiGiay", loai);
	}

}

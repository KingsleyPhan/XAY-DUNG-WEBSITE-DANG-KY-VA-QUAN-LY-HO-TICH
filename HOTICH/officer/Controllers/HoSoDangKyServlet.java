package Controllers;

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

public class HoSoDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HoSoDangKyServlet() {
		super();
	}

	DangKyKhaiSinhDAO dangKyKhaiSinhDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext context = getServletContext();
		context.setAttribute("ID_HSDK", 0);
		context.setAttribute("Loai_GiayTo", 0);
		dangKyKhaiSinhDAO = new DangKyKhaiSinhDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		kiemDuyet(request,response);
		
		
	}

	private void kiemDuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "";
		ServletContext context = getServletContext();
		int id = (Integer) context.getAttribute("ID_HSDK");
		int loai = (Integer) context.getAttribute("Loai_GiayTo");
		if(id != 0) {
			try {
				switch (loai) {
				case 1:
					context.setAttribute("ID_HSDK", 0);
					context.setAttribute("Loai_GiayTo", 0);
					HoSoKhaiSinh hoSoKhaiSinh = dangKyKhaiSinhDAO.getHSDKKhaiSinh(id);
					if(hoSoKhaiSinh != null)
					{
						request.setAttribute("khaisinh", hoSoKhaiSinh);
						
						String action = "KiemDuyet";
						request.setAttribute("action", action);
						
						page = "/CONTENT/jsp/DangKyKhaiSinh.jsp";

						RequestDispatcher dispatcher = request.getRequestDispatcher(page);
						dispatcher.forward(request, response);
						return;
					}
					page = "QuanLyDangKy";
					response.sendRedirect(page);
					return;
				case 2:
					break;
				case 3:
					break;
				default:
					break;
				}
				
			} catch (SQLException | ParseException e) {
				e.printStackTrace();
			}
		}
		page = "QuanLyDangKy";
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String action = request.getRequestURI();
		String[] words = action.split("/");
		
		switch (words[words.length - 1]) {
		case "setHSDK":
			setHSDK(request);
			break;
		default:
			break;
		}
	}
	
	private void setHSDK(HttpServletRequest request) {
		ServletContext context = getServletContext();
		int id = Integer.parseInt(request.getParameter("id"));
		int loai = Integer.parseInt(request.getParameter("loai"));
		context.setAttribute("ID_HSDK", id);
		context.setAttribute("Loai_GiayTo", loai);
	}

}

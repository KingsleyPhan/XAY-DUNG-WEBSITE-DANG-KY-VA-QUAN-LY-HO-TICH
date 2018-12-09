package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Consts;
import DAO.DangKyKhaiSinhDAO;
import Entities.HoSoDangKy.HoSoKhaiSinh;
import Service.HoSoDangKyService;

public class HoSoDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HoSoDangKyServlet() {
		super();
	}

	DangKyKhaiSinhDAO dangKyKhaiSinhDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext context = getServletContext();
		context.setAttribute("HSDK_ID", 0);
		context.setAttribute("HSDK_LOAI", 0);
//		context.setAttribute("HSDK_MA", "");
//		context.setAttribute("HSDK_TEN", "");
		dangKyKhaiSinhDAO = new DangKyKhaiSinhDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getRequestURI();
		String[] words = action.split("/");
		
		switch (words[words.length - 1]) {
		case "setHSDK":
			setHSDK(request,response);
			break;
		default:
			kiemDuyet(request,response);
			break;
		}
	}

	private void kiemDuyet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String page = "";
		
		ServletContext context = getServletContext();
		HttpSession session = request.getSession();
		
		int id = Integer.parseInt(context.getAttribute("HSDK_ID").toString());
		int loai = Integer.parseInt(context.getAttribute("HSDK_LOAI").toString());
		
		if(id != 0) {
			try {
				switch (loai) {
				case 1:
					context.setAttribute("HSDK_ID", 0);
					context.setAttribute("HSDK_LOAI", 0);
					
					HoSoKhaiSinh hoSoKhaiSinh = dangKyKhaiSinhDAO.getHSDKKhaiSinh(id);
					if(hoSoKhaiSinh != null)
					{
						session.setAttribute("NYC_HOVATEN_SUBMIT", hoSoKhaiSinh.getNgYeuCau().getHoVaTen());
						request.setAttribute("khaisinh", hoSoKhaiSinh);
						String action = "KiemDuyet";
						request.setAttribute("action", action);
						
						page = "/CONTENT/jsp/officer/KiemDuyet.jsp";

						RequestDispatcher dispatcher = request.getRequestDispatcher(page);
						dispatcher.forward(request, response);
						return;
					}
					page = "QuanLyDangKy";
					response.sendRedirect(page);
					return;
				case 2:
					context.setAttribute("HSDK_ID", 0);
					context.setAttribute("HSDK_LOAI", 0);
//					context.setAttribute("HSDK_MA", "");
//					context.setAttribute("HSDK_TEN", "");
					break;
				case 3:
					context.setAttribute("HSDK_ID", 0);
					context.setAttribute("HSDK_LOAI", 0);
//					context.setAttribute("HSDK_MA", "");
//					context.setAttribute("HSDK_TEN", "");
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
	
	private void setHSDK(HttpServletRequest request,HttpServletResponse response) throws IOException {
		ServletContext context = getServletContext();
		int id = Integer.parseInt(request.getParameter("id"));
		int loai = Integer.parseInt(request.getParameter("loai"));
		
		context.setAttribute("HSDK_ID", id);
		context.setAttribute("HSDK_LOAI", loai);
//		context.setAttribute("HSDK_MA", request.getParameter("ma"));
//		context.setAttribute("HSDK_TEN", request.getParameter("ten"));
		
		HttpSession session = request.getSession();
		
		session.setAttribute("HSDK_ID", id);
		session.setAttribute("HSDK_LOAI", loai);
		session.setAttribute("HSDK_MA", request.getParameter("ma"));
		session.setAttribute("HSDK_TEN", request.getParameter("ten"));
		
		String page = request.getContextPath() + "/HoSoDangKy";
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String action = request.getRequestURI();
		String[] words = action.split("/");
		
		switch (words[words.length - 1]) {
		case "getInfo":
			try {
				out.println(getInfo(request, response));
			} catch (SQLException | ParseException e) {
				e.printStackTrace();
				out.println("");
			}
			return;
		case "getInfo1":
			try {
				out.println(getInfo1(request, response));
			} catch (SQLException | ParseException e) {
				e.printStackTrace();
				out.println("");
			}
			return;
		case "xacNhan":
			try {
				XacNhanHSDK(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				try {
					throw new Exception(e);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
			break;
		default:
			break;
		}
	}
	
	private String getInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
		String cmndNgYeuCau = request.getParameter("cmndNgYeuCau");
		String cmndCha = request.getParameter("cmndCha");
		String cmndMe = request.getParameter("cmndMe");
		HoSoDangKyService service = new HoSoDangKyService();
		return service.getCheckKhaiSinhService(cmndNgYeuCau, cmndCha, cmndMe);
	}
	
	private String getInfo1(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
		String cmnd = request.getParameter("cmnd");
		HoSoDangKyService service = new HoSoDangKyService();
		return service.getCheckCongDanService(cmnd);
	}
	
	private void XacNhanHSDK(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		
		String message = "";
		String content = "";
		
		String error = request.getParameter("ERROR");
		
		if(error.equals("NoError")) {
			message = "Success";
			content = "Sẽ lấy thông tin để phản hồi thêm";
		}
		else {
			if(error.equals("Error")) {
				message = "Error";
				content = "Vui lòng điền lại tờ khai";
			}
			else {
				message = "HaveMessage";
				content = error;
			}
		}
		session.setAttribute("message", message);
		session.setAttribute("content", content);
		
		String page="";
		page = request.getContextPath()+"/PhanHoi";
		response.sendRedirect(page);
	}
}

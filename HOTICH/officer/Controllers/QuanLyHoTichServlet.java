package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

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
import Entities.HoTich;

public class QuanLyHoTichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HoTichDAO hoTichDAO;
	
    public QuanLyHoTichServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoTichDAO = new HoTichDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String page = "";
		page = "/CONTENT/jsp/officer/QuanLyHoTich_New.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "getAll":
			GetAll(request, response);
			break;
		case "insert":
			try {
				InsertHoTich(request, response);
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
	private void GetAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int loaiGiay = Integer.parseInt(request.getParameter("key"));
		PrintWriter out = response.getWriter();
		StringBuilder data = new StringBuilder();
		List<HoTich> DSHoTich;
		data.append("{ \"hotich\":[");
		try {
			if (loaiGiay == -1)
			{
				DSHoTich= hoTichDAO.getAllHoTichCoQuan(1);
			}
			else
			{
				//Chua xu ly
				DSHoTich= hoTichDAO.getAllHoTichCoQuan(1);
			}
			for (int i = 0; i < DSHoTich.size(); i++) {
				StringBuilder temp = new StringBuilder();
				if (i == DSHoTich.size() - 1) { //Trường hợp dòng cuối cùng sẽ không có dấu ","
					temp.append(DSHoTich.get(i).toStringBuilder());
					
				}
				else
				{
					temp.append(DSHoTich.get(i).toStringBuilder());
					temp.append(",");
				}
				data.append(temp);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (ParseException e) {
			e.printStackTrace();
		}
		data.append("]}");
		out.println(data.toString());
	}
	
	private void InsertHoTich(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		String message = "";
		String content = "";
		String error = request.getParameter("ERROR");
		if(error.equals("NoError")) {
			int idHSDK = Integer.parseInt(request.getParameter("HSDK_ID"));
			int idLoai = Integer.parseInt(request.getParameter("HSDK_LOAI"));
			
			int ngXuLy = 2;
			int ngKy = 2;
			try {
				if(hoTichDAO.insertHoTich(idHSDK, idLoai, ngXuLy, ngKy)) {
					message = "Success";
					content = "Sẽ lấy thông tin để phản hồi thêm";
				}
				else {
					String page="";
					page = request.getContextPath()+"/QuanLyDangKy";
					response.sendRedirect(page);
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception(e);
			}
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

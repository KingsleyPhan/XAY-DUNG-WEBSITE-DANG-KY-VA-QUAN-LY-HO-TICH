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
			InsertHoTich(request, response);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		data.append("]}");
		out.println(data.toString());
	}
	
	private void InsertHoTich(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		int idHSDK = Integer.parseInt(request.getParameter("HSDK_ID"));
		int idLoai = Integer.parseInt(request.getParameter("HSDK_LOAI"));
		int ngXuLy = 2;
		int ngKy = 2;
		if(hoTichDAO.insertHoTich(idHSDK, idLoai, ngXuLy, ngKy)) {
			String message = "Xử lý thành công";
			session.setAttribute("message", message);
			String page="";
			page = "../PhanHoi";
			response.sendRedirect(page);
		}
		else {
			String message = "";
			session.setAttribute("message", message);
			String page="";
			page = "../PhanHoi";
			response.sendRedirect(page);
		}
		
	}
}

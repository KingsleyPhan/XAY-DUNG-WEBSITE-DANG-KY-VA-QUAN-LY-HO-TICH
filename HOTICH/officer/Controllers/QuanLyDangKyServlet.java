package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.Consts;
import DAO.HoSoDangKyDAO;

public class QuanLyDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HoSoDangKyDAO hoSoDangKyDAO;
	List<Map<Object,Object>> listHSDK ;

	public QuanLyDangKyServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoSoDangKyDAO = new HoSoDangKyDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		listHSDK = new ArrayList<Map<Object,Object>>();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("feedback") != null) {
			String feedback = session.getAttribute("feedback").toString();
			request.setAttribute("feedback", feedback);
		}
		Consts.removeSession(session);
		
		String page = "";
		page = "/CONTENT/jsp/officer/QuanLyHoSoDangKy_New.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "getAll":
			GetAll(request, response);
			break;
		default:
			break;
		}
	}
	
	private void GetAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int loaiGiay = Integer.parseInt(request.getParameter("key"));
		
		PrintWriter out = response.getWriter();
		
		Gson gsonObj = new Gson();
		
		try {
			if (loaiGiay == -1)
			{
				listHSDK = hoSoDangKyDAO.getAllHSDK(Consts.COQUAN_ID);
			}
			else
			{
				listHSDK = hoSoDangKyDAO.getAllHSDK(Consts.COQUAN_ID);
			}
			String dataPoints = gsonObj.toJson(listHSDK);
			
			out.print(dataPoints);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

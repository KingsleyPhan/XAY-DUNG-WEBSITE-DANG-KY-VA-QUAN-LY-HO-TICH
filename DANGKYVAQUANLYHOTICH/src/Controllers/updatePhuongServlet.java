package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.PHUONG;
import Models.CapPhuongService;


@WebServlet("/updatePhuongServlet")
public class updatePhuongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updatePhuongServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String valueajax = request.getParameter("valajax");
			System.out.println("Value: " + valueajax);
			
			ArrayList<PHUONG> PHUONGLST = new ArrayList<PHUONG>();
			CapPhuongService CAPPHUONG = new CapPhuongService();
			
			PHUONGLST = CAPPHUONG.SearchPHUONGOFQUAN(valueajax);
			
			if (valueajax.equals("") == false)
			{
				System.out.println("vo 1");
				response.getWriter().write("Dropdown 2: <select>");
				for (int i = 0; i < PHUONGLST.size(); i++) {
					response.getWriter().write("<option value="+ PHUONGLST.get(i).getPhuong_ID() +">" + PHUONGLST.get(i).getPhuong_Ten() + "</option>");
				}
				response.getWriter().write("</select>");
			} 
				
			
			

		}

	}

}

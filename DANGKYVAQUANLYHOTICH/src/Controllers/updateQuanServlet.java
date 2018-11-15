package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.QUAN;
import Models.CapQuanService;

@WebServlet("/updateQuanServlet")
public class updateQuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateQuanServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String valueajax = request.getParameter("valajax");
			System.out.println("Value: " + valueajax);
			
			ArrayList<QUAN> QUAN = new ArrayList<QUAN>();
			CapQuanService CAPQUAN = new CapQuanService();
			
			QUAN = CAPQUAN.SearchThanhPhoOfQuan(valueajax);
			
			if (valueajax.equals("") == false)
			{
				System.out.println("vo 1");
				response.getWriter().write("Dropdown 2: <select>");
				for (int i = 0; i < QUAN.size(); i++) {
					response.getWriter().write("<option value="+ QUAN.get(i).getQuan_ID() +">" + QUAN.get(i).getQuan_Ten() + "</option>");
				}
				response.getWriter().write("</select>");
			} 
				
			
			

		}

	}

}

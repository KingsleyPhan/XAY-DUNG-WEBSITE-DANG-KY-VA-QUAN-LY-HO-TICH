package Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DangNhap
 */
@WebServlet("/DangNhap.php")
public class DangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DangNhap() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/DangNhap.jsp");
		dispatcher.forward(request, response);
		return;
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String TenThanhPho;
		TenThanhPho = request.getParameter("ComboTHANHPHO");
		System.out.println(TenThanhPho);
	}

}

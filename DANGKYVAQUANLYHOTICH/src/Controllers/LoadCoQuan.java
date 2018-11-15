package Controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoadCoQuan
 */
@WebServlet("/LoadCoQuan.php")
public class LoadCoQuan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadCoQuan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eventSelect = request.getParameter("eventSelect");
        String comNameChanged = request.getParameter("comName");
        if(eventSelect.equals(comNameChanged)){
            if(comNameChanged.equals("Company1")){
                List<String> listemp1 = new ArrayList<String>();
                listemp1.add("John");
                listemp1.add("Mary");
                listemp1.add("Jack");
                listemp1.add("Bob");
                response.getWriter().print(listemp1);
            }
            else {
                List<String> listemp2 = new ArrayList<String>();
                listemp2.add("Mon");
                listemp2.add("Pha");
                listemp2.add("Gon");
                listemp2.add("Boa");
                response.getWriter().print(listemp2);           
            }
        }
		return;
	}

}

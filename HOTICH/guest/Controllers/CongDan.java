package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DAO_COQUAN;
import Entities.CoQuanCongQuyen;
import Models.StoreEntity;

/**
 * Servlet implementation class CongDan
 */
@WebServlet("/CongDan.php")
public class CongDan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CongDan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO_COQUAN DCQ = new DAO_COQUAN(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		CoQuanCongQuyen CQ = new CoQuanCongQuyen();
		
		try {
			CQ = DCQ.Get_CoQuan();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("SDTCQ", CQ.getCoQuan_SDT());
		System.out.println("So Dien Thoai Co Quan: " + CQ.getCoQuan_SDT());
		request.setAttribute("DCCQ", CQ.getCoQuan_DiaChi());
		System.out.println("Dia Chi Co Quan: " + CQ.getCoQuan_DiaChi());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/CongDan.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

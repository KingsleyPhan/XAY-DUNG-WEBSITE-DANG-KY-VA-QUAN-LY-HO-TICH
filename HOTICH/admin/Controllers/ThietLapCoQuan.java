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

/**
 * Servlet implementation class ThietLapCoQuan
 */
@WebServlet("/ThietLapCoQuan")
public class ThietLapCoQuan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThietLapCoQuan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		DAO_COQUAN CQ = new DAO_COQUAN(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		
		CoQuanCongQuyen CQCQ = new CoQuanCongQuyen();
		
		try {
			CQCQ = CQ.Get_CoQuan();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("DIACHI: " + CQCQ.getCoQuan_DiaChi());
		
		request.setAttribute("DCCQ", CQCQ.getCoQuan_DiaChi());
		request.setAttribute("SDTCQ",CQCQ.getCoQuan_SDT() );
		request.setAttribute("EMAILCOQUAN", CQCQ.getCoQuan_Email() );
		request.setAttribute("GioiThieuCoQuan",CQCQ.getCoQuan_GioiThieu() );
		request.setAttribute("TR_TEN", CQCQ.getCoQuan_TR_TEN());
		request.setAttribute("TR_SDT",CQCQ.getCoQuan_TR_Sdt() );
		request.setAttribute("TR_EMAIL", CQCQ.getCoQuan_TR_Email());
		request.setAttribute("PR_TEN",CQCQ.getCoQuan_PR_TEN() );
		request.setAttribute("PR_SDT", CQCQ.getCoQuan_PR_Sdt());
		request.setAttribute("PR_EMAIL", CQCQ.getCoQuan_PR_Email());
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/admin/AdminCoQuan.jsp");
		dispatcher.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

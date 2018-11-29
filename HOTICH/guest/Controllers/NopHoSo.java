package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Store;

import DAO.Consts;
import DAO.DAO_DK_KHAISINH;
import Models.StoreEntity;

/**
 * Servlet implementation class NopHoSo
 */
@WebServlet("/NopHoSo")
public class NopHoSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NopHoSo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Email = request.getParameter("xacNhanEmail");
		String SDT = request.getParameter("xacNhanDienThoai");
		try {
			if( DKKS.INSERT_DK_KHAISINH(Consts.COQUAN_ID, 5, Email, SDT, StoreEntity.DKKS))
			{
			System.out.println("Successsssssssssssssssssssssssssss");
			StoreEntity.DKKS = null;
			}
			else
				System.out.println("failllllllllllllllllllllllllllll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   response.sendRedirect("DangNhap.php");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

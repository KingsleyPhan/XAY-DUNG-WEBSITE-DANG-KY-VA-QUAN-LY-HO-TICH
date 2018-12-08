package Controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DAO_NGUOIDUNG;
import DAO.DAO_QUYEN;
import Entities.NguoiDungA;

/**
 * Servlet implementation class DangNhapHeThong
 */
@WebServlet("/DangNhapHeThong")
public class DangNhapHeThong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapHeThong() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String Passs = request.getParameter("password");
		
		DAO_NGUOIDUNG user  = new DAO_NGUOIDUNG(Consts.ServerUrl,Consts.UserName, Consts.Pass );
	   
		DAO_QUYEN GetQuyen =  new DAO_QUYEN(Consts.ServerUrl,Consts.UserName, Consts.Pass );
		
		
		
	    NguoiDungA us = new NguoiDungA();
		
	    try {
			us = user.SeacrhNguoiDung(username.trim(), Passs.trim());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    if(us.getQuyen()!=null)
	    {
	    	try {
				String Quyen = GetQuyen.GET_QUYEN_ROLL(us.getQuyen());
				if(Quyen.trim().equals("ADMINCOQUAN"))
				{
					
					Consts.NGUOIDUNG_ID = us.getID();
					
					System.out.println("Nguoi dung: " + Consts.NGUOIDUNG_ID);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/admin/AdminNguoiDung.jsp");
					dispatcher.forward(request, response);
					return;
				}
				else
				{
					if(Quyen.trim().equals("CANBOHOTICH"))
					{
						Consts.NGUOIDUNG_ID = us.getID();
						System.out.println("Nguoi dung: " + Consts.NGUOIDUNG_ID);
						RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/officer/QuanLyHoTich_New.jsp");
						dispatcher.forward(request, response);
						return;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

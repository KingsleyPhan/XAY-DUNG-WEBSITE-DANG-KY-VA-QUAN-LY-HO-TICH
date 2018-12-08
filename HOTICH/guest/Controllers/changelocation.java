package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DAO_COQUAN;
import DAO.DAO_PHUONG;
import DAO.DAO_QUAN;
import DAO.DAO_THANHPHO;

/**
 * Servlet implementation class changelocation
 */
@WebServlet("/changelocation")
public class changelocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changelocation() {
        super();
        // TODO Auto-generated constructor stub
    }

  
    String Tinh_ID="";
    String Quan_ID="";
    String Phuong_ID="";
    
    String Tinh="";
    String Quan="";
    String Phuong="";
    
	DAO_THANHPHO TP = new DAO_THANHPHO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	DAO_QUAN QUAN  = new DAO_QUAN(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	DAO_PHUONG PHUONG = new DAO_PHUONG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	DAO_COQUAN COQUAN = new DAO_COQUAN(Consts.ServerUrl, Consts.UserName, Consts.Pass);
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
				Tinh_ID = request.getParameter("id_TP");
				Quan_ID = request.getParameter("modal-quan");
				Phuong_ID = request.getParameter("modal-xaPhuong");
		
			try {
				if(COQUAN.TrangThaiCoQuan(Integer.parseInt(Tinh_ID),Integer.parseInt(Quan_ID),Integer.parseInt(Phuong_ID)))
				{
				     try {
						Tinh = TP.GET_CQ_TP(Tinh_ID);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				     
				     try {
						Quan = QUAN.GET_CQ_QUAN(Quan_ID);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				     
				     try {
						Phuong = PHUONG.GET_CQ_PHUONG(Phuong_ID);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				 	Consts.LocationCap1=Tinh;
					Consts.LocationCap2=Phuong + " " + Quan;
					
					 Consts.OpenWebsite=true;
					 Consts.COQUAN_ID = COQUAN.GET_COQUAN_ID(Integer.parseInt(Tinh_ID),Integer.parseInt(Quan_ID),Integer.parseInt(Phuong_ID));
					   
					
					
					    Tinh_ID="";
					    Quan_ID="";
					    Phuong_ID="";
					    
					    Tinh="";
					     Quan="";
					   Phuong="";
					   
					   System.out.println("Cơ quan: " + Consts.Get_COQUAN_ID());
					  
					   
						RequestDispatcher dispatcher = request.getRequestDispatcher("DangNhap.php");
						dispatcher.forward(request, response);
				}
				else
				{
					
					Consts.LocationCap1 = "HỆ THÔNG ĐĂNG KÝ VÀ QUẢN LÝ HỘ TỊCH ONLINE";
					Consts.LocationCap2 = "NỘP HỒ SƠ TRỰC TUYẾN";
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("DangNhap.php");
					dispatcher.forward(request, response);
				}
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		// response.sendRedirect("DangNhap.php");
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

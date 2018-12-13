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
import DAO.DAO_HOSODANGKY;
import Entities.CoQuanCongQuyen;
import Entities.HoSo.HoSoDangKy;

/**
 * Servlet implementation class TraCuuHoSo
 */
@WebServlet("/TraCuuHoSo.php")
public class TraCuuHoSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraCuuHoSo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String MaHoSo  = request.getParameter("MaHoSo").trim();
		System.out.println("Ma ho so: " + MaHoSo);
		String MaLoaiGiay = request.getParameter("loaiHoSo").trim();
		System.out.println("Loai Hoso: "+ MaLoaiGiay);
		
       DAO_HOSODANGKY HS = new DAO_HOSODANGKY(Consts.ServerUrl,Consts.UserName, Consts.Pass);
		
		HoSoDangKy HSDK = new HoSoDangKy();
		
		try {
			HSDK = HS.Get_TraCuuHoSo(MaLoaiGiay,MaHoSo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  request.setAttribute("maHoSo", HSDK.MaHoSo);
		  request.setAttribute("TenGiayTo",HSDK.TenGiayTo );
		  request.setAttribute("NgayDangKy", HSDK.NgayDangKy);
		  request.setAttribute("Email", HSDK.Email);
		  request.setAttribute("SoDienThoai",HSDK.SDT );
		  request.setAttribute("TrangThai",HSDK.TrangThai );
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
		  
		  try
		  {
			  if(HSDK.Email.trim().equals(""))
			  {
				  RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/KetQuaTraCuu_2.jsp");
			      dispatcher.forward(request, response);
			  }
			  else
			  {
			  
				  RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/KetQuaTraCuu_1.jsp");
			      dispatcher.forward(request, response);
			  }
			
		  }
		  catch (Exception e)
		  {
			  RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/KetQuaTraCuu_2.jsp");
		      dispatcher.forward(request, response);
		  }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

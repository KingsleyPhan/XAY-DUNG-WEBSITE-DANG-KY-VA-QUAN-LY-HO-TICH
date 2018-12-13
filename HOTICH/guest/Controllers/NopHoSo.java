package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Store;

import DAO.Consts;
import DAO.DAO_COQUAN;
import DAO.DAO_DK_KETHON;
import DAO.DAO_DK_KHAISINH;
import Entities.CoQuanCongQuyen;
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
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Email = request.getParameter("xacNhanEmail");
		String SDT = request.getParameter("xacNhanDienThoai");
		DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl, Consts.UserName, Consts.Pass);
		if(StoreEntity.DKKS.IsEmty == false)
		{
			try 
			{
				
				
				if( DKKS.INSERT_DK_KHAISINH(Consts.COQUAN_ID, 1, Email, SDT, StoreEntity.DKKS))
				{
					System.out.println("Nộp giấy Khai Sinh thành công");
					StoreEntity.DKKS.IsEmty=true;
				}
				else
					System.out.println("Nộp giấy Khai Sinh failllll");
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			if(StoreEntity.DKKH.IsEmty==false)
			{
				
				try {
					
					DAO_DK_KETHON DKKetHon = new DAO_DK_KETHON(Consts.ServerUrl, Consts.UserName, Consts.Pass);
					if(DKKetHon.INSERT_DK_KETHON(Consts.COQUAN_ID, 3, Email, SDT, StoreEntity.DKKH))
					{
						System.out.println("Nộp giấy kết hôn thành công");
						StoreEntity.DKKH.IsEmty = true;
					}
					else
					{
						System.out.println("Nộp giấy Kết hôn failllll");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		String Codes="";
		try {
			Codes = DKKS.GetMAHOS();
			System.out.println("CODE: " + Codes);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("Code",Codes);
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("CONTENT/jsp/guest/KetQuaDangKy.jsp");
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

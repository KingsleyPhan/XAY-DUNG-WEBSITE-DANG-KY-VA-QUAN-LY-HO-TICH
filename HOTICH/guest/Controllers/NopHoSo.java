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
import DAO.DAO_DK_KETHON;
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
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Email = request.getParameter("xacNhanEmail");
		String SDT = request.getParameter("xacNhanDienThoai");
		
		if(StoreEntity.DKKS.IsEmty == false)
		{
			try 
			{
				DAO_DK_KHAISINH DKKS = new DAO_DK_KHAISINH(Consts.ServerUrl, Consts.UserName, Consts.Pass);
				
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

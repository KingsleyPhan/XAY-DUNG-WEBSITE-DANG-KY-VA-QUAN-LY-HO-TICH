package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import DAO.DAO_NGUOIDUNG;
import DAO.DAO_QUYEN;
import Entities.Decode;
import Entities.NguoiDungA;

/**
 * Servlet implementation class QuanLyNguoiDung
 */
@WebServlet("/QuanLyNguoiDung")
public class QuanLyNguoiDung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyNguoiDung() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String buttonAdd = request.getParameter("buttonSave");
		String buttonReset = request.getParameter("buttonReset");
		System.out.println("add nè: " + buttonAdd);
		System.out.println("rest nè: " + buttonReset);
		String FlatEdit = request.getParameter("store");
		System.out.println("Edit nè: " + FlatEdit);
		if(buttonAdd != null)
		{
			
			if(Integer.parseInt(FlatEdit)==1)
			{
				//Thêm Nhân viên mới
				NguoiDungA user = new NguoiDungA();
				
				user.setHoVaTen(request.getParameter("user_HoVaten"));
				try {
					user.setNgaySinh(request.getParameter("user_NgaySinh"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				user.setMaCanBo(request.getParameter("user_MACANBO"));
				user.setEmail(request.getParameter("user_Email"));
				user.setSDT(request.getParameter("user_SDT"));
			
				
				user.setChucVu(request.getParameter("user_ChucVu"));
				user.setCoQuan_ID(Consts.COQUAN_ID);
				
				String TranhThai = request.getParameter("user_TrangThai");
				System.out.println("Trang thái: " + TranhThai);
				if(TranhThai==null)
					user.setTrangThai("0");
				else
					user.setTrangThai("1");
				
				DAO_NGUOIDUNG USER_DAO = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
				
				
			
				user.setQuyen(request.getParameter("user_Quyen"));
					
					user.show();
				
				try {
					USER_DAO.UPDATE_NGUOIDUNG(user);
					System.out.println("Thanh cong Update nhan vien");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
			}
			else
			{
				//Thêm Nhân viên mới
				NguoiDungA user = new NguoiDungA();
				
				user.setHoVaTen(request.getParameter("user_HoVaten"));
				try {
					user.setNgaySinh(request.getParameter("user_NgaySinh"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				user.setMaCanBo(request.getParameter("user_MACANBO"));
				user.setEmail(request.getParameter("user_Email"));
				user.setSDT(request.getParameter("user_SDT"));
			
				user.setPassword(Decode.md5(request.getParameter("user_pass")));
				user.setUsername(request.getParameter("user_name"));
				user.setChucVu(request.getParameter("user_ChucVu"));
				user.setCoQuan_ID(Consts.COQUAN_ID);
				
				String TranhThai = request.getParameter("user_TrangThai");
				System.out.println("Trang thái: " + TranhThai);
				if(TranhThai==null)
					user.setTrangThai("0");
				else
					user.setTrangThai("1");
				
				DAO_NGUOIDUNG USER_DAO = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
				
				
			
					user.setQuyen(request.getParameter("user_Quyen"));
					
					user.show();
				
				try {
					USER_DAO.INSERT_NGUOIDUNG(user);
					System.out.println("Thanh cong them nhan vien");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
			
			
		}
		else
		if(buttonReset != null)
			{
			//Thêm Nhân viên mới
			NguoiDungA user = new NguoiDungA();
			user.setMaCanBo(request.getParameter("user_MACANBO"));
			user.setPassword(Decode.md5(request.getParameter("user_RSP")));
			DAO_NGUOIDUNG USER_DAO = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
			try {
				USER_DAO.UPDATE_PASS(user);
				System.out.println("Resset PAsss ok");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		response.sendRedirect("taikhoannguoidung");
	}

}

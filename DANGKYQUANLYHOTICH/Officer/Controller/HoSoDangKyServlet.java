package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Consts;
import Entities.HSDK;
import Models.HoSoDangKyDAO;

/**
 * Servlet implementation class HoSoDangKyServlet
 */
public class HoSoDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HoSoDangKyDAO hoSoDangKyDAO;
	List<HSDK> hsdks = new ArrayList<HSDK>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HoSoDangKyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		hoSoDangKyDAO = new HoSoDangKyDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = "";
		page = "/CONTENT/jsp/QuanLyHoSoDangKy.jsp";
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		request.getSession(false);
		int loaiGiay = Integer.parseInt(request.getParameter("key"));
		PrintWriter out = response.getWriter();
		String data;
		List<HSDK> DSHSDK;
		data = "{ \"hsdk\":[";
		try {
			if (loaiGiay == -1)
			{
				DSHSDK = hoSoDangKyDAO.getAllHSDKCoQuan(1);
			}
			else
			{
				DSHSDK = hoSoDangKyDAO.getHSDKLoaiGiayTo(1,loaiGiay);
			}
			for (int i = 0; i < DSHSDK.size(); i++) {
				String temp = "";
				if (i == DSHSDK.size() - 1) { //Trường hợp dòng cuối cùng sẽ không có dấu ","
					temp = "{"
							+"\"stt\":\"\"," // Ký tự trống để điền STT tự động
							+"\"id\":\""+DSHSDK.get(i).getHoSoDangKyId()+"\","
							+"\"ten\":\""+DSHSDK.get(i).getHoSoDangKyTen()+"\","
							+"\"ma\":\""+DSHSDK.get(i).getHoSoDangKyMa()+"\","
							+"\"ngay-dangky\":\""+DSHSDK.get(i).getNgayDangKy()+"\","
							+"\"ngay-hethan\":\""+DSHSDK.get(i).getNgayHetHan()+"\","
//							+"\"loai-giayto\":\""+DSHSDK.get(i).getLoaiGiayToID()+"\","
							+"\"loai-giayto\":\""+DSHSDK.get(i).getLoaiGiayToID()+"\"}";
//							+"\"tacvu\":\"<div>"
//								+"<a href=\\\""+DSHSDK.get(i).getHoSoDangKyId()+"\\\" class=\\\"btn btn-primary\\\">"
//									+"<i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt"
//								+"</a>"
//							+"</div>\"}";
				}
				else
				{
					temp = "{"
							+"\"stt\":\"\"," // Ký tự trống để điền STT tự động
							+"\"id\":\""+DSHSDK.get(i).getHoSoDangKyId()+"\","
							+"\"ten\":\""+DSHSDK.get(i).getHoSoDangKyTen()+"\","
							+"\"ma\":\""+DSHSDK.get(i).getHoSoDangKyMa()+"\","
							+"\"ngay-dangky\":\""+DSHSDK.get(i).getNgayDangKy()+"\","
							+"\"ngay-hethan\":\""+DSHSDK.get(i).getNgayHetHan()+"\","
//							+"\"loai-giayto\":\""+DSHSDK.get(i).getLoaiGiayToID()+"\","
							+"\"loai-giayto\":\""+DSHSDK.get(i).getLoaiGiayToID()+"\"},";
//							+"\"tacvu\":\"<div>"
//								+"<a href=\\\""+DSHSDK.get(i).getHoSoDangKyId()+"\\\" class=\\\"btn btn-primary\\\">"
//									+"<i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt"
//								+"</a>"
//							+"</div>\"},";
				}
				data += temp;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//Test
//		data = "{ \"hsdk\":["
//				+ "[\"\",\"First Name 1\",\"Last Name 1\",\"Address1 1\",\"Address2 1\",\"<div><a href=\\\"CheckGiayKhaiSinh.html\\\" class=\\\"btn btn-primary\\\"><i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt</a></div>\"],"
//				+ "[\"\",\"First Name 2\",\"Last Name 2\",\"Address1 2\",\"Address2 2\",\"<div><a href=\\\"CheckGiayKhaiSinh.html\\\" class=\\\"btn btn-primary\\\"><i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt</a></div>\"]"
//				+ "]}";

		data += "]}";
		out.println(data);
	}

}

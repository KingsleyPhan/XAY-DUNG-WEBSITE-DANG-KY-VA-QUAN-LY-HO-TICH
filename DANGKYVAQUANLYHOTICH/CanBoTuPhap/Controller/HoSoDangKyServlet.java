package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import Entities.HSDK;
import Models.HoSoDangKyModel;

/**
 * Servlet implementation class HoSoDangKyServlet
 */
@WebServlet(description = "Thao tác liên quan h? s? ??ng kí", urlPatterns = { "/HoSoDangKy" })
public class HoSoDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
//		int loaiGiay = Integer.parseInt(request.getParameter("ma"));
		PrintWriter out = response.getWriter();
		String data;
		List<HSDK> DSHSDK;
		data = "{ \"hsdk\":[";
		try {
//			if (loaiGiay == -1)
//			{
//				DSHSDK = new HoSoDangKyModel().getAllHSDKCoQuan(1);
//			}
//			else
//			{
//				DSHSDK = new HoSoDangKyModel().getHSDKLoaiGiayTo(1,loaiGiay);
//			}
			DSHSDK = new HoSoDangKyModel().getAllHSDKCoQuan(1);
			for (int i = 0; i < DSHSDK.size(); i++) {
				String temp = "";
				if (i == DSHSDK.size() - 1) { //Trường hợp dòng cuối cùng sẽ không có dấu ","
					temp = "["
							+"\"\"," // Ký tự trống để điền STT tự động
							+"\""+DSHSDK.get(i).getHoSoDangKyTen()+"\","
							+"\""+DSHSDK.get(i).getHoSoDangKyMa()+"\","
							+"\""+DSHSDK.get(i).getNgayDangKy()+"\","
							+"\""+DSHSDK.get(i).getNgayHetHan()+"\","
							+"\""+DSHSDK.get(i).getLoaiGiayToID()+"\","
							+"\"<div>"
								+"<a href=\\\""+DSHSDK.get(i).getHoSoDangKyId()+"\\\" class=\\\"btn btn-primary\\\">"
									+"<i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt"
								+"</a>"
							+"</div>\"]";
				}
				else
				{
					temp = "["
							+"\"\"," // Ký tự trống để điền STT tự động
							+"\""+DSHSDK.get(i).getHoSoDangKyTen()+"\","
							+"\""+DSHSDK.get(i).getHoSoDangKyMa()+"\","
							+"\""+DSHSDK.get(i).getNgayDangKy()+"\","
							+"\""+DSHSDK.get(i).getNgayHetHan()+"\","
							+"\""+DSHSDK.get(i).getLoaiGiayToID()+"\","
							+"\"<div>"
								+"<a href=\\\""+DSHSDK.get(i).getHoSoDangKyId()+"\\\" class=\\\"btn btn-primary\\\">"
									+"<i class=\\\"glyphicon glyphicon-pencil\\\"></i> Kiểm duyệt"
								+"</a>"
							+"</div>\"],";
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

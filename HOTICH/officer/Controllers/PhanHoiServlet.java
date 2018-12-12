package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Consts;
import DAO.HoTichDAO;
import Service.HoTichService;

@WebServlet({"/PhanHoi","/PhanHoi/*"})
public class PhanHoiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HoTichService hoTichService;
	
    public PhanHoiServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoTichService = new HoTichService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("message") != null && session.getAttribute("content") != null) {
			
			String message = session.getAttribute("message").toString();
			
			String content = session.getAttribute("content").toString();
			
			String ma = session.getAttribute("HSDK_MA").toString();
			
			String ten = session.getAttribute("HSDK_TEN").toString();
			
			String nyc_hoVaTen = session.getAttribute("NYC_HOVATEN_SUBMIT").toString();
			
			String email = session.getAttribute("email").toString();
			
			String sdt = session.getAttribute("sdt").toString();
			
			float lephi = Float.parseFloat(session.getAttribute("lephi").toString());
			
			StringBuilder noiDung = new StringBuilder();
			
			noiDung.append("Kính gửi : Ông/Bà "+nyc_hoVaTen+"\n");
			
			noiDung.append("Ông/Bà đã gửi hồ sơ đăng kí với nội dung : "+ten+" | Mã hồ sơ : "+ma+"\n");
			
			switch (message) {
			case "Success":
				noiDung.append("Hồ sơ của Ông/Bà đã được xử lý xong, ông bà vui lòng đến ..... để nhận giấy hộ tịch. Với mức phí : "+lephi+" VNĐ\n");
				break;
			case "Error":
				noiDung.append("Chúng tôi xin thông báo hồ sơ của ông/bà đã gặp lỗi : \n"+content+"\n");
				break;
			case "HaveMessage":
				noiDung.append("Chúng tôi xin thông báo hồ sơ của ông/bà đã gặp lỗi sau : \n"+content+"\n");
				noiDung.append("Vui lòng điền lại hồ sơ với mã hồ sơ : "+ma+". \n");
				break;
			default:
				break;
			}
			noiDung.append("Xin cảm ơn đã sử dụng dịch vụ.");
			
			request.setAttribute("email", email);
			request.setAttribute("sdt", sdt);
			request.setAttribute("message", message);
			request.setAttribute("noiDung", noiDung.toString());
			
			String page = "";
			page = "/CONTENT/jsp/officer/PhanHoi_New.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
	        dispatcher.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/QuanLyDangKy");
		}
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String message = request.getParameter("message");
		
		String email = request.getParameter("NYC_EMAIL") ;
		
		String sdt = request.getParameter("NYC_SDT");
		
		String noiDung = request.getParameter("NOIDUNG");
		
		int ngXuLy = Consts.NGUOIDUNG_ID;
		
		int idHSDK = Integer.parseInt(session.getAttribute("HSDK_ID").toString());
		
		int idLoai = Integer.parseInt(session.getAttribute("HSDK_LOAI").toString());
		
		int ngKy = Consts.NGUOIDUNG_ID;
		
		int coQuan = Consts.COQUAN_ID;

		String feedback = "";
		try {
			switch (message) {
			case "Success":
					hoTichService.XacNhanHoTich(idHSDK, idLoai, ngXuLy, ngKy, email, sdt, noiDung, coQuan);
				break;
			case "Error":
			case "HaveMessage":
			default:
				hoTichService.TuChoiHoTich(idHSDK, ngXuLy, email, sdt, noiDung, coQuan);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			feedback = e.toString();
		}
		
		Consts.removeSession(session);
		
		session.setAttribute("feedback", feedback);
		response.sendRedirect(request.getContextPath()+"/QuanLyDangKy");
	}

}

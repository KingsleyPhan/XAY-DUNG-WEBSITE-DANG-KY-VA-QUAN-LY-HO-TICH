package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NopToKhaiKhaiSinh")
public class DangKyKhaiSinhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public DangKyKhaiSinhServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String NYC_HoVaTen = request.getParameter("");
		 String NYC_CMND= request.getParameter("");
		 String NYC_NoiCap= request.getParameter("");
		 String NYC_NgayCap= request.getParameter("");
		 String NYC_QuanHe= request.getParameter("");
		 String NYC_QuocTich= request.getParameter("");
		 String NYC_TP= request.getParameter("");
		 String NYC_Quan= request.getParameter("");
		 String NYC_Huyen= request.getParameter("");
		 String NYC_DiaChi= request.getParameter("");
			
		 String KS_HoVaTen= request.getParameter("");
		 String KS_GioiTinh= request.getParameter("");
		 String KS_NgaySinh= request.getParameter("");
		 String KS_DanToc= request.getParameter("");
		 String KS_QuocTich= request.getParameter("");
		 String KS_TP= request.getParameter("");
		 String KS_Quan= request.getParameter("");
		 String KS_Huyen= request.getParameter("");
		 String KS_DiaChi= request.getParameter("");
		 String KS_CoSoSinhSan= request.getParameter("");
		 String KS_QuocTich_CSSS= request.getParameter("");
		 String KS_TP_CSSS= request.getParameter("");
		 String KS_Quan_CSSS= request.getParameter("");
		 String KS_Huyen_CSSS= request.getParameter("");
		 String KS_DiaChi_CSSS= request.getParameter("");
			
		 String ME_HoVaTen= request.getParameter("");
		 String ME_NgaySinh= request.getParameter("");
		 String ME_CMND= request.getParameter("");
		 String ME_NoiCap= request.getParameter("");
		 String ME_NgayCap= request.getParameter("");
		 String ME_QuanHe= request.getParameter("");
		 String ME_QuocTich= request.getParameter("");
		 String ME_TP= request.getParameter("");
		 String ME_Quan= request.getParameter("");
		 String ME_Huyen= request.getParameter("");
		 String ME_DiaChi= request.getParameter("");
			
		 String CHA_HoVaTen= request.getParameter("");
		 String CHA_NgaySinh= request.getParameter("");
		 String CHA_CMND= request.getParameter("");
		 String CHA_NoiCap= request.getParameter("");
		 String CHA_NgayCap= request.getParameter("");
		 String CHA_QuanHe= request.getParameter("");
		 String CHA_QuocTich= request.getParameter("");
		 String CHA_TP= request.getParameter("");
		 String CHA_Quan= request.getParameter("");
		 String CHA_Huyen= request.getParameter("");
		 String CHA_DiaChi= request.getParameter("");
	}

}

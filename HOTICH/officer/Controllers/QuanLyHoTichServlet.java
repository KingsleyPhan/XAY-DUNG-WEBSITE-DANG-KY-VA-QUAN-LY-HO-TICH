package Controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.Consts;
import DAO.HoTichDAO;
import Entities.HoTich;

public class QuanLyHoTichServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HoTichDAO hoTichDAO;
	
    public QuanLyHoTichServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		hoTichDAO = new HoTichDAO(Consts.ServerUrl, Consts.UserName, Consts.Pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "QuanLyHoTich":
			String page = "";
			page = "/CONTENT/jsp/officer/QuanLyHoTich_New.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
	        dispatcher.forward(request, response);
			break;
		case "getImage":
			GetImage(request,response);
			break;
		default:
			break;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getRequestURI();
		String[] words=action.split("/");
		
		switch (words[words.length-1]) {
		case "getAll":
			GetAll(request, response);
			break;
		default:
			break;
		}
	}

	private void GetAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int loaiGiay = Integer.parseInt(request.getParameter("key"));
		
		PrintWriter out = response.getWriter();
		
		Gson gsonObj = new Gson();
		
		List<Map<Object,Object>> listHoTich = new ArrayList<Map<Object,Object>>();
		
		try {
			if (loaiGiay == -1)
			{
				listHoTich= hoTichDAO.getAllHoTich(1);
			}
			else
			{
				//Chua xu ly
				listHoTich= hoTichDAO.getAllHoTich(1);
			}
			
			String dataPoints = gsonObj.toJson(listHoTich);
			
			out.print(dataPoints);
			
		}  catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
	private void GetImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("image/png;charset=UTF-8");
		ServletOutputStream out = response.getOutputStream();
//		BufferedImage bufferedImage = ImageIO.read(getClass().getResource("/CONTENT/image/126503.png"));
		BufferedImage bufferedImage = ImageIO.read(new File("D:\\\\0.DATA\\\\18_19\\\\HK1\\\\Lap_Trinh_Web\\\\DoAnLTW\\\\XAY-DUNG-WEBSITE-DANG-KY-VA-QUAN-LY-HO-TICH\\\\HOTICH\\\\WebContent\\\\CONTENT\\\\image\\\\giayKhaiSinh.png"));
		System.out.println(bufferedImage);
		
		ImageIO.write(bufferedImage, "PNG", out);
	}
}

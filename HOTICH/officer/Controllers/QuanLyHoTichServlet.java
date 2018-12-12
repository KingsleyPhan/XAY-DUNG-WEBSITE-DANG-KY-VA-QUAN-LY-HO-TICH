package Controllers;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Consts;
import DAO.HoTichDAO;
import Entities.HoTichKhaiSinh;
import Entities.KhaiSinh.KhaiSinh;

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
		
		String ma = request.getParameter("ma");
		String soQuyen = request.getParameter("soQuyen");
		
		ServletOutputStream out = response.getOutputStream();
//		BufferedImage bufferedImage = ImageIO.read(getClass().getResource("/CONTENT/image/126503.png"));
		BufferedImage bufferedImage = ImageIO.read(new File(Consts.urlImage+"giayKhaiSinh.png"));
		Graphics g = bufferedImage.getGraphics();  
		g.setColor(Color.black);
		g.setFont(new Font("TimesRoman", Font.PLAIN, 50));
		HoTichKhaiSinh khaisinh = hoTichDAO.getGiayKhaiSinh(ma, soQuyen);
		g.drawString(khaisinh.getMa(), 2010, 330);
		g.drawString(khaisinh.getSoQuyen(), 2010, 400);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getHoVaTen(), 770, 870);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getNgaySinhString(), 790, 1045);
		g.drawString(Consts.writeDate(khaisinh.getDoiTuongKhaiSinh().getNgaySinh()), 1580, 1045);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getGioiTinh()?("Nam"):("Nữ"), 520, 1223);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getDanToc(), 980, 1223);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getQuocTich(), 1700, 1223);
		g.drawString(khaisinh.getNoiSinh().getTenCoSoYTe(), 600, 1310);
		g.drawString(khaisinh.getNoiSinh().getDiaChi().writeDiaChi(), 300, 1400);
		g.drawString(khaisinh.getDoiTuongKhaiSinh().getQueQuan(), 600, 1490);
		g.drawString(khaisinh.getMe().getHoVaTen(), 960, 1755);
		g.drawString((khaisinh.getMe().getNgaySinh().getYear() + 1900)+"", 545, 1850);
		g.drawString(khaisinh.getMe().getDanToc(), 1020, 1850);
		g.drawString(khaisinh.getMe().getQuocTich(), 1735, 1850);
		g.drawString(khaisinh.getMe().getDiaChi().getSoDuong() + " , " + khaisinh.getMe().getDiaChi().getPhuong(), 545, 1940);
		g.drawString(khaisinh.getMe().getDiaChi().getQuan() + " , " + khaisinh.getMe().getDiaChi().getThanhPho(), 545, 2025);
		g.drawString(khaisinh.getCha().getHoVaTen(), 960, 2120);
		g.drawString((khaisinh.getCha().getNgaySinh().getYear() + 1900)+"", 545, 2205);
		g.drawString(khaisinh.getCha().getDanToc(), 1020, 2205);
		g.drawString(khaisinh.getCha().getQuocTich(), 1735, 2205);
		g.drawString(khaisinh.getCha().getDiaChi().getSoDuong() + " , " + khaisinh.getCha().getDiaChi().getPhuong(), 545, 2295);
		g.drawString(khaisinh.getCha().getDiaChi().getQuan() + " , " + khaisinh.getCha().getDiaChi().getThanhPho(), 545, 2380);
		g.drawString(khaisinh.getNgYeuCau_Ten(), 1130, 2475);
		g.drawString(khaisinh.getCoQuan(), 810, 2665);
		g.drawString(khaisinh.getNgayKySring(), 925, 2832);
		g.drawString(khaisinh.getNgKy(), 1530, 3280);
		g.drawString("Chứng minh nhân dân : Sô            , Ngày cấp :            , Nơi cấp :                              ", 660, 2562);
//		g.drawString(str, x, y);
		System.out.println(bufferedImage);
		
		ImageIO.write(Consts.resize(bufferedImage, 990, 700), "PNG", out);
	}
}

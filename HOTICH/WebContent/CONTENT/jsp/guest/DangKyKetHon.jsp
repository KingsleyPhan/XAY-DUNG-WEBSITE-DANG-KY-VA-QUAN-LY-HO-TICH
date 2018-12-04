<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.DriverManager"
	import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Models.CapThanhPhoService" %>
<%@page import="Models.DanTocService" %>
<%@page import="DAO.Consts"%>
<!DOCTYPE html>
<html>
<head>
 <title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--content-->
    <link rel="stylesheet" type="text/css" href="CONTENT/stylesguest//HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/giayKhaiSinh.css">
    <!--Library datetimepicker-->
    <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
    <!-- Include jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
    <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

    <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

    <!--Font Awesome (added because you use icons in your prepend/append)-->
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!--header and footer-->
	<link rel="stylesheet" href="CONTENT/styles/guest/kethon.css">
</head>
<body>
   <!-- Start Header-->
    <header id="id-header" class="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo-text">
                        <p id="id-logo-text">HOTICH.NET</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- End Header-->

    <!--Start Content-->
    <div id="id-content" class="content-switch">
        <div class="container">
            <div class="row">
                <div class="header_location">
                      <p id="bannerCoQuan" class="location"><%=Consts.LocationCap1%></p>
					<p id="CoQuanCap2" class="locationCap2"><%=Consts.LocationCap2%></p>
                </div>
            </div>


            <div class="row" style="margin-top:20px">
              <form action="NopKetHon.php" method="Post" onsubmit="return validateSubmitKetHon()">
                <!-- Setup 2000px for test amnition-->
                <div class="paper">
                    <div class="title">
                        <p>TỜ KHAI ĐĂNG KÝ GIẤY KẾT HÔN</p>
                    </div>s
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part ">
                                    <div class="col-12 col-sm-6 col-md-6">
										<p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI NAM</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
										<input type="checkbox" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" >
                                    	<label style="margin: auto">Là người yêu cầu</label>
									</div>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input name="CHONG_HOVATEN" type="text" class="form-control" id="nam_hovaten" name = "nam_hovaten" onblur="validateHoTen(nam_hovaten)" >
												<p class="error" id="error_nam_hovaten"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày sinh</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input name="CHONG_NGAYSINH" class="form-control" id="nam_ngaysinh" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" onBlur="validateNgaySinh(nam_ngaysinh)" onChange="validateNgaySinh(nam_ngaysinh)"/>
															<!-- 	<input type="hidden" id="input_nam_ngaysinh" name="nam_ngaysinh"/> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
												<p class="error" id="error_nam_ngaysinh"></p>
                                            </div>
										</div>
									</div>
									
									<div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input name="CHONG_CMND" type="text" class="form-control" id="nam_CMND" name="nam_CMND" onblur="validateCMND(nam_CMND)">
												<p class="error" id="error_nam_CMND"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input name="CHONG_NOICAP" type="text" class="form-control" id="nam_CMND_noicap" name="nam_CMND_noicap" onBlur="validateRequired(nam_CMND_noicap)">
												<p class="error" id="error_nam_CMND_noicap"></p>
                                            </div>
                                        </div>
										<!--Ngày cấp CMND -->
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input name="CHONG_NGAYCAP" class="form-control" id="nam_CMND_ngaycap" name="date" placeholder="Ngày/Tháng/Năm" type="text" onBlur="validateNgayCap(nam_CMND_ngaycap)" onChange="validateNgayCap(nam_CMND_ngaycap)"/>
															<!-- 	<input type="hidden" id="input_nam_CMND_ngaycap" name="nam_CMND_ngaycap"/>-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
												<p class="error" id="error_nam_CMND_ngaycap"></p>
                                            </div>
                                        </div>
									</div>
									<div class="row">
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                            		 <%
														DanTocService DanToc = new DanTocService();
                                                		 ResultSet Result;
													%>
                                                <label for="">Dân tộc </label>
                                                <select name="CHONG_DANTOC" class="form-control" id="nam_id_dantoc" name="nam_id_dantoc" onBlur="validateRequired(nam_id_dantoc)">
													   <%
													   Result= DanToc.ShowDanToc();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
                                                        <option value="<%=Result.getString(1)%>">
                                                            <%=Result.getString(2)%>
                                                        </option>
                                                        <%
															}
															}
														%>
                                                </select>
												<p class="error" id="error_nam_id_dantoc"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select name="CHONG_QUOCTICH" class="form-control" id="nam_id_quoctich" name="nam_id_quoctich" onBlur="validateRequired(nam_id_quoctich)">
													<option>Việt Nam</option>
                                                </select>
												<p class="error" id="error_nam_id_quoctich"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số lần kết hôn</label>
                                                <input name="CHONG_SOLANKETHON" type="number" class="form-control" id="nam_solan" name="nam_solan" onBlur="validateNumber(nam_solan)">
												<p class="error" id="error_nam_solan"></p>
                                            </div>
                                        </div>
									</div>
									<div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="" style="font-size: 15px;">Cư trú</label>
                                            </div>
                                        </div>
									</div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                                    <%
														CapThanhPhoService ThanhPho = new CapThanhPhoService();
														
													%>
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select onmousedown="chgQuan(nam_id_thanhpho,nam_id_quan)"
                                                        onchange="chgQuan(nam_id_thanhpho,nam_id_quan)" name="CHONG_THANHPHO" class="form-control" id="nam_id_thanhpho" name="nam_id_thanhpho" onBlur="validateRequired(nam_id_thanhpho)">
													<%
													 Result = ThanhPho.ShowThanhPho();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
                                                        <option value="<%=Result.getString(1)%>">
                                                            <%=Result.getString(2)%>
                                                        </option>
                                                        <%
															}
															}
														%>
                                                </select>
												<p class="error" id="error_nam_id_thanhpho"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select onload="chgPhuong(nam_id_quan,nam_id_phuong)"
                                                            onmousedown="chgPhuong(nam_id_quan,nam_id_phuong)"
                                                            onchange="chgPhuong(nam_id_quan,nam_id_phuong)" name="CHONG_QUAN" class="form-control" id="nam_id_quan" name="nam_id_quan" onBlur="validateRequired(nam_id_quan)">
													
                                                </select>
												<p class="error" id="error_nam_id_quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select name="CHONG_PHUONG" class="form-control" id="nam_id_phuong" name="nam_id_phuong" onBlur="validateRequired(nam_id_phuong)">
													
                                                </select>
												<p class="error" id="error_nam_id_phuong"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input name="CHONG_DIACHI" type="text" class="form-control" id="nam_diachi" name="nam_diachi" onBlur="validateRequired(nam_diachi)">
												<p class="error" id="error_nam_diachi"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Phần điền của nữ -->
					<div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="row title-part">
                                    <div class="col-12 col-sm-6 col-md-6">
										<p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI NỮ</p>
									</div>
									<div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
										<input type="checkbox" class="form-check-input" id="nu_check_yeucau" style="bottom: 0px;" >
                                    	<label style="margin: auto">Là người yêu cầu</label>
									</div>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input name="VO_HOVATEN" type="text" class="form-control" id="nu_hovaten" name = "nu_hovaten" onblur="validateHoTen(nu_hovaten)" >
												<p class="error" id="error_nu_hovaten"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày sinh</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input name="VO_NGAYSINH" class="form-control" id="nu_ngaysinh" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" onBlur="validateNgaySinh(nu_ngaysinh)" onChange="validateNgaySinh(nu_ngaysinh)"/>
															<!-- <input type="hidden" id="input_nu_ngaysinh" name="nu_ngaysinh"/>  -->	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
												<p class="error" id="error_nu_ngaysinh"></p>
                                            </div>
										</div>
									</div>
									
									<div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input name="VO_CMND" type="text" class="form-control" id="nu_CMND" name="nu_CMND" onblur="validateCMND(nu_CMND)">
												<p class="error" id="error_nu_CMND"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input name="VO_NOICAP" type="text" class="form-control" id="nu_CMND_noicap" name="nu_CMND_noicap" onBlur="validateRequired(nu_CMND_noicap)">
												<p class="error" id="error_nu_CMND_noicap"></p>
                                            </div>
                                        </div>
										<!--Ngày cấp CMND -->
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input name="VO_NGAYCAP" class="form-control" id="nu_CMND_ngaycap" name="date" placeholder="Ngày/Tháng/Năm" type="text" onBlur="validateNgayCap(nu_CMND_ngaycap)" onChange="validateNgayCap(nu_CMND_ngaycap)"/>
															<!-- <input type="hidden" id="input_nu_CMND_ngaycap" name="nu_CMND_ngaycap"/> -->	
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
												<p class="error" id="error_nu_CMND_ngaycap"></p>
                                            </div>
                                        </div>
									</div>
									<div class="row">
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Dân tộc </label>
                                                <select name="VO_DANTOC" class="form-control" id="nu_id_dantoc" name="nu_id_dantoc" onBlur="validateRequired(nu_id_dantoc)">
													   <%
													   Result= DanToc.ShowDanToc();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
                                                        <option value="<%=Result.getString(1)%>">
                                                            <%=Result.getString(2)%>
                                                        </option>
                                                        <%
															}
															}
														%>
                                                </select>
												<p class="error" id="error_nu_id_dantoc"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select name="VO_QUOCTICH" class="form-control" id="nu_id_quoctich" name="nu_id_quoctich" onBlur="validateRequired(nu_id_quoctich)">
														<option>Việt Nam</option>
                                                </select>
												<p class="error" id="error_nu_id_quoctich"></p>
                                            </div>
                                        </div>
										<div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số lần kết hôn</label>
                                                <input name="VO_SOLANKETHON" type="number" class="form-control" id="nu_solan" name="nu_solan" onBlur="validateNumber(nu_solan)">
												<p class="error" id="error_nu_solan"></p>
                                            </div>
                                        </div>
									</div>
									<div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="" style="font-size: 15px;">Cư trú</label>
                                            </div>
                                        </div>
									</div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select onmousedown="chgQuan(nu_id_thanhpho,nu_id_quan)"
                                                        onchange="chgQuan(nu_id_thanhpho,nu_id_quan)" name="VO_THANHPHO" class="form-control" id="nu_id_thanhpho" name="nu_id_thanhpho" onBlur="validateRequired(nu_id_thanhpho)">
														<%
													 Result = ThanhPho.ShowThanhPho();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
                                                        <option value="<%=Result.getString(1)%>">
                                                            <%=Result.getString(2)%>
                                                        </option>
                                                        <%
															}
															}
														%>
                                                </select>
												<p class="error" id="error_nu_id_thanhpho"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select onload="chgPhuong(nu_id_quan,nu_id_phuong)"
                                                            onmousedown="chgPhuong(nu_id_quan,nu_id_phuong)"
                                                            onchange="chgPhuong(nu_id_quan,nu_id_phuong)" name="VO_QUAN" class="form-control" id="nu_id_quan" name="nu_id_quan" onBlur="validateRequired(nu_id_quan)">
													
                                                </select>
												<p class="error" id="error_nu_id_quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select name="VO_PHUONG" class="form-control" id="nu_id_phuong" name="nu_id_phuong" onBlur="validateRequired(nu_id_phuong)">
													
                                                </select>
												<p class="error" id="error_nu_id_phuong"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input name="VO_DIACHI" type="text" class="form-control" id="nu_diachi" name="nu_diachi" onBlur="validateRequired(nu_diachi)">
												<p class="error" id="error_nu_diachi"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <div class="row">
                        <div class="container container-paper">
                            <div class="content-checkbox">
                                <div class="form-check">
                                    <inpu name="CHECK_AGREE" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label">Tôi cam đoan đề nghị đăng ký trên đây là đúng sự
                                        thật, được sự thỏa thuận và nhất trí của các bên liên quan theo quy định của
                                        pháp luật. </label>
                                    <label>Tôi hoàn toàn chịu trách nhiệm trước pháp luật về nội dung cam đoan của mình
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <p>HỒ SƠ ĐÍNH KÈM</p>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-upload">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Thành phần hồ sơ</th>
                                                                <th scope="col">Tập tin</th>
                                                                <th scope="col">Tải lên</th>
                                                                <th scope="col">Ghi chú</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Giấy chứng nhận độc thân người Nam</td>
                                                                <td></td>
                                                                <td><button class="btn"><i class="fa fa-upload"></i>Tải
                                                                        lên</button></td>
                                                                <td><textarea style="width: 100%">
                                                                </textarea></td>
                                                            </tr>
															<tr>
                                                                <td>Giấy chứng nhận độc thân người Nữ</td>
                                                                <td></td>
                                                                <td><button class="btn"><i class="fa fa-upload"></i>Tải
                                                                        lên</button></td>
                                                                <td><textarea style="width: 100%">
                                                                </textarea></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---End paper-->
                <div class="row">
                    <div class="control-navigation">
                        <button class="btn  btn-cancel">Hủy bỏ</button>
                        <button type="submit" class="btn btn-continue" onClick="return validateSubmitKetHon()">Tiếp tục</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!--Start Content-->

    <!-- Start Footer-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo-text">
                        <p>HOTICH.NET</p>
                    </div>
                    <div class="subrice">
                        <p>Hệ thống đăng ký và quản lý hộ tịch trực tuyến</p>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="footer-imfor">
                        <p>Copyright (C) 2018-2019 HOTICH.NET</p>
                        <p>Phát triển bởi Phan Văn Phước Thịnh - Huỳnh Lê Hữu Hưng</p>
                        <p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer-->
  
    <script src="CONTENT/js/guest/Header.js"></script>
    <script src="CONTENT/js/guest/valiedateForm.js"></script>
    <script src="CONTENT/js/guest/DangKyKhaiSinhAjax.js"></script>
</body>
</html>
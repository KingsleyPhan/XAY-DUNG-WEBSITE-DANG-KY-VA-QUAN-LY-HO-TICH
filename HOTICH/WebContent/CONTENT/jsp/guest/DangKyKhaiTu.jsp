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
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/HAF.css">
     <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/giayKhaiSinh.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/giayChungTu.css">
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


            <div class="row">
             <form action="NopKhaiTu.php" method="Post" onsubmit="return validateSubmitChungTu()" >
                <!-- Setup 2000px for test amnition-->
                <div class="paper">
                    <div class="title">
                        <p>TỜ KHAI ĐĂNG KÝ CHỨNG TỬ</p>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <div class="col-12 col-sm-6 col-md-6">
                                        <p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI YÊU CẦU</p>
                                    </div>
                                   
                                </div>
                                <div class="content collapse in">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>

														<input type="text" name="NYC_HOVATEN" class="form-control" id="NYC_HOVATEN" value="" onblur="validateHoTen(NYC_HOVATEN)">
												
                                                <p class="error" id="error_NYC_HOVATEN"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input type="text" name="NYC_CMND" class="form-control" id="CMNDYeuCau" onblur="validateCMND(CMNDYeuCau)">
                                                <p class="error" id="error_CMNDYeuCau"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input name="NYC_NOICAP" type="text" class="form-control" id="NoiCapCMNDYeuCau" onblur="validateRequired(NoiCapCMNDYeuCau)">
                                                <p class="error" id="error_NoiCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
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
                                                                <input class="form-control" id="NgayCapCMNDYeuCau" 
                                                                    onblur="validateNgayCap(NgayCapCMNDYeuCau)" name="NYC_NGAYCAP" onchange="validateNgayCap(NgayCapCMNDYeuCau)"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_NgayCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ với người được khai sinh</label>
                                                <select name="NYC_QUANHE" class="form-control" id="NguoiYeuCau_QuanHe" onblur="quanHeKhac()"  onchange="quanHeKhac()">                                                 
                                                     <option  value="0">Con</option>
                                                     <option  value="1">Cháu</option>
                                                        <option value="2">Không phải</option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuanHe"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ khác </label>
                                                <input name="NYC_QUANHEKHAC" disabled type="text" class="form-control" id="NguoiYeuCau_QuanHeKhac"
                                                    onblur="validateRequired(NguoiYeuCau_QuanHeKhac)">
                                                <p class="error" id="error_NguoiYeuCau_QuanHeKhac"></p>
                                            </div>
                                        </div>


                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select name="NYC_QUOCTICH" class="form-control" id="NguoiYeuCau_QuocTich" onblur="validateRequired(NguoiYeuCau_QuocTich)">
                                                    <option>Việt Nam</option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                         <%
														CapThanhPhoService ThanhPho = new CapThanhPhoService();
                                                		 ResultSet Result;
													%>
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select  onmousedown="chgQuan(NguoiYeuCau_Tinh,NguoiYeuCau_Huyen)"
                                                        onchange="chgQuan(NguoiYeuCau_Tinh,NguoiYeuCau_Huyen)"  name="ComboTHANHPHO" class="form-control" id="NguoiYeuCau_Tinh" onblur="validateRequired(NguoiYeuCau_Tinh)">
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
                                                <p class="error" id="error_NguoiYeuCau_Tinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select  onload="chgPhuong(NguoiYeuCau_Huyen,NguoiYeuCau_Phuong)"
                                                            onmousedown="chgPhuong(NguoiYeuCau_Huyen,NguoiYeuCau_Phuong)"
                                                            onchange="chgPhuong(NguoiYeuCau_Huyen,NguoiYeuCau_Phuong)" name="NYC_QUAN" class="form-control" id="NguoiYeuCau_Huyen" onblur="validateRequired(NguoiYeuCau_Huyen)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Huyen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select name="NYC_PHUONG" class="form-control" id="NguoiYeuCau_Phuong" onblur="validateRequired(NguoiYeuCau_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Phuong"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input name="NYC_DIACHI" type="text" class="form-control" id="NguoiYeuCau_DiaChi" onblur="validateRequired(NguoiYeuCau_DiaChi)">
                                                <p class="error" id="error_NguoiYeuCau_DiaChi"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <p>THÔNG TIN NGƯỜI QUA ĐỜI</p>
                                </div>
                                <div class="content ">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input name="NQD_HOVATEN" type="text" class="form-control" id="QuaDoi_HoVaTen" onblur="validateHoTen(QuaDoi_HoVaTen)">
                                                <p class="error" id="error_QuaDoi_HoVaTen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Giới tính</label><br>
                                                <div class="control-sex">
                                                    <input type="radio" name="gender" value="male" id="male" onblur="validateRadio(male, female)">
                                                    Nam
                                                    <input style="margin-left: 20px" type="radio" name="gender" id="female"
                                                        onblur="validateRadio(male, female)" value="female">Nữ
                                                </div>
                                                <p class="error" id="error_male"></p>
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
                                                                    <input name="NQD_NGAYSINH" class="form-control" id="QuaDoi_ngaySinh"
                                                                        onblur="validateNgayCap(QuaDoi_ngaySinh)" name="date"
                                                                        placeholder="Ngày/Tháng/Năm" type="text" />
                                                               <!-- input type="hidden" id="input_QuaDoi_ngaySinh" name="nam_ngaysinh"/> --->

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <p class="error" id="error_QuaDoi_ngaySinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input name="NQD_CMND" type="text" class="form-control" id="QuaDoi_CMND" onblur="validateCMND(QuaDoi_CMND)">
                                            </div>
                                            <p class="error" id="error_QuaDoi_CMND"></p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input name="NQD_NOICAP" type="text" class="form-control" id="QuaDoi_NoiCap" onblur="validateRequired(QuaDoi_NoiCap)">
                                                <p class="error" id="error_QuaDoi_NoiCap"></p>
                                            </div>
                                        </div>
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
                                                                    <input name="NQD_NGAYCAP" class="form-control" id="QuaDoi_NgayCapBaoTu"
                                                                        onblur="validateNgayCap(QuaDoi_NgayCapBaoTu)" name="date"
                                                                        placeholder="Ngày/Tháng/Năm" type="text" />
    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <p class="error" id="error_QuaDoi_NgayCapBaoTu"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                         <%
														DanTocService DanToc = new DanTocService();
                                                		
													%>
                                            <div class="form-group">
                                                <label for="">Dân tộc</label>
                                                <select name="NQD_DANTOC" class="form-control" id="QuaDoi_danToc" onblur="validateRequired(QuaDoi_danToc)">
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
                                                <p class="error" id="error_QuaDoi_danToc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-8">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select name="NQD_QUOCTICH" class="form-control" id="QuaDoi_quocTich" onblur="validateRequired(QuaDoi_quocTich)">
                                                    <option>Việt Nam</option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_quocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select onmousedown="chgQuan(QuaDoi_ThanhPho,QuaDoi_Quan)"
                                                        onchange="chgQuan(QuaDoi_ThanhPho,QuaDoi_Quan)"  name="NQQ_THANHPHO" class="form-control" id="QuaDoi_ThanhPho" onblur="validateRequired(QuaDoi_ThanhPho)">
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
                                                <p class="error" id="error_QuaDoi_ThanhPho"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select onload="chgPhuong(QuaDoi_Quan,QuaDoi_Phuong)"
                                                            onmousedown="chgPhuong(QuaDoi_Quan,QuaDoi_Phuong)"
                                                            onchange="chgPhuong(QuaDoi_Quan,QuaDoi_Phuong)" name="NQD_QUAN" class="form-control" id="QuaDoi_Quan" onblur="validateRequired(QuaDoi_Quan)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_Quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select name="NQD_PHUONG" class="form-control" id="QuaDoi_Phuong" onblur="validateRequired(QuaDoi_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_Phuong"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input name="NQD_DIACHICHITIET" type="text" class="form-control" id="QuaDoi_DiaChi" onblur="validateRequired(QuaDoi_DiaChi)">
                                                <p class="error" id="error_QuaDoi_DiaChi"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="">Nguyên nhân qua đời</label>
                                                <input name="NQD_NGUYENNHAN" type="text" class="form-control" id="QuaDoi_NguyenNhan" onblur="validateRequired(QuaDoi_NguyenNhan)">
                                                <p class="error" id="error_QuaDoi_NguyenNhan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label for="">Quốc gia nơi mất</label>
                                                <select name="NQD_QUOCGIA_QD" class="form-control" id="QuaDoi_QuocGiaQuaDoi" onblur="validateRequired(QuaDoi_QuocGiaQuaDoi)">
                                                    <option>Việt Nam</option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_QuocGiaQuaDoi"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP nơi mất</label>
                                                <select onmousedown="chgQuan(QuaDoi_TPQuaDoi,QuaDoi_QuanQuaDoi)"
                                                        onchange="chgQuan(QuaDoi_TPQuaDoi,QuaDoi_QuanQuaDoi)" name="NQD_THANGPHO_QD" class="form-control" id="QuaDoi_TPQuaDoi" onblur="validateRequired(QuaDoi_TPQuaDoi)">
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
                                                <p class="error" id="error_QuaDoi_TPQuaDoi"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện nơi mất</label>
                                                <select onload="chgPhuong(QuaDoi_QuanQuaDoi,QuaDoi_PhuongQuaDoi)"
                                                            onmousedown="chgPhuong(QuaDoi_QuanQuaDoi,QuaDoi_PhuongQuaDoi)"
                                                            onchange="chgPhuong(QuaDoi_QuanQuaDoi,QuaDoi_PhuongQuaDoi)" name="NQD_QUAN_QD" class="form-control" id="QuaDoi_QuanQuaDoi" onblur="validateRequired(QuaDoi_QuanQuaDoi)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_QuanQuaDoi"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường nơi mất</label>
                                                <select name="NQD_PHUONG_MAT" class="form-control" id="QuaDoi_PhuongQuaDoi" onblur="validateRequired(QuaDoi_PhuongQuaDoi)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_PhuongQuaDoi"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết nơi mất</label>
                                                <input name="NQD_DIACHI_MAT" type="text" class="form-control" id="QuaDoi_DiaChiQuaDoi" onblur="validateRequired(QuaDoi_DiaChiQuaDoi)">
                                            </div>
                                            <p class="error" id="error_QuaDoi_DiaChiQuaDoi"></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày qua đời</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="input-group">
                                                                    <div class="input-group-addon">
                                                                        <i class="fa fa-calendar">
                                                                        </i>
                                                                    </div>
                                                                    <input name="NQD_NGAYQUADOI" class="form-control" id="QuaDoi_NgayQuaDoi"
                                                                        onblur="validateNgayCap(QuaDoi_NgayQuaDoi)" name="date"
                                                                        placeholder="Ngày/Tháng/Năm" type="text" />
    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <p class="error" id="error_QuaDoi_NgayQuaDoi"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Loại giấy tờ báo tử</label>
                                                <select name="NQD_LOAIGIAYBAOTU" class="form-control" id="QuaDoi_LoaiBaoTu" onblur="validateRequired(QuaDoi_LoaiBaoTu)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_QuaDoi_LoaiBaoTu"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-2">
                                            <div class="form-group" style="margin:auto;">
                                                <label for="">Thời gian mất (Mấy giờ)</label>
                                                
                                                <input name="NQD_ThoiGianMat" type="time" class="form-control" id="NQD_ThoiGianMat" onblur="validateRequired(NQD_ThoiGianMat)">
                                            </div>
                                            <p class="error" id="error_NQD_ThoiGianMat"></p>
                                                
                                            
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
                                    <input name="CHECK_AGREE" type="checkbox" class="form-check-input" id="exampleCheck1">
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
                                                                <td>Giấy báo tử</td>
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
                        <button type="" class="btn  btn-continue" onClick="return validateSubmitChungTu()">Tiếp
                            tục</button>
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
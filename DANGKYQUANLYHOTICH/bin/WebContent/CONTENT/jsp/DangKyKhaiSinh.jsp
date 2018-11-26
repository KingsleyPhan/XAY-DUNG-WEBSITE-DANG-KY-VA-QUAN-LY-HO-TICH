<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.DriverManager"
	import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Models.CapThanhPhoService" %>
<%@page import="Models.DanTocService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="CONTENT/styles/giayKhaiSinh.css">
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
                        <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                        <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                </div>
            </div>


            <div class="row">
            <c:if test='${action == "KiemDuyet" }'>
	             	<div class="row">
	                    <div class="control-navigation">
	                        <button class="btn  btn-cancel" onclick="goBack()">Trở về</button>
	                        <button type="submit" class="btn  btn-continue" onClick="return validateSubmitKhaiSinh()">Tiếp tục</button>
	                    </div>
	                </div>
                </c:if>
                <c:if test='${action != "KiemDuyet" }'>
             		<form action="NopKhaiSinh.php" method="Post" onsubmit="return validateSubmitKhaiSinh()">
	            </c:if>
                <!-- Setup 2000px for test amnition-->
                <div class="paper">
                    <div class="title">
                        <p>TỜ KHAI ĐĂNG KÝ GIẤY KHAI SINH</p>
                        
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
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<input type="text" disabled name="NYC_HOVATEN" class="form-control" id="NYC_HOVATEN" value='<c:out value='${khaisinh.getNgYeuCau().getHoVaTen()}'></c:out>'>
													</c:when>
													<c:otherwise>
														<input type="text" name="NYC_HOVATEN" class="form-control" id="NYC_HOVATEN" value="" onblur="validateHoTen(NYC_HOVATEN)">
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_HOVATEN"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="NYC_CMND">Số CMND</label>
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<input type="text" disabled name="NYC_CMND" class="form-control" id="NYC_CMND" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getSo()}'></c:out>'>
													</c:when>
													<c:otherwise>
														<input type="text" name="NYC_CMND" class="form-control" id="NYC_CMND" onblur="validateCMND(NYC_CMND)">
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_CMND"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="NYC_NOICAP">Nơi cấp</label>
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<input type="text" disabled name="NYC_NOICAP" class="form-control" id="NYC_NOICAP" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getNoiCap()}'></c:out>'>
													</c:when>
													<c:otherwise>
														<input type="text" name="NYC_NOICAP" class="form-control" id="NYC_NOICAP" onblur="validateRequired(NYC_NOICAP)">
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_NOICAP"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="NYC_NGAYCAP">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <c:choose>
																	<c:when test='${action == "KiemDuyet"}'>
																		<input type="text" disabled name="NYC_NGAYCAP" class="form-control" id="NYC_NGAYCAP" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getNgayCapString()}'></c:out>'>
																	</c:when>
																	<c:otherwise>
																		<input type="text" name="NYC_NGAYCAP" class="form-control" id="NYC_NGAYCAP" onblur="validateNgayCap(NYC_NGAYCAP)" placeholder="Ngày/Tháng/Năm">
																	</c:otherwise>
																</c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_NYC_NGAYCAP"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ với người được khai sinh</label>
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<c:choose>
															<c:when test="${khaisinh.getQuanHe() == 'Cha' || khaisinh.getQuanHe() == 'Me'}">
																<select name="NYC_QUANHE" disabled class="form-control" id="NYC_QUANHE">
																	<option>${khaisinh.getQuanHe()}</option>
		                                                		</select>
															</c:when>
															<c:otherwise>
																<select name="NYC_QUANHE" disabled class="form-control" id="NYC_QUANHE">
		                                               			</select>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<select name="NYC_QUANHE" class="form-control" id="NYC_QUANHE" onblur="validateRequired(NYC_QUANHE)">
                                                    		<option>Cha</option>
                                                     		<option>Mẹ</option>
                                               			</select>
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_QUANHE"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ khác </label>
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<c:choose>
															<c:when test="${khaisinh.getQuanHe() != 'Cha' && khaisinh.getQuanHe() != 'Mẹ'}">
																<input name="NYC_QUANHEKHAC" type="text" disabled class="form-control" id="NYC_QUANHEKHAC" value='${khaisinh.getQuanHe()}'>
															</c:when>
															<c:otherwise>
																<input name="NYC_QUANHEKHAC" type="text" disabled class="form-control" id="NYC_QUANHEKHAC" value="">
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<input name="NYC_QUANHEKHAC" type="text" class="form-control" id="NYC_QUANHEKHAC" onblur="validateRequired(NYC_QUANHEKHAC)">
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_QUANHEKHAC"></p>
                                            </div>
                                        </div>


                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="NYC_QUOCTICH">Quốc tịch </label>
                                                <c:choose>
													<c:when test='${action == "KiemDuyet"}'>
														<select name="NYC_QUANHE" disabled class="form-control" id="NYC_QUOCTICH">
															<option>${khaisinh.getNgYeuCau().getQuocTich()}</option>
		                                                </select>
													</c:when>
													<c:otherwise>
														<select name="NYC_QUOCTICH" class="form-control" id="NYC_QUOCTICH" onblur="validateRequired(NYC_QUOCTICH)">
		                                                    <option>Việt Nam</option>
		                                                </select>
													</c:otherwise>
												</c:choose>
                                                <p class="error" id="error_NYC_QUOCTICH"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                    	CapThanhPhoService ThanhPho = new CapThanhPhoService();
                            			ResultSet Result; 
                            		%>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                        	<div class="form-group">
                                            	<label for="NYC_THANHPHO">Tỉnh/TP</label>
                                            	<c:choose>
                                            		<c:when test='${action == "KiemDuyet"}'>
                                            			<select name="NYC_THANHPHO" disabled class="form-control" id="NYC_THANHPHO">
                                            				<option>${khaisinh.getNgYeuCau().getDiaChi().getThanhPho() }</option>
                                            			</select>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<select  onmousedown="chgQuan(NYC_THANHPHO,NYC_QUAN)" onchange="chgQuan(NYC_THANHPHO,NYC_QUAN)"  name="NYC_THANHPHO" class="form-control" id="NYC_THANHPHO" onblur="validateRequired(NYC_THANHPHO)">
		                                                <%
															Result = ThanhPho.ShowThanhPho();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
		                                                	<option value="<%=Result.getString(1)%>"><%=Result.getString(2)%></option>
		                                                <%
																}
															}
														%>
		                                                </select>
                                            		</c:otherwise>
                                            	</c:choose>
                                                <p class="error" id="error_NYC_THANHPHO"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="NYC_QUAN">Quận/Huyện</label>
                                                <c:choose>
                                                	<c:when test='${action == "KiemDuyet"}'>
                                                		<select name="NYC_QUAN" disabled class="form-control" id="NYC_QUAN">
		                                                    <option>${khaisinh.getNgYeuCau().getDiaChi().getQuan() }</option>
		                                                </select>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<select  onload="chgPhuong(NYC_QUAN,NYC_PHUONG)"
		                                                         onmousedown="chgPhuong(NYC_QUAN,NYC_PHUONG)"
		                                                         onchange="chgPhuong(NYC_QUAN,NYC_PHUONG)" name="NYC_QUAN" class="form-control" id="NYC_QUAN" onblur="validateRequired(NYC_QUAN)">
		                                                    <option></option>
		                                                </select>
                                                	</c:otherwise>
                                                </c:choose>
                                                <p class="error" id="error_NYC_QUAN"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <c:choose>
                                                	<c:when test='${action == "KiemDuyet"}'>
                                                		<select name="NYC_PHUONG" disabled class="form-control" id="NYC_PHUONG">
		                                                    <option>${khaisinh.getNgYeuCau().getDiaChi().getPhuong() }</option>
		                                                </select>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<select name="NYC_PHUONG" class="form-control" id="NYC_PHUONG" onblur="validateRequired(NYC_PHUONG)">
		                                                    <option></option>
		                                                </select>
                                                	</c:otherwise>
                                                </c:choose>
                                                <p class="error" id="error_NYC_PHUONG"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="NYC_DIACHI">Địa chỉ chi tiết</label>
                                                <c:choose>
                                                	<c:when test='${action == "KiemDuyet"}'>
                                                		<input name="NYC_DIACHI" type="text" disabled class="form-control" id="NYC_DIACHI" value='${khaisinh.getNgYeuCau().getDiaChi().getSoDuong() }'>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<input name="NYC_DIACHI" type="text" class="form-control" id="NYC_DIACHI" onblur="validateRequired(NYC_DIACHI)">
                                                	</c:otherwise>
                                                </c:choose>
                                                <p class="error" id="error_NYC_DIACHI"></p>
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
										<p>THÔNG TIN NGƯỜI ĐƯỢC KHAI SINH</p>
									</div>
									<div class="content ">
										<div class="row">
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_HOVATEN">Họ và Tên</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<input type="text" disabled name="KS_HOVATEN"
																class="form-control" id="KS_HOVATEN"
																value="<c:out value='${khaisinh.getDoiTuongKhaiSinh().getHoVaTen()}'></c:out>">
														</c:when>
														<c:otherwise>
															<input type="text" name="KS_HOVATEN" class="form-control"
																id="KS_HOVATEN" value=""
																onblur="validateHoTen(KS_HOVATEN)">
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_HOVATEN"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="">Giới tính</label><br>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<c:choose>
																<c:when
																	test='${khaisinh.getDoiTuongKhaiSinh().getGioiTinh()}'>
																	<div class="control-sex">
																		<input type="radio" name="gender" value="1" id="male"
																			checked="checked" disabled>Nam <input
																			style="margin-left: 20px" type="radio" name="gender"
																			id="female" value="0" disabled>Nữ
																	</div>
																</c:when>
																<c:otherwise>
																	<input type="radio" name="gender" value="1" id="male"
																		disabled>Nam
				                                                <input
																		style="margin-left: 20px" type="radio" name="gender"
																		id="female" value="0" checked="checked" disabled>Nữ
                                                			</c:otherwise>
															</c:choose>
														</c:when>
														<c:otherwise>
															<div class="control-sex">
																<input type="radio" name="gender" value="1" id="male"
																	onblur="validateRadio(male, female)">Nam <input
																	style="margin-left: 20px" type="radio" name="gender"
																	id="female" onblur="validateRadio(male, female)"
																	value="0">Nữ
															</div>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_male"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_NGAYSINH">Ngày sinh</label>
													<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
													<div class="bootstrap-iso">
														<div class="container-fluid">
															<div class="row">
																<div class="input-group">
																	<div class="input-group-addon">
																		<i class="fa fa-calendar"> </i>
																	</div>
																	<c:choose>
																		<c:when test='${action == "KiemDuyet"}'>
																			<input class="form-control" id="KS_NGAYSINH" disabled
																				name="KS_NGAYSINH" type="text"
																				value='<c:out value='${khaisinh.getDoiTuongKhaiSinh().getNgaySinhString()}'></c:out>' />
																		</c:when>
																		<c:otherwise>
																			<input class="form-control" id="KS_NGAYSINH"
																				name="KS_NGAYSINH" placeholder="Ngày/Tháng/Năm"
																				type="text" onblur="validateNgayCap(KS_NGAYSINH)" />
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</div>
													</div>
													<p class="error" id="error_KS_NGAYSINH"></p>
												</div>
											</div>
										</div>
										<%
										DanTocService DanToc = new DanTocService();   		
									%>
										<div class="row">
											<div class="col-12 col-sm-6 col-md-4">

												<div class="form-group">
													<label for="KS_DANTOC">Dân tộc</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_DANTOC" class="form-control"
																id="KS_DANTOC" disabled>
																<option>${khaisinh.getDoiTuongKhaiSinh().getDanToc()}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="KS_DANTOC" class="form-control"
																id="KS_DANTOC" onblur="validateRequired(KS_DANTOC)">
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
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_DANTOC"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-8">
												<div class="form-group">
													<label for="">Quốc tịch </label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_QUOCTICH" class="form-control"
																id="KS_QUOCTICH" disabled>
																<option>${khaisinh.getDoiTuongKhaiSinh().getQuocTich()}</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="KS_QUOCTICH" class="form-control"
																id="KS_QUOCTICH" onblur="validateRequired(KS_QUOCTICH)">
																<option>Việt Nam</option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_QUOCTICH"></p>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_THANHPHO">Tỉnh/TP</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_THANHPHO" disabled class="form-control"
																id="KS_THANHPHO">
																<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getThanhPho() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select onmousedown="chgQuan(KS_THANHPHO,KS_QUAN)"
																onchange="chgQuan(KS_THANHPHO,KS_QUAN)"
																name="KS_THANHPHO" class="form-control" id="KS_THANHPHO"
																onblur="validateRequired(KS_THANHPHO)">
																<%
															Result = ThanhPho.ShowThanhPho();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
																<option value="<%=Result.getString(1)%>"><%=Result.getString(2)%></option>
																<%
																}
															}
														%>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_THANHPHO"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_QUAN">Quận/Huyện</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_QUAN" disabled class="form-control"
																id="KS_QUAN">
																<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getQuan() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select onload="chgPhuong(KS_QUAN,KS_PHUONG)"
																onmousedown="chgPhuong(KS_QUAN,KS_PHUONG)"
																onchange="chgPhuong(KS_QUAN,KS_PHUONG)" name="KS_QUAN"
																class="form-control" id="KS_QUAN"
																onblur="validateRequired(KS_QUAN)">
																<option></option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_QUAN"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="">Xã/Phường</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_PHUONG" disabled class="form-control"
																id="KS_PHUONG">
																<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getPhuong() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="KS_PHUONG" class="form-control"
																id="KS_PHUONG" onblur="validateRequired(KS_PHUONG)">
																<option></option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_PHUONG"></p>
												</div>
											</div>
											<div class="col-12 col-sm-12 col-md-12">
												<div class="form-group">
													<label for="KS_DIACHI">Địa chỉ chi tiết</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<input name="KS_DIACHI" type="text" disabled
																class="form-control" id="KS_DIACHI"
																value='${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getSoDuong() }'>
														</c:when>
														<c:otherwise>
															<input name="KS_DIACHI" type="text" class="form-control"
																id="KS_DIACHI" onblur="validateRequired(KS_DIACHI)">
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_DIACHI"></p>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-12 col-sm-12 col-md-6">
												<div class="form-group">
													<label for="KS_CSSS">Cơ sở y tế sinh sản</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<input name="KS_CSSS" type="text" class="form-control"
																id="KS_CSSS"
																value='${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getTenCoSoYTe() }'
																disabled>
														</c:when>
														<c:otherwise>
															<input name="KS_CSSS" type="text" class="form-control"
																id="KS_CSSS" onblur="validateRequired(KS_CSSS)">
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-6">
												<div class="form-group">
													<label for="KS_CSSS_QUOCGIA">Quốc gia </label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_CSSS_QUOCGIA" class="form-control"
																id="KS_CSSS_QUOCGIA" disabled>
																<option>${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getDiaChi().getQuocGia() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="KS_CSSS_QUOCGIA" class="form-control"
																id="KS_CSSS_QUOCGIA"
																onblur="validateRequired(KS_CSSS_QUOCGIA)">
																<option>Việt Nam</option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS_QUOCGIA"></p>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_CSSS_THANHPHO">Tỉnh/TP</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_CSSS_THANHPHO" disabled
																class="form-control" id="KS_CSSS_THANHPHO">
																<option>${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getDiaChi().getThanhPho() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select
																onmousedown="chgQuan(KS_CSSS_THANHPHO,KS_CSSS_QUAN)"
																onchange="chgQuan(KS_CSSS_THANHPHO,KS_CSSS_QUAN)"
																name="KS_CSSS_THANHPHO" class="form-control"
																id="KS_CSSS_THANHPHO"
																onblur="validateRequired(KS_CSSS_THANHPHO)">
																<%
															Result = ThanhPho.ShowThanhPho();
															if (!Result.wasNull()) {
																while (Result.next()) {
														%>
																<option value="<%=Result.getString(1)%>"><%=Result.getString(2)%></option>
																<%
																}
															}
														%>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS_THANHPHO"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="KS_CSSS_QUAN">Quận/Huyện</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_CSSS_QUAN" disabled class="form-control"
																id="KS_CSSS_QUAN">
																<option>${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getDiaChi().getQuan() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select onload="chgPhuong(KS_CSSS_QUAN,KS_CSSS_PHUONG)"
																onmousedown="chgPhuong(KS_CSSS_QUAN,KS_CSSS_PHUONG)"
																onchange="chgPhuong(KS_CSSS_QUAN,KS_CSSS_PHUONG)"
																name="KS_CSSS_QUAN" class="form-control"
																id="KS_CSSS_QUAN"
																onblur="validateRequired(KS_CSSS_QUAN)">
																<option></option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS_QUAN"></p>
												</div>
											</div>
											<div class="col-12 col-sm-6 col-md-4">
												<div class="form-group">
													<label for="">Xã/Phường</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<select name="KS_CSSS_PHUONG" disabled
																class="form-control" id="KS_CSSS_PHUONG">
																<option>${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getDiaChi().getPhuong() }</option>
															</select>
														</c:when>
														<c:otherwise>
															<select name="KS_CSSS_PHUONG" class="form-control"
																id="KS_CSSS_PHUONG"
																onblur="validateRequired(KS_CSSS_PHUONG)">
																<option></option>
															</select>
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS_PHUONG"></p>
												</div>
											</div>
											<div class="col-12 col-sm-12 col-md-12">
												<div class="form-group">
													<label for="KS_CSSS_DIACHI">Địa chỉ chi tiết</label>
													<c:choose>
														<c:when test='${action == "KiemDuyet"}'>
															<input name="KS_CSSS_DIACHI" type="text" disabled
																class="form-control" id="KS_CSSS_DIACHI"
																value='${khaisinh.getDoiTuongKhaiSinh().getNoiSinh().getDiaChi().getSoDuong() }'>
														</c:when>
														<c:otherwise>
															<input name="KS_CSSS_DIACHI" type="text"
																class="form-control" id="KS_CSSS_DIACHI"
																onblur="validateRequired(KS_CSSS_DIACHI)">
														</c:otherwise>
													</c:choose>
													<p class="error" id="error_KS_CSSS_DIACHI"></p>
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
										<div class="col-12 col-sm-6 col-md-6">
											<p style="font-size: 18px; font-weight: bold">THÔNG TIN CỦA MẸ</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6"
											style="text-align: right; height: 100%">
											<c:choose>
												<c:when test='${action == "KiemDuyet"}'>
													<c:choose>
														<c:when test='${khaisinh.getMe() == null }'>
															<input type="checkbox" data-toggle="collapse" data-target="#ME" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" checked disabled>
														</c:when>
														<c:otherwise>
															<input type="checkbox" data-toggle="collapse" data-target="#ME" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" disabled>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<input type="checkbox" data-toggle="collapse" data-target="#ME" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;">
												</c:otherwise>
											</c:choose>
											<label style="margin: auto">Không có</label>
										</div>
									</div>
									<c:choose>
										<c:when test='${action == "KiemDuyet"}'>
												<c:if test='${khaisinh.getMe() != null }'>
													<div class="content collapse in" id="ME">
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for=>Họ và Tên</label>
																	<input name="ME_HOVATEN" type="text" class="form-control" id="ME_HOVATEN" value='${khaisinh.getMe().getHoVaTen() }' disabled>
																	<p class="error" id="error_ME_HOVATEN"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_NGAYSINH">Ngày sinh</label>
																	<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
																	<div class="bootstrap-iso">
																		<div class="container-fluid">
																			<div class="row">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<i class="fa fa-calendar"> </i>
																					</div>
																					<input name="ME_NGAYSINH" class="form-control" id="ME_NGAYSINH" type="text" value='${khaisinh.getMe().getNgaySinh() }' disabled/>
																				</div>
																			</div>
																		</div>
																	</div>
																	<p class="error" id="error_ME_NGAYSINH"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_CMND">Số CMND</label>
																	<input name="ME_CMND" type="text" class="form-control" id="ME_CMND" value='${khaisinh.getMe().getCmnd().getSo() }' disabled>
																</div>
																<p class="error" id="error_ME_CMND"></p>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_NOICAP">Nơi cấp</label>
																	<input name="ME_NOICAP" type="text" class="form-control" id="ME_NOICAP" value='${khaisinh.getMe().getCmnd().getNoiCap() }' disabled>
																	<p class="error" id="error_ME_NOICAP"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_NGAYCAP">Ngày cấp</label>
																	<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
																	<div class="bootstrap-iso">
																		<div class="container-fluid">
																			<div class="row">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<i class="fa fa-calendar"> </i>
																					</div>
																					<input name="ME_NGAYCAP" class="form-control" id="ME_NGAYCAP" type="text" value='${khaisinh.getMe().getCmnd().getNgayCapString() }' disabled/>
																				</div>
																			</div>
																		</div>
																	</div>
																	<p class="error" id="error_ME_NGAYCAP"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_DANTOC">Dân tộc</label>
																	<select name="ME_DANTOC" class="form-control" id="ME_DANTOC" disabled>
																		<option>
																			${khaisinh.getMe().getDanToc() }
																		</option>
																	</select>
																	<p class="error" id="error_ME_DANTOC"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_QUOCTICH">Quốc tịch </label>
																	<select name="ME_QUOCTICH" class="form-control" id="ME_QUOCTICH" disabled>
																		<option>${khaisinh.getMe().getQuocTich() }</option>
																	</select>
																	<p class="error" id="error_ME_QUOCTICH"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_THANHPHO">Tỉnh/TP</label>
																	<select name="ME_THANHPHO" disabled class="form-control" id="ME_THANHPHO" disabled>
                                            							<option>${khaisinh.getMe().getDiaChi().getThanhPho() }</option>
                                            						</select>
																	<p class="error" id="error_ME_THANHPHO"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_QUAN">Quận/Huyện</label>
																	<select name="ME_QUAN" disabled class="form-control" id="ME_QUAN" disabled>
					                                                    <option>${khaisinh.getMe().getDiaChi().getQuan() }</option>
					                                                </select>
																	<p class="error" id="error_ME_QUAN"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="ME_PHUONG">Xã/Phường</label>
																	<select name="ME_PHUONG" disabled class="form-control" id="ME_PHUONG">
					                                                    <option>${khaisinh.getMe().getDiaChi().getPhuong() }</option>
					                                                </select>
																	<p class="error" id="error_ME_PHUONG"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-12 col-md-12">
																<div class="form-group">
																	<label for="">Địa chỉ chi tiết</label>
																	<input name="ME_DIACHI" type="text" disabled class="form-control" id="ME_DIACHI" value='${khaisinh.getMe().getDiaChi().getSoDuong() }'>
																	<p class="error" id="error_ME_DIACHI"></p>
																</div>
															</div>
														</div>
													</div>
												</c:if>
										</c:when>
										<c:otherwise>
											<div class="content collapse in" id="ME">
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for=>Họ và Tên</label>
															<input name="ME_HOVATEN" type="text" class="form-control" id="ME_HOVATEN" onblur="validateHoTen(ME_HOVATEN)">
															<p class="error" id="error_ME_HOVATEN"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_NGAYSINH">Ngày sinh</label>
															<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
															<div class="bootstrap-iso">
																<div class="container-fluid">
																	<div class="row">
																		<div class="input-group">
																			<div class="input-group-addon">
																				<i class="fa fa-calendar"> </i>
																			</div>
																			<input name="ME_NGAYSINH" class="form-control" id="ME_NGAYSINH" placeholder="Ngày/Tháng/Năm" type="text" onblur="validateRequired(ME_NGAYSINH)" />
																		</div>
																	</div>
																</div>
															</div>
															<p class="error" id="error_ME_NGAYSINH"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_CMND">Số CMND</label>
															<input name="ME_CMND" type="text" class="form-control" id="ME_CMND" onblur="validateCMND(ME_CMND)">
														</div>
														<p class="error" id="error_ME_CMND"></p>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_NOICAP">Nơi cấp</label>
															<input name="ME_NOICAP" type="text" class="form-control" id="ME_NOICAP" onblur="validateRequired(ME_NOICAP)">
															<p class="error" id="error_ME_NOICAP"></p>
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
																				<i class="fa fa-calendar"> </i>
																			</div>
																			<input name="ME_NGAYCAP" class="form-control" id="ME_NGAYCAP" placeholder="Ngày/Tháng/Năm" onblur="validateNgayCap(ME_NGAYCAP)" type="text" />
																		</div>
																	</div>
																</div>
															</div>
															<p class="error" id="error_ME_NGAYCAP"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_DANTOC">Dân tộc</label>
															<select name="ME_DANTOC" class="form-control" id="ME_DANTOC" onblur="validateRequired(ME_DANTOC)">
																<%
																	Result = DanToc.ShowDanToc();
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
															<p class="error" id="error_ME_DANTOC"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_QUOCTICH">Quốc tịch </label>
															<select name="ME_QUOCTICH" class="form-control" id="ME_QUOCTICH" onblur="validateRequired(ME_QUOCTICH)">
																<option>Việt Nam</option>
															</select>
															<p class="error" id="error_ME_QUOCTICH"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_THANHPHO">Tỉnh/TP</label>
															<select onmousedown="chgQuan(ME_THANHPHO,ME_QUAN)" name="ME_THANHPHO" class="form-control" id="ME_THANHPHO"
																onchange="chgQuan(ME_THANHPHO,ME_QUAN)" onblur="validateRequired(ME_THANHPHO)">
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
															<p class="error" id="error_ME_THANHPHO"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_QUAN">Quận/Huyện</label>
															<select name="ME_QUAN" class="form-control" id="ME_QUAN" onload="chgPhuong(ME_QUAN,ME_PHUONG)"
																onmousedown="chgPhuong(ME_QUAN,ME_PHUONG)" onchange="chgPhuong(ME_QUAN,ME_PHUONG)" onblur="validateRequired(ME_QUAN)">
																<option></option>
															</select>
															<p class="error" id="error_ME_QUAN"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="ME_PHUONG">Xã/Phường</label> <select name="ME_PHUONG"
																class="form-control" id="ME_PHUONG"
																onblur="validateRequired(ME_PHUONG)">
																<option></option>
															</select>
															<p class="error" id="error_ME_PHUONG"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-12 col-md-12">
														<div class="form-group">
															<label for="ME_DIACHI">Địa chỉ chi tiết</label>
															<input name="ME_DIACHI" type="text" class="form-control" id="ME_DIACHI" onblur="validateRequired(ME_DIACHI)">
															<p class="error" id="error_ME_DIACHI"></p>
														</div>
													</div>
		
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<!-- ------------------------------- -->
								</div>
							</div>
						</div>

						<div class="row">
							<div class="container container-paper">
								<div class="part-content">
									<div class="title-part">
										<div class="col-12 col-sm-6 col-md-6">
											<p style="font-size: 18px; font-weight: bold">THÔNG TIN CỦA CHA</p>
										</div>
										<div class="col-12 col-sm-6 col-md-6"
											style="text-align: right; height: 100%">
											<c:choose>
												<c:when test='${action == "KiemDuyet"}'>
													<c:choose>
														<c:when test='${khaisinh.getCha() == null }'>
															<input type="checkbox" data-toggle="collapse" data-target="#CHA" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" checked disabled>
														</c:when>
														<c:otherwise>
															<input type="checkbox" data-toggle="collapse" data-target="#CHA" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" disabled>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<input type="checkbox" data-toggle="collapse" data-target="#CHA" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;">
												</c:otherwise>
											</c:choose>
											<label style="margin: auto">Không có</label>
										</div>
									</div>
									<c:choose>
										<c:when test='${action == "KiemDuyet"}'>
												<c:if test='${khaisinh.getCha() != null }'>
													<div class="content collapse in" id="CHA">
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for=>Họ và Tên</label>
																	<input name="CHA_HOVATEN" type="text" class="form-control" id="CHA_HOVATEN" value='${khaisinh.getCha().getHoVaTen() }' disabled>
																	<p class="error" id="error_CHA_HOVATEN"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_NGAYSINH">Ngày sinh</label>
																	<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
																	<div class="bootstrap-iso">
																		<div class="container-fluid">
																			<div class="row">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<i class="fa fa-calendar"> </i>
																					</div>
																					<input name="CHA_NGAYSINH" class="form-control" id="CHA_NGAYSINH" type="text" value='${khaisinh.getCha().getNgaySinh() }' disabled/>
																				</div>
																			</div>
																		</div>
																	</div>
																	<p class="error" id="error_CHA_NGAYSINH"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_CMND">Số CMND</label>
																	<input name="CHA_CMND" type="text" class="form-control" id="CHA_CMND" value='${khaisinh.getCha().getCmnd().getSo() }' disabled>
																</div>
																<p class="error" id="error_CHA_CMND"></p>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_NOICAP">Nơi cấp</label>
																	<input name="CHA_NOICAP" type="text" class="form-control" id="CHA_NOICAP" value='${khaisinh.getCha().getCmnd().getNoiCap() }' disabled>
																	<p class="error" id="error_CHA_NOICAP"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_NGAYCAP">Ngày cấp</label>
																	<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
																	<div class="bootstrap-iso">
																		<div class="container-fluid">
																			<div class="row">
																				<div class="input-group">
																					<div class="input-group-addon">
																						<i class="fa fa-calendar"> </i>
																					</div>
																					<input name="CHA_NGAYCAP" class="form-control" id="CHA_NGAYCAP" type="text" value='${khaisinh.getCha().getCmnd().getNgayCapString() }' disabled/>
																				</div>
																			</div>
																		</div>
																	</div>
																	<p class="error" id="error_CHA_NGAYCAP"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_DANTOC">Dân tộc</label>
																	<select name="CHA_DANTOC" class="form-control" id="CHA_DANTOC" disabled>
																		<option>
																			${khaisinh.getCha().getDanToc() }
																		</option>
																	</select>
																	<p class="error" id="error_CHA_DANTOC"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_QUOCTICH">Quốc tịch </label>
																	<select name="CHA_QUOCTICH" class="form-control" id="CHA_QUOCTICH" disabled>
																		<option>${khaisinh.getCha().getQuocTich() }</option>
																	</select>
																	<p class="error" id="error_CHA_QUOCTICH"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_THANHPHO">Tỉnh/TP</label>
																	<select name="CHA_THANHPHO" disabled class="form-control" id="CHA_THANHPHO" disabled>
                                            							<option>${khaisinh.getCha().getDiaChi().getThanhPho() }</option>
                                            						</select>
																	<p class="error" id="error_CHA_THANHPHO"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_QUAN">Quận/Huyện</label>
																	<select name="CHA_QUAN" disabled class="form-control" id="CHA_QUAN" disabled>
					                                                    <option>${khaisinh.getCha().getDiaChi().getQuan() }</option>
					                                                </select>
																	<p class="error" id="error_CHA_QUAN"></p>
																</div>
															</div>
															<div class="col-12 col-sm-6 col-md-4">
																<div class="form-group">
																	<label for="CHA_PHUONG">Xã/Phường</label>
																	<select name="CHA_PHUONG" disabled class="form-control" id="CHA_PHUONG">
					                                                    <option>${khaisinh.getCha().getDiaChi().getPhuong() }</option>
					                                                </select>
																	<p class="error" id="error_CHA_PHUONG"></p>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-12 col-sm-12 col-md-12">
																<div class="form-group">
																	<label for="">Địa chỉ chi tiết</label>
																	<input name="CHA_DIACHI" type="text" disabled class="form-control" id="CHA_DIACHI" value='${khaisinh.getCha().getDiaChi().getSoDuong() }'>
																	<p class="error" id="error_CHA_DIACHI"></p>
																</div>
															</div>
														</div>
													</div>
												</c:if>
										</c:when>
										<c:otherwise>
											<div class="content collapse in" id="CHA">
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for=>Họ và Tên</label>
															<input name="CHA_HOVATEN" type="text" class="form-control" id="CHA_HOVATEN" onblur="validateHoTen(CHA_HOVATEN)">
															<p class="error" id="error_CHA_HOVATEN"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_NGAYSINH">Ngày sinh</label>
															<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
															<div class="bootstrap-iso">
																<div class="container-fluid">
																	<div class="row">
																		<div class="input-group">
																			<div class="input-group-addon">
																				<i class="fa fa-calendar"> </i>
																			</div>
																			<input name="CHA_NGAYSINH" class="form-control" id="CHA_NGAYSINH" placeholder="Ngày/Tháng/Năm" type="text" onblur="validateRequired(CHA_NGAYSINH)" />
																		</div>
																	</div>
																</div>
															</div>
															<p class="error" id="error_CHA_NGAYSINH"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_CMND">Số CMND</label>
															<input name="CHA_CMND" type="text" class="form-control" id="CHA_CMND" onblur="validateCMND(CHA_CMND)">
														</div>
														<p class="error" id="error_CHA_CMND"></p>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_NOICAP">Nơi cấp</label>
															<input name="CHA_NOICAP" type="text" class="form-control" id="CHA_NOICAP" onblur="validateRequired(CHA_NOICAP)">
															<p class="error" id="error_CHA_NOICAP"></p>
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
																				<i class="fa fa-calendar"> </i>
																			</div>
																			<input name="CHA_NGAYCAP" class="form-control" id="CHA_NGAYCAP" placeholder="Ngày/Tháng/Năm" onblur="validateNgayCap(CHA_NGAYCAP)" type="text" />
																		</div>
																	</div>
																</div>
															</div>
															<p class="error" id="error_CHA_NGAYCAP"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_DANTOC">Dân tộc</label>
															<select name="CHA_DANTOC" class="form-control" id="CHA_DANTOC" onblur="validateRequired(CHA_DANTOC)">
																<%
																	Result = DanToc.ShowDanToc();
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
															<p class="error" id="error_CHA_DANTOC"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_QUOCTICH">Quốc tịch </label>
															<select name="CHA_QUOCTICH" class="form-control" id="CHA_QUOCTICH" onblur="validateRequired(CHA_QUOCTICH)">
																<option>Việt Nam</option>
															</select>
															<p class="error" id="error_CHA_QUOCTICH"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_THANHPHO">Tỉnh/TP</label>
															<select onmousedown="chgQuan(CHA_THANHPHO,CHA_QUAN)" name="CHA_THANHPHO" class="form-control" id="CHA_THANHPHO"
																onchange="chgQuan(CHA_THANHPHO,CHA_QUAN)" onblur="validateRequired(CHA_THANHPHO)">
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
															<p class="error" id="error_CHA_THANHPHO"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_QUAN">Quận/Huyện</label>
															<select name="CHA_QUAN" class="form-control" id="CHA_QUAN" onload="chgPhuong(CHA_QUAN,CHA_PHUONG)"
																onmousedown="chgPhuong(CHA_QUAN,CHA_PHUONG)" onchange="chgPhuong(CHA_QUAN,CHA_PHUONG)" onblur="validateRequired(CHA_QUAN)">
																<option></option>
															</select>
															<p class="error" id="error_CHA_QUAN"></p>
														</div>
													</div>
													<div class="col-12 col-sm-6 col-md-4">
														<div class="form-group">
															<label for="CHA_PHUONG">Xã/Phường</label> <select name="CHA_PHUONG"
																class="form-control" id="CHA_PHUONG"
																onblur="validateRequired(CHA_PHUONG)">
																<option></option>
															</select>
															<p class="error" id="error_CHA_PHUONG"></p>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-12 col-sm-12 col-md-12">
														<div class="form-group">
															<label for="CHA_DIACHI">Địa chỉ chi tiết</label>
															<input name="CHA_DIACHI" type="text" class="form-control" id="CHA_DIACHI" onblur="validateRequired(CHA_DIACHI)">
															<p class="error" id="error_CHA_DIACHI"></p>
														</div>
													</div>
		
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<!-- ------------------------------- -->
								</div>
							</div>
						</div>
					<c:if test='${action != "KiemDuyet" }'>
						<div class="row">
	                        <div class="container container-paper">
	                            <div class="content-checkbox">
	                                <div class="form-check">
	                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
	                                    <label class="form-check-label">Tôi cam đoan đề nghị đăng ký trên đây là đúng sự
	                                        thật, được sự thỏa thuận và nhất trí của các bên liên quan theo quy định của
	                                        pháp luật. </label>
	                                    <label>Tôi hoàn toàn chịu trách nhiệm trước pháp luật về nội dung cam đoan của mình
	                                    </label>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:if>
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
                                                                <td>Giấy chứng sinh</td>
                                                                <td>
                                                                	<c:if test='${action == "KiemDuyet" }'>
                                                                		${khaisinh.getFileGiayChungSinh() }
                                                                	</c:if>
                                                                </td>
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
                <c:if test='${action != "KiemDuyet" }'>
                <div class="row">
                    <div class="control-navigation">
                        <button class="btn  btn-cancel">Hủy bỏ</button>
                        <button type="submit" class="btn  btn-continue" onClick="return validateSubmitKhaiSinh()">Tiếp
                            tục</button>
                    </div>
                </div>
                </c:if>
                <c:if test='${action != "KiemDuyet" }'>
                </form>
                </c:if>
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
    <script src="CONTENT/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="CONTENT/js/Header.js"></script>
    <script src="CONTENT/js/valiedateForm.js"></script>
     <script src="CONTENT/js/DangKyKhaiSinhAjax.js"></script>
     <script src="CONTENT/js/KiemDuyet.js"></script>
</body>

</html>
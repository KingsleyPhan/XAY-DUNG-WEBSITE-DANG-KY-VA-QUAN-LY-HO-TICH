<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="DAO.DAO_NGUOIDUNG"%>
<%@page import="DAO.Consts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Models.CapThanhPhoService"%>
<%@page import="DAO.DAO_QUYEN"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>HOTICH.NET</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src=" https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
    <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

    <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/guest/HAF.css">
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/admin/admin.css">
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/admin/Admin_TongQuat.css">


</head>
<body>
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
				<div class="header_location"
					style="margin-top: 130px; margin-bottom: 20px">
					<p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ
						CHÍ MINH</p>
					<p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ
						QUẬN 9</p>
				</div>
			</div>
		</div>



		<div class="container " style="width: 95%">
			<div class="row">
				<!-- Top navigation -->
				<div class="topnav menu-top">
					<!-- Left-aligned links (default) -->
					<a href="admin_TongQuat.html"><i
						class="fa fa-list fa-lg padd-icon"></i>TỔNG QUAN</a> <a
						href="admin_TongQuatNguoiDung.html"
						style="background-color: rgb(243, 93, 33);"><i
						class="fa fa-address-book-o fa-lg padd-icon"></i>TÀI KHOẢN NGƯỜI
						DÙNG</a> <a href="#news"><i class="fa fa-cogs fa-lg padd-icon"></i>THIẾT
						LẬP CƠ QUAN</a> <a href="#news"><i
						class="fa fa-cubes  fa-lg padd-icon"></i>QUẢN LÝ PHẦN MỀM</a> <a
						href="#contact"><i class="fa fa-info-circle fa-lg padd-icon"></i>THÔNG
						TIN PHẦN MỀM</a>

				</div>


			</div>
			<!-- Setup 2000px for test amnition-->
			<div class="paper" style="margin-top: 20px;">
				<div class="titile" style="margin-top: 30px">
					<p>
						<i class="fa fa-list-alt" style="padding-right: 10px"></i>QUẢN LÝ
						THÔNG TIN TÀI KHOẢN
					</p>
				</div>
				<div class="row" style="margin-bottom: 10px">
					<button id="buttonAdd" onclick="functionButtonAdd(this)"
						class="btn add ">+ CẤP TÀI KHOẢN</button>
				</div>
				<div class="row">

					<table id="table-user-imfor"
						class="table table-hover table-bordered table-striped table-sm">
						<!--Table head-->
						<thead>
							<tr>
								<th class="th-sm">STT</th>
								<th class="th-sm">MÃ CÁN BỘ</th>
								<th class="th-sm">HỌ VÀ TÊN</th>
								<th class="th-sm">NGÀY SINH</th>
								<th class="th-sm">Chức vụ</th>
								<th class="th-sm">SĐT</th>
								<th class="th-sm">Email</th>
								<th class="th-sm">Quyền</th>
								<th class="th-sm">Trạng Thái</th>
							</tr>
						</thead>
						<!--Table head-->
						<!--Table body-->
						<tbody>
							<%
								DAO_NGUOIDUNG user = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.UserName, Consts.Pass);
								ResultSet result;
							%>

							<%
								int count = 1;

								result = user.loadUser(Consts.COQUAN_ID + "");
								if (!result.wasNull()) {
									while (result.next()) {
							%>
							<tr onclick="myFunction(this)">
								<td><%=count%></td>
								<td><%=result.getString(1)%></td>
								<td><%=result.getString(2)%></td>
								<td><%=result.getString(3)%></td>
								<td><%=result.getString(4)%></td>
								<td><%=result.getString(5)%></td>
								<td><%=result.getString(6)%></td>
								<td><%=result.getString(7)%></td>
								<td><%=result.getString(8)%></td>
							<tr>
								<%
									count++;
										}
									}
								%>
							
						</tbody>
						<!--Table body-->
					</table>

				</div>
				<!--Table-->
				<div class="titile" style="margin-top: 30px">
					<p>
						<i class="fa fa-list-alt" style="padding-right: 10px"></i>THÔNG
						TIN CHI TIẾT NGƯỜI DÙNG
					</p>
				</div>
				<form action="QuanLyNguoiDung" method="post">
					<div class="row">
						<div class="col-12 col-sm-6 col-md-4">
							<div class="form-group">
								<label for="">MÃ CÁN BỘ</label> <input type="text"
									class="form-control" id="user_MACANBO" readOnly
									name="user_MACANBO" onblur="validateRequired(user_MACANBO)">
								<p class="error" id="error_user_MACANBO"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4">
							<div class="form-group">
								<label for=>Họ và Tên</label> <input type="text"
									class="form-control" id="user_HoVaten" readOnly
									name="user_HoVaten" onblur="validateHoTen(user_HoVaten)">
								<p class="error" id="error_user_HoVaten"></p>
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
												<input class="form-control" id="user_NgaySinh"
													
													name="user_NgaySinh"
													
													placeholder="Ngày/Tháng/Năm" type="text" />

											</div>
										</div>
									</div>
								</div>
								<p class="error" id="error_user_NgaySinh"></p>
							</div>
						</div>
					</div>

					<div class="row">

						<div class="col-12 col-sm-6 col-md-4">
							<div class="form-group">
								<label for="">Chức vụ</label> <input type="text"
									class="form-control" id="user_ChucVu" name="user_ChucVu"
									readOnly>
								<p class="error" id="error_user_ChucVu"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4">

							<div class="form-group">
								<label for="">Quyền sử dụng</label> <select id="user_Quyen"
									name="user_Quyen" class="form-control" disabled>

									<option value="0">Chọn quyền người dùng ...</option>
									<option value="1">Cán bộ hộ tịch</option>
									<option value="2">Quản trị cơ quan</option>



								</select>
								<p class="error" id="error_user_Quyen"></p>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-12 col-sm-6 col-md-4">
							<div class="form-group">
								<label for="">Email</label> <input type="text"
									class="form-control" id="user_Email" name="user_Email" readOnly>
								<p class="error" id="error_user_Email"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4">
							<div class="form-group">
								<label for="">SĐT</label> <input type="text"
									class="form-control" id="user_SDT" name="user_SDT" readOnly>
								<p class="error" id="error_user_SDT"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4">

							<div class="form-group">
								<label for="">Trạng thái sử dụng </label><br> <label
									class="switch"> <input name="user_TrangThai" readOnly
									id="user_TrangThai" type="checkbox" checked> <span
									class="slider round"></span>
								</label>

								<p class="error" id="error_user_TrangThai"></p>
							</div>
						</div>
					</div>
					<div class="row">

						<div class="col-12 col-sm-6 col-md-4" id="ResetPassword">
							<div class="form-group">
								<label for="" style="color: brown">RESET PASSWORD (*)</label> <input
									type="text" class="form-control" id="user_RSP" name="user_RSP"
									readOnly onblur="validateRequired(user_ChucVu)">
								<p class="error" id="error_user_RSP"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4" id="Username"
							style="display: none">
							<div class="form-group">
								<label for="">Tên đăng nhập</label> <input type="text"
									class="form-control" id="user_name" name="user_name">
								<p class="error" id="error_user_name"></p>
							</div>
						</div>
						<div class="col-12 col-sm-6 col-md-4" id="password"
							style="display: none">
							<div class="form-group">
								<label for="">Mật khẩu</label> <input type="text"
									class="form-control" id="user_pass" name="user_pass">

								<p class="error" id="error_user_pass"></p>

							</div>
						</div>
					</div>

					<div class="row">
						<input type="text" id="store" name="store" value=0
							style="display: none">
						<button type="submit" value="add" style="float: right;"
							id="buttonSave" name="buttonSave"
							onclick="functionButtonSave(this)" class="btn add " disabled>LƯU
							THÔNG TIN</button>
						<button style="float: right;" value="edit" id="buttonEdit"
							name="buttonEdit" class="btn add "
							onclick="functionChinhSua(this)" disabled>CHỈNH SỬA</button>
						<button style="float: right;" id="buttonCancel" class="btn add "
							onclick="functionCancel(this)" disabled>HỦY BỎ THAO TÁC</button>
						<button type="submit" value="reset" disabled
							style="float: left; background-color: brown" id="buttonReset"
							name="buttonReset" class="btn add "
							onclick="return functionReset(this)">RESET PASSWORD</button>

					</div>

				</form>
			</div>

		</div>
		<div class="imfor-Table">
			<div class="head-imfor">
				<p>LƯU Ý!</p>
			</div>
			<div class="content-imfor">
				<p style="color: brown; font-size: 18px; font-weight: 700">HOẠT
					ĐỘNG CHỈNH SỬA NGƯỜI DÙNG THEO QUYỀN CỦA ADMIN LÀ HOẠT ĐỘNG CÓ
					QUYỀN TRUY CẬP CAO NHẤT.</p>
				<p style="color: brown; font-size: 18px; font-weight: 700">HÃY
					CẦN THẬN VỚI NHỮNG THAO TÁC CỦA BẠN !</p>
				<p style="color: brown; font-size: 18px; font-weight: 700">HÃY
					LIÊN HỆ VỚI CHÚNG TÔI KHI CẦN THIẾT.</p>
				<p style="color: brown; font-size: 18px; font-weight: 700">HOTICH.NET</p>
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
						<p>SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer-->
	<!-- End Footer-->

	<script src="CONTENT/js/guest/index.js"></script>
	<script src="CONTENT/js/guest/Header.js"></script>
	<script src="CONTENT/js/admin/AdminNguoIDung.js"></script>
	<script src="CONTENT/js/guest/valiedateForm.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="DAO.DAO_NGUOIDUNG"%>
<%@page import="DAO.Consts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Models.CapThanhPhoService"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="CONTENT/styles/HAF.css">
<link rel="stylesheet" type="text/css" href="CONTENT/styles/admin.css">

</head>
<body>
	<!-- Start Header-->

	<header id="header" class="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="logo-text">
						<p>HOTICH.NET</p>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- End Header-->

	<!--Start Content-->
	<div id="ct" class="content-switch">
		<div class="container">
			<div class="row">
				<div class="header_location">
					<p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ
						CHÍ MINH</p>
					<p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ
						QUẬN 9</p>
				</div>
			</div>
		</div>
		<div class="container" style="width: 95%">
			<div class="row">
				<!-- Top navigation -->
				<div class="topnav">
					<!-- Left-aligned links (default) -->
					<a href="#news">TỔNG QUAN</a> <a href="#contact">TÀI KHOẢN</a> <a
						href="#news">CƠ QUAN</a> <a href="#contact">PHẦN MỀM</a>
				</div>


			</div>
			<!-- Setup 2000px for test amnition-->
			<div class="paper">

				<div class="title">
					<div class="col-12 col-sm-12 col-md-12">
						<div class="form-group">
							<div class="table-responsive">
								<table class="table table-bordered table-upload table-User">
									<thead>
										<tr>
											<th scope="col" style="width: 20px">STT</th>
											<th scope="col">HỌ VÀ TÊN</th>
											<th scope="col" style="width: 140px">MÃ CÁN BỘ</th>
											<th scope="col" style="width: 180px">EMAIL</th>
											<th scope="col" style="width: 180px">SĐT</th>
											<th scope="col" style="width: 140px">CHỨC VỤ</th>
											<th scope="col" style="width: 140px">QUYỀN</th>
											<th scope="col" style="width: 140px">TRẠNG THÁI</th>
										</tr>
									</thead>
									<tbody>
										<%
											DAO_NGUOIDUNG user = new DAO_NGUOIDUNG(Consts.ServerUrl, Consts.Pass, Consts.UserName);
											ResultSet result;
										%>

										<%
											int count = 1;
											result = user.loadUser("1");
											if (!result.wasNull()) {
												while (result.next()) {
										%>
										<tr>
											<td><%=count%></td>
											<td><%=result.getString(1)%></td>
											<td><%=result.getString(2)%></td>
											<td><%=result.getString(3)%></td>
											<td><%=result.getString(4)%></td>
											<td><%=result.getString(5)%></td>
											<td><%=result.getString(6)%></td>
											<td><%=result.getString(7)%></td>
										<tr>
											<%
												count++;
													}
												}
											%>
										
										<tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div style="font-size: 15px">
				<form action="ThemNhanVien.php" method="post">
					<div class="titile">
						<p>TÀI KHOẢN</p>
						<div class="controls-edit" style="margin-right: 20px;margin-bottom: 20px">
							<button class="btn add ">
								THÊM <i class="fa fa-home"></i>
							</button>
							<button class="btn add ">
								CHỈNH SỬA <i class="fa fa-home"></i>
							</button>
							<button class="btn add">
								HỦY BỎ <i class="fa fa-home"></i>
							</button>
							<button type="submit" class="btn add "
								style="float: right; margin-right: 45px;">
								LƯU <i class="fa fa-home"></i>
							</button>
						</div>
					</div>

					
						<div class="row">
							<div class="col-12 col-sm-6 col-md-4">
								<div class="form-group">
									<label for=>Họ và Tên</label> <input type="text"
										class="form-control" id="user_HoVaten" name="user_HoVaten"
										onblur="validateHoTen(user_HoVaten)">
									<p class="error" id="error_user_HoVaten"></p>
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
														<i class="fa fa-calendar"> </i>
													</div>
													<input class="form-control" id="user_NgaySinh"
														name="user_NgaySinh" placeholder="Ngày/Tháng/Năm"
														type="text" onBlur="validateNgaySinh(user_NgaySinh)"
														onChange="validateNgaySinh(user_NgaySinh)" />

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
									<label for="">MÃ CÁN BỘ</label> <input type="text"
										class="form-control" id="user_MACANBO" name="user_MACANBO"
										onblur="validateRequired(user_MACANBO)">
									<p class="error" id="error_user_MACANBO"></p>
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-4">
								<div class="form-group">
									<label for="">Chức vụ</label> <input type="text"
										class="form-control" id="user_ChucVu" name="user_ChucVu"
										onblur="validateRequired(user_ChucVu)">
									<p class="error" id="error_user_ChucVu"></p>
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-4">
								<div class="form-group">
									<label for="">Quyền sử dụng</label> <input type="text"
										class="form-control" id="user_Quyen" name="user_Quyen"
										onblur="validateRequired(user_Quyen)">
									<p class="error" id="error_user_Quyen"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-sm-6 col-md-4">
								<div class="form-group">
									<label for="">Email</label> <input type="text"
										class="form-control" id="user_Email" name="user_Email"
										onblur="validateRequired(user_Email)">
									<p class="error" id="error_user_Email"></p>
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-4">
								<div class="form-group">
									<label for="">SĐT</label> <input type="text"
										class="form-control" id="user_SDT" name="user_SDT"
										onblur="validateRequired(user_SDT)">
									<p class="error" id="error_user_SDT"></p>
								</div>
							</div>
							<div class="col-12 col-sm-6 col-md-4">

								<div class="form-group">
									<label for="">Trạng thái sử dụng </label><br> <label
										class="switch"> <input name="user_TrangThai"
										id="user_TrangThai" type="checkbox" checked> <span
										class="slider round"></span>
									</label>

									<p class="error" id="error_user_TrangThai"></p>
								</div>
							</div>
						</div>
					
						<div class="controls-edit">
							<button class="btn add">
								HỦY BỎ <i class="fa fa-home"></i>
							</button>
							<button type="submit" class="btn add "
								style="float: right; margin-right: 45px;">
								LƯU <i class="fa fa-home"></i>
							</button>
						</div>
					</form>
				</div>
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
	<script src="CONTENT/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="CONTENT/js/index.js"></script>
	<script src="CONTENT/js/valiedateForm.js"></script>
	<script src="CONTENT/js/DangKyKhaiSinhAjax.js"></script>
	<script>
		var set_height;
		var h;

		set_height = function() {
			$('.header').each(function() {
				// lấy height của chính nó
				var el_height = $(this).height();
				h = $(this).height();
				// gán height cho element
				$(this).css('height', el_height);
			});
		}

		$(window).on(
				'load resize',
				function() {
					document.getElementById("ct").style.paddingTop = $(
							'.header').height()
							+ 'px';
					document.getElementById("ct").style.fontSize = '0';
				});

		$(document).ready(function() {
			var table = $('#example').DataTable();

			$('#example tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});

			$('#button').click(function() {
				table.row('.selected').remove().draw(false);
			});
		});
	</script>
</body>

</html>
<%@page import="Models.CapThanhPhoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.DriverManager"
	import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Models.CapThanhPhoService" %>
<%@page import="DAO.Consts" %>
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
<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<link href="CONTENT/styles/guest/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="CONTENT/styles/guest/HAF.css">
<link rel="stylesheet" type="text/css"
	href="CONTENT/styles/guest/StepOfIndex.css">
</head>
<body>
	<header id="header" class="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="logo-text">
						<p>HOTICH.NET</p>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="search-location">
						<div class="title-search">
							<p>Tỉnh/Thành phố</p>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<%
									CapThanhPhoService ThanhPho = new CapThanhPhoService();
									ResultSet Result = ThanhPho.ShowThanhPho();
									
								%>
								<select class="form-control" onload="CheckSearch()" onmousedown="CheckSearch()" onchange="CheckSearch" id="comboCoQuan"
									name="ComboTHANHPHO">
									
									<%
									if(!Result.wasNull())
									{
										while (Result.next()) {
									%>
									<option value="<%=Result.getString(1)%>"><%=Result.getString(3)%></option>
									<%
										}
									}
									%>
								</select>
							</div>
							<div class="col-sm-3" style="padding: 0%">
						
							<button type="submit" class="btn-default btn-search-location" onmouseover="CheckSearch()"
									onclick="return SearchCoQuan()">Tìm kiếm</button>
								
							</div>
						
						</div>
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
					<p id="bannerCoQuan" class="location"><%=Consts.LocationCap1%></p>
					<p id="CoQuanCap2" class="locationCap2"><%=Consts.LocationCap2%></p>
				</div>
			</div>
			<form action="changelocation">
			<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">CHỌN CƠ QUAN ĐĂNG KÝ HỘ TỊCH</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-12 col-sm-6 col-md-6">
									<div class="form-group">
										<label for="">QUẬN/HUYỆN</label>
										<form action="Tìm Cơ quan">
											<select class="form-control" onload="chgPhuong()" onmousedown="chgPhuong()"  onchange="chgPhuong()" name="modal-quan" id="modal-quan">
																					
											</select>
										</form>

									</div>
								</div>
								
                                 <input type="text" style="display:none" value="" class="form-control" name="id_TP" id="id_TP">
								<div class="col-12 col-sm-6 col-md-6">
									<div class="form-group">
										<label for="">XÃ/PHƯỜNG</label> <select class="form-control"
											id="modal-xaPhuong" name="modal-xaPhuong">
											
										</select>
									</div>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								style="background-color: #004f7e" data-dismiss="modal">Đóng</button>
							
								<button type="submit" type="button" class="btn btn-primary"
								style="background-color: #004f7e" onclick="ChangeLocation()">Tiếp tục</button>
							
							
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			</form>
			<!-- /.modal -->
			<div class="row">
				<div class="col-sm-6">
					<div class="form-switch">
						<div class="title-switch">
							<p>DÀNH CHO CÔNG DÂN</p>
						</div>
						<div class="content-switch">
							<div class="btn-Dang-Ky">
								<form action="CongDan.php">
									<button type="submit" class="btn btn-default btn-dk"
										style="background-color: #004f7e">ĐĂNG KÝ HỘ TỊCH</button>
								</form>
							</div>
							<div class="deprestion">
								<div class="step">
									<a href="javascript:;" class="btn green step-by-step"> <span>
											TÌM CƠ QUAN QUẢN LÝ HỘ TỊCH </span>
									</a>
								</div>
								<div class="step">
									<a href="javascript:;" class="btn red step-by-step"> <span>
											ĐIỀN THÔNG TIN VÀO TỜ KHAI </span>
									</a>
								</div>
								<div class="step">
									<a href="javascript:;" class="btn purple step-by-step"> <span>
											XÁC NHẬN ĐĂNG KÝ HỘ TỊCH</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 login-canBo">
					<div class="form-switch">
						<div class="title-switch">
							<p>DÀNH CHO CÁN BỘ HỘ TỊCH</p>
						</div>
						<form action="DangNhapHeThong" >
						<div class="content-switch">
							
								<div class="form-group" style="margin-top: 5px;">
									<h5 style="color: #004f7e; font-weight: bold">Tên đăng
										nhập</h5>
									<input type="username" class="form-control" name="username"
										id="user">
								</div>
								<div class="form-group">
									<h5 style="color: #004f7e; font-weight: bold">Mật khẩu</h5>
									<input type="password" class="form-control" name="password"
										id="pwd">
								</div>

								<div class="form-group"
									style="margin-top: 5px; margin-bottom: 0">
									<button type="submit" formmethod="get"
										class="btn btn-default btn-dn"
										style="background-color: #004f7e">Đăng nhập</button>
								</div>

								<div class="form-group" style="margin-top: -5px;">
									<a href="#" style="color: #004f7e">Quên mật khẩu người
										dùng? </a>
								</div>

							
						</div>
						</form>

					</div>
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

	<script src="CONTENT/js/guest/index.js"></script>
	
	<script>
	function CheckSearch()
	{
		chgQuan()
	       var vals = document.getElementById("comboCoQuan").value;
		 var element = document.getElementById('id_TP');
		 element.value = vals;
		 
		
	}
	</script>
	

</body>
</html>
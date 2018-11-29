<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="DAO.Consts"%>
<!DOCTYPE html>
<html>
<head>
	<title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="./CONTENT/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<script src="./CONTENT/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="./CONTENT/plugins/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="./CONTENT/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="./CONTENT/plugins/font/montserrat.css">

	
	
	<link rel="stylesheet" href="./CONTENT/plugins/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="./CONTENT/plugins/DataTables/Buttons-1.5.4/css/buttons.dataTables.min.css">
	
    <!--content-->
    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/manage.css">
	<link rel="stylesheet" type="text/css" href="./CONTENT/styles/manageHT.css">
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
        <div class="container-manage">
            <div class="row">
                <div class="header_location">
                  <p id="bannerCoQuan" class="location"><%=Consts.LocationCap1%></p>
					<p id="CoQuanCap2" class="locationCap2"><%=Consts.LocationCap2%></p>
                </div>
            </div>
            <div class="row">
                <!-- Setup 2000px for test amnition-->
                <!--conntent continute-->

				<div class="row tab-control">
					<div class="tab-col">
						<div class="tab-item">
							<a href="QuanLyDangKy" class="tablinks">Hồ sơ</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item  isChoice">
							<a href="QuanLyHoTich" class="tablinks">Hộ tịch</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="#" class="tablinks">Thống kê</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="#" class="tablinks">Người dùng</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="#" class="tablinks">Hệ thống</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="#" class="tablinks">Trợ giúp</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="manageTB.html" class="tablinks notification">
								<span>Thông báo</span>
  								<span class="badge">3</span>
							</a>
						</div>
					</div>
				</div>

                <div class="row manage-content">
                    
					<div id="myFilterContainer" class="row container-filter">
						
						<div class="filter active" onclick="filterSelection(-1)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/126503.png" alt="No image">
								</div>
								<p>Tất cả</p>		
							</div>
						</div>

						<div class="filter" onclick="filterSelection(1)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/icon_KhaiSinh.png" alt="No image">
								</div>
								<p>Khai sinh</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(2)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/kethon.png" alt="No image">
								</div>
								<p>Kết hôn</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(3)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/chungtu.jpg" alt="No image">
								</div>
								<p>Chứng tử</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(4)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/giamho.png" alt="No image">
								</div>
								<p>Giám hộ</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(5)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/iconNhanQuanHe.png" alt="No image">
								</div>
								<p>Nhận quan hệ</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(6)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/NhanConNuoi.jpg" alt="No image">
								</div>
								<p>Nhận con nuôi</p>
							</div>
						</div>

						<div class="filter" onclick="filterSelection(7)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/breakMarrry.png" alt="No image">
								</div>
								<p>Ly hôn</p>
							</div>
						</div>
						
						
						<div class="filter" onclick="filterSelection(8)">
							<div class="filter-content">
								<div class="filter-img">
									<img src="./CONTENT/image/trichluc.png" alt="No image">
								</div>
								<p>Bản sao</p>
							</div>
						</div>
					</div>
					<!--Table mau tự code -->
					
					<table id="table_id" class="table" style="width: 100%">
						<thead>
								<tr style="display: table-row">
  						      		<th class="col-stt">STT</th>
  						      		<th class="col-ma">ID Hộ tịch</th>
  						      		<th class="col-ma">ID Giấy tờ</th>
  						      		<th class="col-ma">ID Hồ sơ đăng ký</th>
  						      		<th class="col-ma">ID Cơ quan</th>
  						      		<th class="col-ma">ID Loại giấy tờ</th>
  						      		<th class="col-ma">Mã hộ tịch</th>
  						      		<th class="col-ma">Số quyển</th>
  						      		<th class="col-ngay">Ngày hiệu lực</th>
  						      		<th class="col-canbo">Người xử lý</th>
  						      		<th class="col-canbo">Người kí</th>
  						      		<th class="col-tacvu">Tác vụ</th>
  						    	</tr>
						</thead>
						<tfoot>
								<tr style="display: table-row">
  						      		<th class="col-stt"></th>
  						      		<th class="col-ma"></th>
  						      		<th class="col-ma"></th>
  						      		<th class="col-ma"></th>
  						      		<th class="col-ma"></th>
  						      		<th class="col-ma"></th>
  						      		<th class="search col-ma">mã giấy</th>
  						      		<th class="search col-ma">số quyển hộ tịch</th>
  						      		<th class="search col-ngay">ngày hiệu lực</th>
  						      		<th class="search col-canbo">cán bộ xử lý</th>
  						      		<th class="search col-canbo">cán hộ ký</th>
  						      		<th class="col-tacvu"></th>
  						    	</tr>
						</tfoot>
					</table>
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
                        <p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer-->
	<script src="./CONTENT/plugins/DataTables/jQuery-3.3.1/jquery-3.3.1.js"></script>
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"></script>
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/dataTables.bootstrap4.js"></script>
	<!--	button-->
	<script src="./CONTENT/plugins/DataTables/Buttons-1.5.4/js/dataTables.buttons.min.js"></script>
	<script src="./CONTENT/plugins/DataTables/JSZip-2.5.0/jszip.min.js"></script>
	<script src="./CONTENT/plugins/DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
	<script src="./CONTENT/plugins/DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
	<script src="./CONTENT/plugins/DataTables/Buttons-1.5.4/js/buttons.html5.min.js"></script>
	<!--	/button-->
    <script src="./CONTENT/js/Header.js"></script>
	<script src="./CONTENT/js/manageHT.js"></script>
</body>
</html>
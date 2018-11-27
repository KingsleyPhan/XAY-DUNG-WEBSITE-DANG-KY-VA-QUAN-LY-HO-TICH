<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
	
	<link rel="stylesheet" href="./CONTENT/plugins/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"></script>
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
	

    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/manage.css">
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
                <!-- Setup 2000px for test amnition-->
                <!--conntent continute-->

				<div class="row tab-control">
					<div class="tab-col">
						<div class="tab-item isChoice">
							<a href="manage.html" class="tablinks">Hồ sơ</a>
						</div>
					</div>
					<div class="tab-col">
						<div class="tab-item">
							<a href="manageHT.html" class="tablinks">Hộ tịch</a>
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
					<div class="row container-table">          
  						<table id="table_id" class="table">
							<thead>
  						    	<tr style="display: table-row">
  						      		<th class="col-stt">STT</th>
  						      		<th class="col-ma">ID hồ sơ đăng kí</th>
  						      		<th class="col-noidung">Nội dung hộ tịch</th>
  						      		<th class="col-ma">Mã hồ sơ đăng kí</th>
  						      		<th class="col-ngay">Ngày đăng kí</th>
  						      		<th class="col-ngay">Ngày hết hạn xử lý</th>
  						      		<th class="col-ma">Loại giấy tờ</th>
  						      		<th class="col-tacvu">Tác vụ</th>
  						    	</tr>
  						  	</thead>
  						  	
  						</table>
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
                        <p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer-->

    <script src="./CONTENT/js/Header.js"></script>
	<script src="./CONTENT/js/manage.js"></script>
</body>
</html>
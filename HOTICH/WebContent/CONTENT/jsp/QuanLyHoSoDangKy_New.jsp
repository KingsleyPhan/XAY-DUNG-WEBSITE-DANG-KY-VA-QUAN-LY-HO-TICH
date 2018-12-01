<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOTICH.NET</title>
	<!-- Bootstrap core CSS     -->
    <link href="./CONTENT/template/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="./CONTENT/template/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="./CONTENT/template/css/paper-dashboard.css" rel="stylesheet"/>
    
    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="./CONTENT/template/css/themify-icons.css" rel="stylesheet">
    
    
    
    <link rel="stylesheet" href="./CONTENT/plugins/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">

	
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="./CONTENT/template/css/demo.css" rel="stylesheet" />
    
    <link href="./CONTENT/styles/QuanLyHoSoDangKy.css" rel="stylesheet"/>
    
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    HOTICH.NET
                </a>
            </div>

            <ul class="nav">
                <li class="active">
                    <a href="dashboard.html">
                        <i class="ti-write"></i>
                        <p>ĐĂNG KÝ</p>
                    </a>
                </li>
                <li >
                    <a href="user.html">
                        <i class="ti-bookmark-alt"></i>
                        <p>HỘ TỊCH</p>
                    </a>
                </li>
                <li>
                    <a href="table.html">
                        <i class="ti-pie-chart"></i>
                        <p>THỐNG KÊ</p>
                    </a>
                </li>
                <li>
                    <a href="typography.html">
                        <i class="ti-user"></i>
                        <p>NGƯỜI DÙNG</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="ti-pencil-alt2"></i>
                        <p>TRỢ GIÚP</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>THÔNG BÁO</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-defaults navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Quản lý hồ sơ đăng ký</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="ti-bell"></i>
                                <p class="notification">5</p>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./CONTENT/template/img/user.png" class="img-circle" alt="Avatar"> <span>Samuel</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<li>
                            <a href="#">
								<i class="ti-settings"></i>
								<p>Settings</p>
                            </a>
                        </li>
						
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content select-loai">
                                <div class="row">
                                    <div class="col-xs-3" style="padding: 0">
                                        <div class="numbers">
											Giấy  
										</div>
                                    </div>
                                    <div class="col-xs-9">
                                    	<select class="form-control loai-giay" id="loai-giay" onchange="showChange()">
                                    		<option value="-1">Khai sinh</option>
    										<option value="1">Khai sinh</option>
    										<option value="2">Kết hôn</option>
    										<option value="3">Chứng tử</option>
    										<option value="4">Trích lục</option>
  										</select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
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
        </div>
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
							<p>Copyright (C) <script>document.write(new Date().getFullYear())</script> HOTICH.NET</p>
							<p>Phát triển bởi Phan Văn Phước Thịnh - Huỳnh Lê Hữu Hưng</p>
							<p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
    </div>
</div>

</body>

	<script src="./CONTENT/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="./CONTENT/plugins/jquery/jquery-3.3.1.min.js"></script>
    
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="./CONTENT/template/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="./CONTENT/template/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="./CONTENT/template/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="./CONTENT/template/js/paper-dashboard.js"></script>
	
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"></script>
	<script src="./CONTENT/plugins/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
	
	<!-- File .js cho datatable -->
	<script type="text/javascript" src="./CONTENT/js/QuanLyHoSoDangKy.js"></script>
	
	<script type="text/javascript">
    	$(document).ready(function(){

        	demo.initChartist();

        	$.notify({
            	icon: 'ti-gift',
            	message: "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

            },{
                type: 'success',
                timer: 4000
            });

    	});
	</script>
</html>
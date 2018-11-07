<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="motel.database"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HOTICH.NET</title>
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
     

<!--Bootstrap -->
<!-- 
	<link rel="stylesheet" href="page/plugins/bootstrap-4.1.3-dist/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="page/plugins/bootstrap-4.1.3-dist/css/bootstrap.min.css">
	
	<script src="page/plugins/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
 -->	
	<!--Jquery-->
	<script src="page/plugins/jquery/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="page/styles/main.css">
    <link rel="stylesheet" type="text/css" href="page/styles/HAF.css">
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
                <div class="col-sm-9">
                    <div class="search-location">
                        <div class="title-search">
                            <p>Tỉnh/Thành phố</p>
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
                    <p> HỆ THỐNG ĐĂNG KÝ VÀ QUẢN LÝ HỘ TỊCH ONLINE</p>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-switch">
                        <div class="title-switch">
                            <p>DÀNH CHO CÔNG DÂN</p>
                        </div>
                        <style>
                            .step:hover
                            {
                              transition: 0.2s;
                               width: 100%;
                               margin: auto;
                               height: 50px;
                               margin-bottom: 10px;
                               cursor: context-menu;
                               
                            }
                            .step p:hover
                            {
                                transition: 0.2s;
                                color: #004f7e;
                                font-size: 18px;
                                margin-top: -1px;
                                font-weight: bold;
                            }
                        </style>
                        <div class="content-switch">
                            <div class="btn-Dang-Ky">
                            <form action="view" method="POST">
                                <button type="submit" class="btn btn-default btn-dk" style="background-color: #004f7e">ĐĂNG
                                    KÝ HỘ TỊCH</button>
                            </form>
                            </div>
                            <div class="deprestion">
                                <div class="step">
                                    <p>
                                        Chọn cơ quan đăng ký hộ tịch
                                    </p>
                                </div>
                                <div class="step">
                                    <p>
                                        Chọn và điền thông tin hộ tịch
                                    </p>

                                </div>
                                <div class="step">
                                    <p>
                                        Xác nhận đăng ký
                                    </p>

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
                        <style>

                        </style>
                        <div class="content-switch">
                            <form class="form-Dang-Nhap" action="login" method="POST">
                                <div class="form-group" style="margin-top: 5px;">
                                    <h5 style="color:#004f7e; font-weight: bold">Tên đăng nhập</h5>
                                    <input type="username" name ="username" class="form-control" id="user" required="true">
                                </div>
                                <div class="form-group">
                                    <h5 style="color:#004f7e; font-weight: bold">Mật khẩu</h5>
                                    <input type="password" name = "password" class="form-control" id="pwd" required="true">
                                </div>

                                <div class="form-group" style="margin-top: 5px; margin-bottom: 0">
                                    <button type="submit" class="btn btn-default btn-dn" style="background-color: #004f7e">Đăng
                                        nhập</button>
                                </div>

                                <div class="form-group" style="margin-top: -5px;">
                                    <a href="#" style="color:#004f7e">Quên mật khẩu người dùng? </a>
                                </div>

                            </form>
                        </div>

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
    <script src="page/plugins/scrollmagic/ScrollMagic.min.js"></script>
    
    <script>
        var set_height;
        var h;

        set_height = function () {
            $('.header').each(function () {
                // lấy height của chính nó
                var el_height = $(this).height();
                h = $(this).height();
                // gán height cho element
                $(this).css('height', el_height);
            });
        }

        $(window).on('load resize', function () {
            document.getElementById("ct").style.paddingTop = $('.header').height() + 'px';
            document.getElementById("ct").style.fontSize = '0';
        });


    </script>
</body>


</html>